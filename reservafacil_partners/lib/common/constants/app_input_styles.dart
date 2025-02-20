import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_sizing.dart';

class AppInputStyles {
  static const InputDecoration primaryInput = InputDecoration(
    labelStyle: TextStyle(color: Colors.grey),
    hintStyle: TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.primaryAlternative),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppSizing.borderRadiusSmall,
      borderSide: BorderSide(color: AppColors.primaryAlternative),
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

  static const InputDecoration primaryInputVariation = InputDecoration(
    labelStyle: TextStyle(color: Colors.grey),
    hintStyle: TextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      borderSide: BorderSide(
        color: AppColors.primaryAlternative,
        width: 1.2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.black26,
        width: 1.2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      borderSide: BorderSide(color: AppColors.dangerRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
      borderSide: BorderSide(color: AppColors.dangerRed),
    ),
  );
}
