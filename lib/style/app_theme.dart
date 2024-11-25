import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
sealed class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff1145a4),
      primaryContainer: Color(0xffacc7f6),
      primaryLightRef: Color(0xff1145a4),
      secondary: Color(0xffb61d1d),
      secondaryContainer: Color(0xffec9f9f),
      secondaryLightRef: Color(0xffb61d1d),
      tertiary: Color(0xff376bca),
      tertiaryContainer: Color(0xffcfdbf2),
      tertiaryLightRef: Color(0xff376bca),
      appBarColor: Color(0xffcfdbf2),
      error: Color(0xffb00020),
      errorContainer: Color(0xfffcd8df),
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
      primary: Color(0xffc4d7f8),
      primaryContainer: Color(0xff577cbf),
      primaryLightRef: Color(0xff1145a4),
      secondary: Color(0xfff1bbbb),
      secondaryContainer: Color(0xffcb6060),
      secondaryLightRef: Color(0xffb61d1d),
      tertiary: Color(0xffdde5f5),
      tertiaryContainer: Color(0xff7297d9),
      tertiaryLightRef: Color(0xff376bca),
      appBarColor: Color(0xffdde5f5),
      error: null,
      errorContainer: null,
    ),
    surface: const Color(0xff000000),
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