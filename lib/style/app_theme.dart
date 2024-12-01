import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// The [AppTheme] defines light and dark themes for the app.
///
/// Theme setup for FlexColorScheme package v8.
/// Use same major flex_color_scheme package version. If you use a
/// lower minor version, some properties may not be supported.
/// In that case, remove them after copying this theme to your
/// app or upgrade package to version 8.0.1.
///
/// Use in [MaterialApp] like this:
///
/// MaterialApp(
///  theme: AppTheme.light,
///  darkTheme: AppTheme.dark,
///  :
/// );
sealed class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xFF1145A4),
      primaryContainer: Color(0xFFACC7F6),
      primaryLightRef: Color(0xFF1145A4),
      secondary: Color(0xFFB61D1D),
      secondaryContainer: Color(0xFFEC9F9F),
      secondaryLightRef: Color(0xFFB61D1D),
      tertiary: Color(0xFF376BCA),
      tertiaryContainer: Color(0xFFCFDBF2),
      tertiaryLightRef: Color(0xFF376BCA),
      appBarColor: Color(0xFFCFDBF2),
      error: Color(0xFFB00020),
      errorContainer: Color(0xFFFCD8DF),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFFC4D7F8),
      primaryContainer: Color(0xFF577CBF),
      primaryLightRef: Color(0xFF1145A4),
      secondary: Color(0xFFF1BBBB),
      secondaryContainer: Color(0xFFCB6060),
      secondaryLightRef: Color(0xFFB61D1D),
      tertiary: Color(0xFFDDE5F5),
      tertiaryContainer: Color(0xFF7297D9),
      tertiaryLightRef: Color(0xFF376BCA),
      appBarColor: Color(0xFFDDE5F5),
      error: Color(0x00000000),
      errorContainer: Color(0x00000000),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  static SystemUiOverlayStyle getSystemUiOverlayStyle(ThemeMode themeMode, ThemeData themeData) {
    return SystemUiOverlayStyle(
      statusBarColor: themeMode == ThemeMode.dark ? themeData.scaffoldBackgroundColor : themeData.appBarTheme.backgroundColor,
      statusBarIconBrightness: themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: themeMode == ThemeMode.dark ? themeData.scaffoldBackgroundColor : themeData.appBarTheme.backgroundColor,
    );
  }
}