import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_sizing.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headText = TextStyle(
    fontSize: AppSizing.fontExtraLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title = TextStyle(
    fontSize: AppSizing.fontLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppSizing.fontMedium,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subtitleAlt = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppSizing.fontRegular,
  );
  
  static const TextStyle bodyAlt = TextStyle(
    fontSize: 14,
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppSizing.fontSmall,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppSizing.fontRegular,
    fontWeight: FontWeight.bold,
  );
}
