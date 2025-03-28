import 'package:flutter/material.dart';

/// Class with sizing constants for the app
/// A class that contains sizing constants for the application.
/// 
/// This class provides a centralized place to define and manage
/// the various sizes used throughout the app, ensuring consistency
/// and ease of maintenance.
class AppSizing {
  /// The size for small padding [8.0].
  /// Used for small internal spacing within widgets or between UI elements.
  static const double smallPadding = 8.0;

  /// The size for medium padding [16.0].
  /// Used for moderate spacing within widgets or between UI elements.
  static const double mediumPadding = 16.0;

  /// The size for large padding [32.0].
  /// Used for larger spacing, such as between sections or large UI elements.
  static const double largePadding = 32.0;

  /// The size for extra large padding [64.0].
  /// Used for very large spaces or when creating more open layouts.
  static const double extraLargePadding = 64.0;

  /// The size for small font [12.0].
  /// Suitable for captions, footnotes, or other small text.
  static const double smallFont = 12.0;

  /// The size for medium font [16.0].
  /// Commonly used for regular body text.
  static const double mediumFont = 16.0;

  /// The size for large font [20.0].
  /// Used for headings or prominent text elements.
  static const double largeFont = 20.0;

  /// The size for extra large font [24.0].
  /// Used for larger headings or titles.
  static const double extraLargeFont = 24.0;

  /// The size for small icon [16.0].
  /// Typically used for smaller icons like in buttons or navigation bars.
  static const double smallIcon = 16.0;

  // Padding sizes
  /// Small padding size [8.0].
  static const double paddingSmall = 8.0;

  /// Medium padding size [16.0].
  static const double paddingMedium = 16.0;

  /// Large padding size [24.0].
  static const double paddingLarge = 24.0;

  // Margin sizes
  /// Small margin size [8.0].
  static const double marginSmall = 8.0;

  /// Medium margin size [16.0].
  static const double marginMedium = 16.0;

  /// Large margin size [24.0].
  static const double marginLarge = 24.0;

  // Font sizes
  /// Small font size [14.0].
  static const double fontSmall = 14.0;

  /// Regular font size [16.0].
  static const double fontRegular = 16.0;

  /// Medium font size [24.0].
  static const double fontMedium = 24.0;

  /// Large font size [32.0].
  static const double fontLarge = 32.0;

  /// Extra large font size [48.0].
  static const double fontExtraLarge = 48.0;

  // Icon sizes
  /// Small icon size [16.0].
  static const double iconSmall = 16.0;

  /// Medium icon size [24.0].
  static const double iconMedium = 24.0;

  /// Large icon size [32.0].
  static const double iconLarge = 32.0;

  // Border radius
  /// Small border radius [8.0].
  /// Used for small rounded corners on buttons or cards.
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(8.0));

  /// Medium border radius [16.0].
  /// Used for medium-rounded corners on larger UI elements.
  static const BorderRadius borderRadiusMedium =
      BorderRadius.all(Radius.circular(16.0));

  /// Large border radius [24.0].
  /// Used for more rounded UI elements, such as large buttons or cards.
  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(Radius.circular(24.0));

  // Heights (buttons, inputs, etc)
  /// Height for buttons [48.0].
  /// Standard button height for consistency across the app.
  static const double buttonHeight = 48.0;

  /// Height for input fields [56.0].
  /// Standard input field height for consistency across the app.
  static const double inputHeight = 56.0;

  // Elevations
  /// Low elevation [2.0].
  /// Used for subtle shadows and raised elements.
  static const double elevationLow = 2.0;

  /// Medium elevation [4.0].
  /// Used for more prominent shadows and raised elements.
  static const double elevationMedium = 4.0;

  /// High elevation [8.0].
  /// Used for the most prominent shadows and elevated elements.
  static const double elevationHigh = 8.0;

  // Spacing widgets
  /// Small spacing widget [8.0].
  /// Small gap between widgets, useful for compact layouts.
  static const SizedBox spaceSmall = SizedBox(height: 8.0);

  /// Medium spacing widget [16.0].
  /// Used for moderate spacing between elements in layouts.
  static const SizedBox spaceMedium = SizedBox(height: 16.0);

  /// Large spacing widget [24.0].
  /// Large gap between elements, ideal for separating sections.
  static const SizedBox spaceLarge = SizedBox(height: 24.0);

  // Breakpoints for responsive layouts
  /// Small breakpoint for mobile [480.0].
  static const double breakpointSmall = 480.0;

  /// Medium breakpoint for tablet [768.0].
  static const double breakpointMedium = 768.0;

  /// Large breakpoint for desktop [1200.0].
  static const double largeBreakpoint = 1200.0;

  /// Medium breakpoint for tablet [800.0].
  static const double mediumBreakpoint = 800.0;

  /// Small breakpoint for mobile [600.0].
  static const double smallBreakpoint = 600.0;

  /// Extra small breakpoint for very small devices [400.0].
  static const double extraSmallBreakpoint = 400.0;

  /// Breakpoint for large screens [1024.0].
  static const double breakpointLarge = 1024.0;

  // Responsive padding based on screen width
  /// A method to provide responsive padding based on screen size.
  /// Returns a different padding size for small, medium, or large screens.
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
