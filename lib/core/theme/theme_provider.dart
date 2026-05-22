import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode =
      ThemeMode.light;

  ThemeMode get themeMode =>
      _themeMode;

  bool get isDarkMode =>
      _themeMode == ThemeMode.dark;

  late Box settingsBox;

  ThemeProvider() {

    loadTheme();
  }

  Future<void> loadTheme() async {

    settingsBox =
    await Hive.openBox(
      "settings",
    );

    final savedTheme =
    settingsBox.get(
      "isDarkMode",
      defaultValue: false,
    );

    _themeMode = savedTheme
        ? ThemeMode.dark
        : ThemeMode.light;

    notifyListeners();
  }

  Future<void> toggleTheme() async {

    _themeMode = isDarkMode
        ? ThemeMode.light
        : ThemeMode.dark;

    await settingsBox.put(
      "isDarkMode",
      !isDarkMode,
    );

    notifyListeners();
  }
}