import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final controller = TextEditingController();

  String from = "Celsius";

  String to = "Fahrenheit";

  double result = 0;

  final units = ["Celsius", "Fahrenheit", "Kelvin"];

  void convert() {
    final value = double.tryParse(controller.text) ?? 0;

    double celsius = value;

    if (from == "Fahrenheit") {
      celsius = (value - 32) * 5 / 9;
    } else if (from == "Kelvin") {
      celsius = value - 273.15;
    }

    if (to == "Fahrenheit") {
      result = (celsius * 9 / 5) + 32;
    } else if (to == "Kelvin") {
      result = celsius + 273.15;
    } else {
      result = celsius;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Temperature Converter")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: controller,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(labelText: "Enter Value"),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: from,

                    items: units.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        from = value!;

                        result = 0;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownButtonFormField(
                    initialValue: to,

                    items: units.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        to = value!;

                        result = 0;
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
              result.toStringAsFixed(2),

              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
