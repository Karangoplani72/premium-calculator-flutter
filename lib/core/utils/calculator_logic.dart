import '../../features/history/models/history_item.dart';
import '../../features/scientific/services/scientific_service.dart';
class CalculatorLogic {
  String output = "0";
  String expression = "";
  String _current = "";

  List<HistoryItem> history = [];

  void buttonPressed(String value) {
    // CLEAR
    if (value == "AC") {
      _reset();
      return;
    }
    if (value == "⌫") {

      if (_current.isNotEmpty) {

        _current =
            _current.substring(
              0,
              _current.length - 1,
            );

        if (_current.isEmpty) {

          output = "0";

          expression = "";

        } else {

          output = _current;

          expression = _current;
        }
      }

      return;
    }
    // DECIMAL
    if (value == ".") {
      if (_current.contains(".")) {
        return;
      }

      if (_current.isEmpty) {
        _current = "0.";
      } else {
        _current += ".";
      }

      output = _current;
      expression = _current;
      return;
    }

    // EVALUATE EXPRESSION
    if (value == "=") {
      try {
        String expString = _current;

        expString = expString
            .replaceAll("×", "*")
            .replaceAll("÷", "/")
            .replaceAll("π", "3.14159265359")
            .replaceAll("√", "sqrt");

        output =
            ScientificService.calculate(
              _current,
            );
        expression = _current;

        history.insert(0, HistoryItem(expression: _current, result: output));

        _current = output;
      } catch (e) {
        output = "Error";
      }

      return;
    }

    // PREVENT MULTIPLE LEADING ZEROS
    if (_current == "0" && value == "0") {
      return;
    }

    // NUMBER INPUT
    if (value == "sin" ||
        value == "cos" ||
        value == "tan" ||
        value == "log" ||
        value == "ln") {
      _current += "$value(";
    } else if (value == "√") {
      _current += "sqrt(";
    } else if (value == "π") {
      _current += "π";
    } else {

      final operators = [

        "+",
        "-",
        "×",
        "÷",
        "%",
        "^",
      ];

      final lastChar =

      _current.isNotEmpty
          ? _current[
      _current.length - 1
      ]
          : "";

      if (

      operators.contains(value) &&

          operators.contains(lastChar)

      ) {

        return;
      }

      if (_current == "0") {

        _current = value;

      } else {

        _current += value;
      }
    }

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
