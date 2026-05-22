import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A) : Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Text(
        result,

        textAlign: TextAlign.center,

        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
