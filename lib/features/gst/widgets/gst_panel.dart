import 'package:flutter/material.dart';

class GstPanel extends StatefulWidget {

  const GstPanel({super.key});

  @override
  State<GstPanel> createState() =>
      _GstPanelState();
}

class _GstPanelState
    extends State<GstPanel> {

  final TextEditingController controller =
  TextEditingController();

  double selectedGST = 18;

  bool isInclusive = false;

  double gstAmount = 0;

  double finalAmount = 0;

  double cgst = 0;

  double sgst = 0;

  void calculateGST() {

    final amount =
        double.tryParse(
          controller.text,
        ) ?? 0;

    if (amount <= 0) {

      setState(() {

        gstAmount = 0;

        finalAmount = 0;

        cgst = 0;

        sgst = 0;
      });

      return;
    }

    if (isInclusive) {

      final original =
          amount * 100 /
              (100 + selectedGST);

      gstAmount =
          amount - original;

      finalAmount = amount;
    }

    else {

      gstAmount =
          amount *
              selectedGST /
              100;

      finalAmount =
          amount + gstAmount;
    }

    cgst = gstAmount / 2;

    sgst = gstAmount / 2;

    setState(() {});
  }

  Widget buildChip(double value) {

    final isSelected =
        selectedGST == value;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedGST = value;
        });

        calculateGST();
      },

      child: Container(

        padding: const EdgeInsets.symmetric(

          horizontal: 18,
          vertical: 12,
        ),

        decoration: BoxDecoration(

          color: isSelected
              ? Colors.orange
              : Colors.grey.shade200,

          borderRadius:
          BorderRadius.circular(16),
        ),

        child: Text(

          "${value.toInt()}%",

          style: TextStyle(

            color: isSelected
                ? Colors.white
                : Colors.black,

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget resultTile(
      String title,
      double value,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color:
        Theme.of(context)
            .brightness ==
            Brightness.dark
            ? const Color(0xFF1A1A1A)
            : Colors.white,

        borderRadius:
        BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withValues(
              alpha: 0.05,
            ),

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(

            title,

            style: const TextStyle(

              fontSize: 16,

              fontWeight:
              FontWeight.w600,
            ),
          ),

          Text(

            "₹ ${value.toStringAsFixed(2)}",

            style: const TextStyle(

              fontSize: 18,

              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(20),

      child: Column(

        children: [

          TextField(

            controller: controller,

            keyboardType:
            TextInputType.number,

            onChanged: (_) =>
                calculateGST(),

            decoration: InputDecoration(

              labelText: "Enter Amount",

              prefixText: "₹ ",

              border: OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Wrap(

            spacing: 12,

            runSpacing: 12,

            children: [

              buildChip(3),

              buildChip(5),

              buildChip(12),

              buildChip(18),

              buildChip(28),
            ],
          ),

          const SizedBox(height: 24),

          Row(

            children: [

              Expanded(

                child: GestureDetector(

                  onTap: () {

                    setState(() {

                      isInclusive = false;
                    });

                    calculateGST();
                  },

                  child: Container(

                    padding:
                    const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: !isInclusive
                          ? Colors.orange
                          : Colors.grey.shade300,

                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Text(

                      "Exclusive",

                      textAlign:
                      TextAlign.center,

                      style: TextStyle(

                        color: !isInclusive
                            ? Colors.white
                            : Colors.black,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(

                child: GestureDetector(

                  onTap: () {

                    setState(() {

                      isInclusive = true;
                    });

                    calculateGST();
                  },

                  child: Container(

                    padding:
                    const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: isInclusive
                          ? Colors.orange
                          : Colors.grey.shade300,

                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Text(

                      "Inclusive",

                      textAlign:
                      TextAlign.center,

                      style: TextStyle(

                        color: isInclusive
                            ? Colors.white
                            : Colors.black,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          resultTile(
            "GST Amount",
            gstAmount,
          ),

          resultTile(
            "CGST",
            cgst,
          ),

          resultTile(
            "SGST",
            sgst,
          ),

          resultTile(
            "Final Amount",
            finalAmount,
          ),
        ],
      ),
    );
  }
}