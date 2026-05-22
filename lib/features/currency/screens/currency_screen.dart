import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../services/currency_service.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController amountController = TextEditingController();

  String from = "USD";

  String to = "INR";

  double result = 0;

  bool isLoading = false;

  final currencies = [
    "USD",
    "INR",
    "EUR",
    "GBP",
    "JPY",
    "CAD",
    "AUD",
    "CHF",
    "CNY",
    "SGD",
    "AED",
    "SAR",
    "NZD",
    "ZAR",
    "RUB",
    "HKD",
    "KRW",
    "THB",
    "MYR",
    "PKR",
    "BDT",
    "LKR",
    "NPR",
  ];

  Future<void> convert() async {
    if (amountController.text.isEmpty) {
      return;
    }

    final amount = double.tryParse(amountController.text) ?? 0;

    setState(() {
      isLoading = true;
    });

    result = await CurrencyService.convertCurrency(
      from: from,
      to: to,
      amount: amount,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currency Converter")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: amountController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(labelText: "Amount"),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: DropdownSearch<String>(
                    items: currencies,

                    selectedItem: from,

                    popupProps: PopupProps.menu(
                      showSearchBox: true,

                      fit: FlexFit.loose,

                      emptyBuilder: (context, searchEntry) {
                        return const Center(child: Text("No currency found"));
                      },

                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Search currency",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),

                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "From",
                      ),
                    ),

                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        from = value;

                        result = 0;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownSearch<String>(
                    items: currencies,

                    selectedItem: to,

                    popupProps: PopupProps.menu(
                      showSearchBox: true,

                      fit: FlexFit.loose,

                      emptyBuilder: (context, searchEntry) {
                        return const Center(child: Text("No currency found"));
                      },

                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Search currency",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),

                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "To",
                      ),
                    ),

                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        to = value;

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

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Convert"),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "${result.toStringAsFixed(2)} $to",

              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
