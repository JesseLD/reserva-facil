import 'package:flutter/material.dart';
import 'package:reservafacil_painel/theme/custom_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: CustomColors.orange,
    brightness: Brightness.light,
  ),

  // brightness:Brightness.light,
);
