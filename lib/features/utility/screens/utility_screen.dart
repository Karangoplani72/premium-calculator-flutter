import 'package:flutter/material.dart';

import 'temperature_screen.dart';
import 'number_system_screen.dart';

import '../../currency/screens/currency_screen.dart';

import '../models/converter_model.dart';

import 'converter_screen.dart';

class UtilityScreen extends StatefulWidget {

  const UtilityScreen({super.key});

  @override
  State<UtilityScreen> createState() =>
      _UtilityScreenState();
}

class _UtilityScreenState
    extends State<UtilityScreen> {

  final TextEditingController
  searchController =
  TextEditingController();

  String searchQuery = "";

  void _openConverter(

      BuildContext context, {

        required String title,

        required List<ConverterModel> units,
      }) {

    Navigator.push(

      context,

      PageRouteBuilder(

        pageBuilder:
            (_, animation, secondaryAnimation) {

          return ConverterScreen(

            title: title,

            units: units,
          );
        },

        transitionsBuilder:
            (_, animation, secondaryAnimation, child) {

          return FadeTransition(

            opacity: animation,

            child: child,
          );
        },
      ),
    );
  }

  List<ConverterModel> _getLengthUnits() {

    return [

      ConverterModel(
        name: "Meter",
        factor: 1,
      ),

      ConverterModel(
        name: "Kilometer",
        factor: 1000,
      ),

      ConverterModel(
        name: "Centimeter",
        factor: 0.01,
      ),

      ConverterModel(
        name: "Millimeter",
        factor: 0.001,
      ),

      ConverterModel(
        name: "Inch",
        factor: 0.0254,
      ),

      ConverterModel(
        name: "Foot",
        factor: 0.3048,
      ),
    ];
  }

  List<ConverterModel> _getAreaUnits() {

    return [

      ConverterModel(
        name: "Square Meter",
        factor: 1,
      ),

      ConverterModel(
        name: "Square Kilometer",
        factor: 1000000,
      ),

      ConverterModel(
        name: "Square Centimeter",
        factor: 0.0001,
      ),

      ConverterModel(
        name: "Square Millimeter",
        factor: 0.000001,
      ),

      ConverterModel(
        name: "Hectare",
        factor: 10000,
      ),

      ConverterModel(
        name: "Acre",
        factor: 4046.8564224,
      ),

      ConverterModel(
        name: "Square Foot",
        factor: 0.092903,
      ),

      ConverterModel(
        name: "Square Inch",
        factor: 0.00064516,
      ),
    ];
  }

  List<ConverterModel> _getWeightUnits() {

    return [

      ConverterModel(
        name: "Kilogram",
        factor: 1,
      ),

      ConverterModel(
        name: "Gram",
        factor: 0.001,
      ),

      ConverterModel(
        name: "Milligram",
        factor: 0.000001,
      ),

      ConverterModel(
        name: "Pound",
        factor: 0.453592,
      ),

      ConverterModel(
        name: "Ounce",
        factor: 0.0283495,
      ),

      ConverterModel(
        name: "Ton",
        factor: 1000,
      ),
    ];
  }

  List<ConverterModel> _getVolumeUnits() {

    return [

      ConverterModel(
        name: "Liter",
        factor: 1,
      ),

      ConverterModel(
        name: "Milliliter",
        factor: 0.001,
      ),

      ConverterModel(
        name: "Cubic Meter",
        factor: 1000,
      ),

      ConverterModel(
        name: "Cubic Centimeter",
        factor: 0.001,
      ),

      ConverterModel(
        name: "Gallon",
        factor: 3.78541,
      ),

      ConverterModel(
        name: "Pint",
        factor: 0.473176,
      ),
    ];
  }

  List<ConverterModel> _getSpeedUnits() {

    return [

      ConverterModel(
        name: "Meter/Second",
        factor: 1,
      ),

      ConverterModel(
        name: "Kilometer/Hour",
        factor: 0.277778,
      ),

      ConverterModel(
        name: "Mile/Hour",
        factor: 0.44704,
      ),

      ConverterModel(
        name: "Knot",
        factor: 0.514444,
      ),
    ];
  }

  List<ConverterModel> _getPressureUnits() {

    return [

      ConverterModel(
        name: "Pascal",
        factor: 1,
      ),

      ConverterModel(
        name: "Bar",
        factor: 100000,
      ),

      ConverterModel(
        name: "PSI",
        factor: 6894.76,
      ),

      ConverterModel(
        name: "Atmosphere",
        factor: 101325,
      ),
    ];
  }

  List<ConverterModel> _getPowerUnits() {

    return [

      ConverterModel(
        name: "Watt",
        factor: 1,
      ),

      ConverterModel(
        name: "Kilowatt",
        factor: 1000,
      ),

      ConverterModel(
        name: "Horsepower",
        factor: 745.7,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> items = [

      {
        "title": "Currency",
        "icon": Icons.currency_exchange,
      },

      {
        "title": "Length",
        "icon": Icons.straighten,
      },

      {
        "title": "Area",
        "icon": Icons.crop_square,
      },

      {
        "title": "Volume",
        "icon": Icons.inventory_2_outlined,
      },

      {
        "title": "Weight",
        "icon": Icons.monitor_weight_outlined,
      },

      {
        "title": "Temperature",
        "icon": Icons.thermostat_outlined,
      },

      {
        "title": "Speed",
        "icon": Icons.speed,
      },

      {
        "title": "Pressure",
        "icon": Icons.compress,
      },

      {
        "title": "Power",
        "icon": Icons.flash_on,
      },

      {
        "title": "Number System",
        "icon": Icons.numbers,
      },
    ];

    final filteredItems =
    items.where((item) {

      return item["title"]
          .toString()
          .toLowerCase()
          .contains(
        searchQuery.toLowerCase(),
      );

    }).toList();

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Unit Converter",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller:
              searchController,

              onChanged: (value) {

                setState(() {

                  searchQuery = value;
                });
              },

              decoration: InputDecoration(

                hintText: "Search tools...",

                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child: GridView.builder(

                itemCount:
                filteredItems.length,

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount:

                  MediaQuery.of(context)
                      .size
                      .width >
                      600
                      ? 4
                      : 2,

                  crossAxisSpacing: 14,

                  mainAxisSpacing: 14,

                  childAspectRatio: 0.82,
                ),

                itemBuilder:
                    (context, index) {

                  final item =
                  filteredItems[index];

                  return GestureDetector(

                    onTap: () {

                      if (item["title"] ==
                          "Currency") {

                        Navigator.push(

                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const CurrencyScreen(),
                          ),
                        );
                      }

                      else if (item["title"] ==
                          "Length") {

                        _openConverter(

                          context,

                          title:
                          "Length Converter",

                          units:
                          _getLengthUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Area") {

                        _openConverter(

                          context,

                          title:
                          "Area Converter",

                          units:
                          _getAreaUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Weight") {

                        _openConverter(

                          context,

                          title:
                          "Weight Converter",

                          units:
                          _getWeightUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Volume") {

                        _openConverter(

                          context,

                          title:
                          "Volume Converter",

                          units:
                          _getVolumeUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Speed") {

                        _openConverter(

                          context,

                          title:
                          "Speed Converter",

                          units:
                          _getSpeedUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Pressure") {

                        _openConverter(

                          context,

                          title:
                          "Pressure Converter",

                          units:
                          _getPressureUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Power") {

                        _openConverter(

                          context,

                          title:
                          "Power Converter",

                          units:
                          _getPowerUnits(),
                        );
                      }

                      else if (item["title"] ==
                          "Temperature") {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                            const TemperatureScreen(),
                          ),
                        );
                      }

                      else if (item["title"] ==
                          "Number System") {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                            const NumberSystemScreen(),
                          ),
                        );
                      }
                    },

                    child: Container(

                      decoration: BoxDecoration(

                        color: isDark
                            ? const Color(0xFF161616)
                            : Colors.white,

                        borderRadius:
                        BorderRadius.circular(26),

                        boxShadow: [

                          BoxShadow(

                            color:
                            Colors.black.withValues(
                              alpha: 0.08,
                            ),

                            blurRadius: 10,

                            offset:
                            const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(

                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(
                            item["icon"],
                            size: 42,
                          ),

                          const SizedBox(height: 18),

                          Padding(

                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),

                            child: Text(

                              item["title"],

                              textAlign:
                              TextAlign.center,

                              style: const TextStyle(

                                fontSize: 18,

                                fontWeight:
                                FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}