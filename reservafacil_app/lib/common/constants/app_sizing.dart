import 'package:flutter/material.dart';

/// Class with sizing constants for the app
class AppSizing {
  // Margins and paddings
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;

  // Font sizes
  static const double fontSmall = 14.0;
  static const double fontRegular = 16.0;
  static const double fontMedium = 24.0;
  static const double fontLarge = 32.0;
  static const double fontExtraLarge = 48.0;

  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;

  // Border radius
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius borderRadiusMedium =
      BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(Radius.circular(24.0));

  // Heights (buttons, inputs, etc)
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;

  // Elevations
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Spacing widgets
  static const SizedBox spaceSmall = SizedBox(height: 8.0);
  static const SizedBox spaceMedium = SizedBox(height: 16.0);
  static const SizedBox spaceLarge = SizedBox(height: 24.0);

  // Breakpoints
  static const double breakpointSmall = 480.0;
  static const double breakpointMedium = 768.0;
  static const double breakpointLarge = 1024.0;

  // Responsive padding
  static double responsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < breakpointSmall) {
      return paddingSmall;
    } else if (screenWidth < breakpointMedium) {
      return paddingMedium;
    } else {
      return paddingLarge;
    }
  }
}
