import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.lightBg,

  cardColor: Colors.white,

  colorScheme: const ColorScheme.light(primary: AppColors.primary),

  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightBg,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
);
