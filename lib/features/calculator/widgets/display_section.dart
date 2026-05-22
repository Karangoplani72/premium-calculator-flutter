import 'package:flutter/material.dart';

class DisplaySection extends StatelessWidget {
  final String value;

  const DisplaySection({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,

      padding: const EdgeInsets.all(24),

      child: FittedBox(
        fit: BoxFit.scaleDown,

        child: Text(
          value,

          maxLines: 1,

          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
