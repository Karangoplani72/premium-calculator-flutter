import 'package:flutter/material.dart';

class DisplaySection extends StatelessWidget {

  final TextEditingController controller;

  const DisplaySection({

    super.key,

    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(20),

      alignment: Alignment.bottomRight,

      child: TextField(

        controller: controller,

        autofocus: true,

        showCursor: true,

        textAlign: TextAlign.right,

        style: const TextStyle(

          fontSize: 42,

          fontWeight: FontWeight.w500,
        ),

        decoration: const InputDecoration(

          border: InputBorder.none,
        ),

        keyboardType:
        TextInputType.none,
      ),
    );
  }
}