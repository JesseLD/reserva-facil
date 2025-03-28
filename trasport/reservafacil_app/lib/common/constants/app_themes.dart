import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryAlternative,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryAlternative),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryAlternative,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryAlternative,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
      ),
      
    ),
  );
}
