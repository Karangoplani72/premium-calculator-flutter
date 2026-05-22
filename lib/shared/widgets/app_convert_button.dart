import 'package:flutter/material.dart';

class AppConvertButton extends StatelessWidget {
  final VoidCallback onTap;

  const AppConvertButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      height: 55,

      child: ElevatedButton(
        onPressed: onTap,

        child: const Text("Convert", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
