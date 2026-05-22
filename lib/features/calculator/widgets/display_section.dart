import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

        inputFormatters: [

          FilteringTextInputFormatter.allow(

            RegExp(
              r'[0-9+\-×÷%^().πa-zA-Z]',
            ),
          ),
        ],

        onChanged: (value) {

          // REMOVE DOUBLE OPERATORS

          final cleaned =
          value.replaceAllMapped(

            RegExp(
              r'([\+\-\×\÷\%\^]){2,}',
            ),

                (match) {

              return match
                  .group(0)![0];
            },
          );

          if (cleaned != value) {

            controller.text =
                cleaned;

            controller.selection =
                TextSelection.collapsed(

                  offset:
                  cleaned.length,
                );
          }
        },
      ),
    );
  }
}