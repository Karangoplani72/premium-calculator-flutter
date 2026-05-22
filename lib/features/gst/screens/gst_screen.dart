import 'package:flutter/material.dart';

import '../../../shared/widgets/app_convert_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/result_card.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({super.key});

  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  final TextEditingController amountController = TextEditingController();

  final TextEditingController gstController = TextEditingController();

  double gstAmount = 0;

  double finalAmount = 0;

  void calculateGST() {
    final amount = double.tryParse(amountController.text) ?? 0;

    final gst = double.tryParse(gstController.text) ?? 0;

    gstAmount = (amount * gst) / 100;

    finalAmount = amount + gstAmount;

    setState(() {});
  }

  void removeGST() {
    final total = double.tryParse(amountController.text) ?? 0;

    final gst = double.tryParse(gstController.text) ?? 0;

    final original = total * 100 / (100 + gst);

    gstAmount = total - original;

    finalAmount = original;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GST Calculator")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            AppTextField(controller: amountController, hint: "Enter Amount"),

            const SizedBox(height: 20),

            AppTextField(controller: gstController, hint: "Enter GST %"),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(child: AppConvertButton(onTap: calculateGST)),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    onPressed: removeGST,

                    child: const Text("Remove GST"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            ResultCard(result: "GST: ${gstAmount.toStringAsFixed(2)}"),

            const SizedBox(height: 20),

            ResultCard(result: "Final: ${finalAmount.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
