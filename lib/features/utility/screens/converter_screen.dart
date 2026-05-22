import 'package:flutter/material.dart';
import '../../../shared/widgets/app_convert_button.dart';
import '../../../shared/widgets/app_dropdown.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/result_card.dart';
import '../models/converter_model.dart';

class ConverterScreen extends StatefulWidget {
  final String title;
  final List<ConverterModel> units;
  const ConverterScreen({super.key, required this.title, required this.units});
  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController controller = TextEditingController();
  late ConverterModel fromUnit;
  late ConverterModel toUnit;
  double result = 0;
  @override
  void initState() {
    super.initState();
    fromUnit = widget.units.first;
    toUnit = widget.units[1];
  }

  void convert() {
    final input = double.tryParse(controller.text) ?? 0;
    final baseValue = input * fromUnit.factor;
    result = baseValue / toUnit.factor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(controller: controller, hint: "Enter Value"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AppDropdown<ConverterModel>(
                    value: fromUnit,
                    items: widget.units,
                    labelBuilder: (unit) => unit.name,
                    onChanged: (value) {
                      setState(() {
                        fromUnit = value!;
                        result = 0;
                      });
                    },
                  ),
                ),
                IconButton(

                  onPressed: () {

                    setState(() {

                      final temp = fromUnit;

                      fromUnit = toUnit;

                      toUnit = temp;

                      result = 0;
                    });
                  },

                  icon: const Icon(
                    Icons.swap_horiz,
                  ),
                ),

                const SizedBox(width: 6),
                Expanded(
                  child: AppDropdown<ConverterModel>(
                    value: toUnit,
                    items: widget.units,
                    labelBuilder: (unit) => unit.name,
                    onChanged: (value) {
                      setState(() {
                        toUnit = value!;
                        result = 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            AppConvertButton(onTap: convert),
            const SizedBox(height: 30),
            ResultCard(result: result.toStringAsFixed(4)),
          ],
        ),
      ),
    );
  }
}
