import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hint;

  const AppTextField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        labelText: hint,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
