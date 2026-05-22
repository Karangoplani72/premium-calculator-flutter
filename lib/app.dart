import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_routes.dart';
import 'features/calculator/screens/calculator_screen.dart';
import 'features/settings/screens/settings_screen.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/theme/theme_provider.dart';
import 'features/utility/screens/utility_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return MaterialApp(

      routes: {

        AppRoutes.calculator:
            (_) => const CalculatorScreen(),

        AppRoutes.settings:
            (_) => const SettingsScreen(),

        AppRoutes.utilities:
            (_) => const UtilityScreen(),
      },

      initialRoute:
      AppRoutes.calculator,

      debugShowCheckedModeBanner: false,

      title: 'Premium Calculator',

      theme: lightTheme,

      darkTheme: darkTheme,

      themeMode: provider.themeMode,
    );
  }
}
