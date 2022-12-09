// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_color.dart';
import '../utils/constants.dart';

/// Main app theme, called [MerlAnimeTheme], is defined here.
class MerlAnimeTheme {
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.questrial(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
    ),
    bodyText2: GoogleFonts.questrial(
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: AppColor.white,
    ),
    subtitle1: GoogleFonts.questrial(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
    ),
    subtitle2: GoogleFonts.questrial(
      fontSize: 17.0,
      color: AppColor.white,
    ),
    headline1: GoogleFonts.questrial(
      fontSize: 31.0,
      fontWeight: FontWeight.bold,
      color: AppColor.white,
    ),
    headline2: GoogleFonts.questrial(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
    ),
    headline3: GoogleFonts.questrial(
      fontSize: 19.0,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
      decoration: TextDecoration.none,
    ),
    headline4: GoogleFonts.questrial(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
      decoration: TextDecoration.none,
    ),
    headline5: GoogleFonts.questrial(
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
      decoration: TextDecoration.none,
    ),
    headline6: GoogleFonts.questrial(
      fontSize: 19.0,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
    ),
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: AppColor.backgroundColor,
      scaffoldBackgroundColor: AppColor.primaryColor,
      primaryColor: AppColor.primaryColor,
      accentColor: AppColor.primaryColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.red,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.primaryAccentColor,
        backgroundColor: AppColor.primaryColor,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColor.primaryColor),
        fillColor: MaterialStateProperty.all(AppColor.primaryColor),
      ),
      textTheme: darkTextTheme,
    );
  }
}
