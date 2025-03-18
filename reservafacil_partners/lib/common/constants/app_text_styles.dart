import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_sizing.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headText = TextStyle(
    fontSize: AppSizing.fontExtraLarge,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle title = TextStyle(
    fontSize: AppSizing.fontLarge,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppSizing.fontMedium,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const TextStyle subtitleAlt = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  static const TextStyle body = TextStyle(
    fontSize: AppSizing.fontRegular,
    fontFamily: 'Inter',
  );
  static const TextStyle bodyAlt = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppSizing.fontSmall,
    fontFamily: 'Inter',
  );

  static const TextStyle button = TextStyle(
    fontSize: AppSizing.fontRegular,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );
}
