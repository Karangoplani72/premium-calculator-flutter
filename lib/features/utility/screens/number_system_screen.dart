import 'package:flutter/material.dart';

class NumberSystemScreen extends StatefulWidget {
  const NumberSystemScreen({super.key});

  @override
  State<NumberSystemScreen> createState() => _NumberSystemScreenState();
}

class _NumberSystemScreenState extends State<NumberSystemScreen> {
  final TextEditingController controller = TextEditingController();

  String from = "Decimal";

  String to = "Binary";

  String result = "";

  final systems = ["Binary", "Decimal", "Octal", "Hexadecimal"];

  int _getRadix(String type) {
    switch (type) {
      case "Binary":
        return 2;

      case "Octal":
        return 8;

      case "Hexadecimal":
        return 16;

      default:
        return 10;
    }
  }

  void convert() {
    try {
      final fromRadix = _getRadix(from);

      final toRadix = _getRadix(to);

      final decimal = int.parse(controller.text, radix: fromRadix);

      result = decimal.toRadixString(toRadix).toUpperCase();

      setState(() {});
    } catch (e) {
      result = "Invalid Input";

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Number System")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: controller,

              decoration: const InputDecoration(labelText: "Enter Value"),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: from,

                    items: systems.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        from = value!;

                        result = "";
                      });
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: to,

                    items: systems.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        to = value!;

                        result = "";
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: convert,

                child: const Text("Convert"),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              result,

              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
