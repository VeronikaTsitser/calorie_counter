import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.greyContainer,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      fontFamily: 'Inter',
      textTheme: AppTextTheme.theme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 46),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 13),
          textStyle: AppTextStyle.s16w600.copyWith(color: Colors.white),
          backgroundColor: AppColors.primary,
        ),
      ),
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTextStyle.s20w700,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
    );

abstract final class AppColors {
  static const primary = Color.fromRGBO(52, 199, 89, 1);
  static const primaryBg = Color.fromRGBO(52, 199, 89, 0.1);
  static const greyContainer = Color.fromRGBO(245, 245, 245, 1);
  static const destructiveRed = Color.fromRGBO(255, 59, 48, 1);

  static const black = Colors.black;
  static final hint = Colors.black.withOpacity(0.6);
}

abstract final class AppTextTheme {
  static const theme = TextTheme(
    titleLarge: AppTextStyle.s20w700,
    titleMedium: AppTextStyle.s16w600,
    bodySmall: AppTextStyle.s16w400,
    labelSmall: AppTextStyle.s12w400,
  );
}

abstract final class AppTextStyle {
  static const s20w700 = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1.2, color: AppColors.black);
  static const s16w600 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.25);
  static const s16w400 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.25);
  static const s12w400 = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.33);
}
