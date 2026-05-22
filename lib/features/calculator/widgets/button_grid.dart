import 'package:flutter/material.dart';

import 'calculator_button.dart';

class ButtonGrid extends StatelessWidget {
  final Function(String) onPressed;
  final bool isScientific;
  const ButtonGrid({super.key, required this.onPressed, required this.isScientific});

  @override
  Widget build(BuildContext context) {
    final List<String> basicButtons = [
      "AC",
      "%",
      "⌫",
      "÷",

      "7",
      "8",
      "9",
      "×",

      "4",
      "5",
      "6",
      "-",

      "1",
      "2",
      "3",
      "+",

      "00",
      "0",
      ".",
      "=",
    ];

    final List<String> scientificButtons = [
      "sin",
      "cos",
      "tan",
      "rad",
      "deg",

      "log",
      "ln",
      "(",
      ")",
      "inv",

      "!",
      "^",
      "√",
      "π",
      "e",
    ];

    return Padding(
      padding: const EdgeInsets.all(12),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          if (isScientific)
            GridView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: scientificButtons.length,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,

                childAspectRatio: 1.28,

                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),

              itemBuilder: (context, index) {
                final button = scientificButtons[index];

                return CalculatorButton(
                  text: button,

                  color: _getButtonColor(context, button),

                  textColor: _getTextColor(context, button),

                  onTap: () => onPressed(button),
                );
              },
            ),

          if (isScientific) const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,

            physics: const NeverScrollableScrollPhysics(),

            itemCount: basicButtons.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,

              childAspectRatio: 1.28,

              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),

            itemBuilder: (context, index) {
              final button = basicButtons[index];

              return CalculatorButton(
                text: button,

                color: _getButtonColor(context, button),

                textColor: _getTextColor(context, button),

                onTap: () => onPressed(button),
              );
            },
          ),
        ],
      ),
    );
  }

  bool _isOperator(String value) {
    return ["+", "-", "×", "÷", "="].contains(value);
  }

  Color _getButtonColor(BuildContext context, String button) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (button == "=") {
      return Colors.orange;
    }

    if (button == "AC") {
      return Colors.redAccent;
    }

    if (_isOperator(button)) {
      return Colors.deepPurple;
    }

    return isDark ? const Color(0xFF1E1E1E) : Colors.white;
  }

  Color _getTextColor(BuildContext context, String button) {
    if (_isOperator(button) || button == "=" || button == "AC") {
      return Colors.white;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark ? Colors.white : Colors.black;
  }
}
