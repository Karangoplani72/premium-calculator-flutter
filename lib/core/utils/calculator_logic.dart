import 'package:flutter/material.dart';

import '../../features/history/models/history_item.dart';

import '../../features/scientific/services/scientific_service.dart';

class CalculatorLogic {

  String output = "0";

  String expression = "";

  String _current = "";

  List<HistoryItem> history = [];

  void buttonPressed(

      String value,

      TextEditingController controller,

      ) {

    final text =
        controller.text;

    final selection =
        controller.selection;

    final cursorPos =
        selection.baseOffset;

    _current = text;

    final operators = [

      "+",
      "-",
      "×",
      "÷",
      "%",
      "^",
    ];

    // CLEAR
    if (value == "AC") {

      _reset();

      controller.text = "";

      controller.selection =
      const TextSelection.collapsed(
        offset: 0,
      );

      return;
    }

    // BACKSPACE
    if (value == "⌫") {

      if (

      cursorPos > 0 &&

          text.isNotEmpty

      ) {

        final newText =

        text.replaceRange(

          cursorPos - 1,

          cursorPos,

          "",
        );

        controller.text =
            newText;

        controller.selection =
            TextSelection.collapsed(

              offset:
              cursorPos - 1,
            );

        _current =
            controller.text;

        output =
        _current.isEmpty
            ? "0"
            : _current;
      }

      return;
    }

    // DECIMAL VALIDATION
    if (value == ".") {

      String lastNumber = "";

      for (

      int i =
          cursorPos - 1;

      i >= 0;

      i--

      ) {

        if (

        operators.contains(
          text[i],
        )

        ) {

          break;
        }

        lastNumber =
            text[i] +
                lastNumber;
      }

      if (

      lastNumber.contains(".")
      ) {

        return;
      }
    }

    // EQUALS
    if (value == "=") {

      try {

        output =
            ScientificService.calculate(
              _current,
            );

        history.insert(

          0,

          HistoryItem(

            expression:
            _current,

            result: output,
          ),
        );

        controller.text =
            output;

        controller.selection =
            TextSelection.collapsed(

              offset:
              output.length,
            );

        _current = output;

      } catch (e) {

        output = "Error";
      }

      return;
    }

    // OPERATOR VALIDATION
    final lastChar =

    cursorPos > 0
        ? text[cursorPos - 1]
        : "";

    final isSingleOperator =

        value.length == 1 &&
            operators.contains(value);

    if (

    isSingleOperator &&

        operators.contains(lastChar)

    ) {

      return;
    }

    // SCIENTIFIC BUTTONS
    if (

    value == "sin" ||

        value == "cos" ||

        value == "tan" ||

        value == "log" ||

        value == "ln"

    ) {

      value = "$value(";
    }

    if (value == "√") {

      value = "sqrt(";
    }

    // INSERT AT CURSOR

    String insertValue = value;


    // REMOVE LEADING OPERATOR
    // ONLY FOR PASTED EXPRESSIONS

    if (

    insertValue.length > 1 &&

        operators.contains(
          insertValue[0],
        ) &&

        RegExp(r'\d').hasMatch(

          insertValue.substring(1),
        )

    ) {

      insertValue =
          insertValue.substring(1);
    }


    final newText =

    text.replaceRange(

      cursorPos,

      cursorPos,

      insertValue,
    );

    controller.text = newText;

    controller.selection =
        TextSelection.collapsed(

          offset:
          cursorPos +
              insertValue.length,
        );

    _current =
        controller.text;

    output = _current;
  }

  void _reset() {

    output = "0";

    _current = "";
  }

  void clearHistory() {

    history.clear();
  }
}