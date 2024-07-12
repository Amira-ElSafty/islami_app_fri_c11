import 'package:flutter/material.dart';
import 'package:flutter_app_islami_fri_c11/app_colors.dart';

class MyThemeData {
  /// colors , light theme , dark mode
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.blackColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor),
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
