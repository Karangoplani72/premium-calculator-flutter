import 'package:flutter/material.dart';
import '../../history/screens/history_screen.dart';
import '../../../core/utils/calculator_logic.dart';
import '../../settings/screens/settings_screen.dart';
import '../widgets/button_grid.dart';
import '../widgets/display_section.dart';
import '../../gst/widgets/gst_panel.dart';
import '../../utility/screens/utility_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic logic = CalculatorLogic();
  final TextEditingController
  controller =
  TextEditingController();
  bool isScientific = false;
  bool isGSTMode = false;
  void _handleTap(String value) {
    setState(() {
      logic.buttonPressed(

  value,

  controller,
);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Premium Calculator"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.receipt_long,

              color: isGSTMode ? Colors.orange : null,
            ),

            onPressed: () {
              setState(() {
                isGSTMode = !isGSTMode;

                if (isGSTMode) {
                  isScientific = false;
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.grid_view_rounded),

            onPressed: () {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (_) => const UtilityScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(isScientific ? Icons.calculate : Icons.functions),

            onPressed: () {
              setState(() {
                isScientific = !isScientific;
                if (isScientific) {
                  isGSTMode = false;
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),

            onPressed: () {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => HistoryScreen(
                    history: logic.history,

                    onClear: () {
                      setState(() {
                        logic.clearHistory();
                      });

                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (!isGSTMode)

              SizedBox(

                height:
                isScientific
                    ? 140
                    : 110,

                child: DisplaySection(

                  controller: controller,
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,

                child: isGSTMode
                    ? const GstPanel()
                    : ButtonGrid(
                        onPressed: _handleTap,

                        isScientific: isScientific,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
