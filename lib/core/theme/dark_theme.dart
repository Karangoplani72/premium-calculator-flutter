import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.darkBg,

  cardColor: AppColors.darkCard,

  colorScheme: const ColorScheme.dark(primary: AppColors.primary),

  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ).apply(bodyColor: Colors.white, displayColor: Colors.white),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBg,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
