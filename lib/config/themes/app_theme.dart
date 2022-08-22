import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        height: 1.3,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
