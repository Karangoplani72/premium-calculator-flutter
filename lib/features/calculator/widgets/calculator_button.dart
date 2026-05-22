import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color color;
  final Color textColor;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    HapticFeedback.lightImpact();
    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.12),

              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Center(
          child: Text(
            text,

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
