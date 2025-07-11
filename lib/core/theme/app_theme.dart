import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData getTheme({required ColorScheme colorScheme,}) {
    return ThemeData(
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.black[30],
          disabledForegroundColor: AppColors.white,
          textStyle: AppStyles.mediumText16Style.copyWith(color: AppColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )
        )
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
  );
}
