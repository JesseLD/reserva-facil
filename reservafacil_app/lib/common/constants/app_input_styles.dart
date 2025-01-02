import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_sizing.dart';

class AppInputStyles {
  static const InputDecoration primaryInput = InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.dangerRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.dangerRed),
    ),
  );
}
