import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData getTheme({required ColorScheme colorScheme,required Color textFormFieldBorderColor}) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.black[30],
          disabledForegroundColor: AppColors.white,
          textStyle: AppStyles.mediumBlack16Style.copyWith(color: AppColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
            labelStyle: AppStyles.labelStyle,
            hintStyle:AppStyles.hintStyle,
            fillColor: AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: textFormFieldBorderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: textFormFieldBorderColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: colorScheme.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: colorScheme.error, width: 1),
            ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.all(16),
          backgroundColor: AppColors.skyBlue,
          foregroundColor: AppColors.white,
          textStyle: AppStyles.mediumBlack16Style.copyWith(color: AppColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
    ),
    textFormFieldBorderColor: AppColors.grey
  );
}
