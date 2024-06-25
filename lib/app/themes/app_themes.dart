import 'dart:ui';

import 'package:application/presentation/common/constants/color_constants.dart';
import 'package:application/presentation/common/utils/ui_overlay_style_utils.dart';
import 'package:flutter/material.dart';

/// This if for the Theme set for the data
final _AppThemes themes = _AppThemes();

class _AppThemes {
  static final _AppThemes _instance = _AppThemes.internal();

  _AppThemes.internal();

  factory _AppThemes() => _instance;

  static String roboto = 'Roboto';

  ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      labelMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      bodySmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      displayLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: roboto,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: roboto,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontFamily: roboto,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: UiOverlayStyleUtil().uiOverlayStyle(),
    ),
  );
}
