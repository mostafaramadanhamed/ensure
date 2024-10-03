import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
  useMaterial3: true,
     brightness: lightScheme().brightness,
     colorScheme: lightScheme(),
     textTheme: const TextTheme().apply(
       bodyColor:  lightScheme().onSurface,
       displayColor:  lightScheme().onSurface,
     ),
     scaffoldBackgroundColor:  lightScheme().surface,
     canvasColor:  lightScheme().surface,

    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904b3d),
      surfaceTint: Color(0xff904b3d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad3),
      onPrimaryContainer: Color(0xff3a0a03),
      secondary: Color(0xff775750),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad3),
      onSecondaryContainer: Color(0xff2c1510),
      tertiary: Color(0xff6e5c2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff9e0a6),
      onTertiaryContainer: Color(0xff241a00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff534340),
      outline: Color(0xff85736f),
      outlineVariant: Color(0xffd8c2bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2c),
      inversePrimary: Color(0xffffb4a5),
      primaryFixed: Color(0xffffdad3),
      onPrimaryFixed: Color(0xff3a0a03),
      primaryFixedDim: Color(0xffffb4a5),
      onPrimaryFixedVariant: Color(0xff733428),
      secondaryFixed: Color(0xffffdad3),
      onSecondaryFixed: Color(0xff2c1510),
      secondaryFixedDim: Color(0xffe7bdb4),
      onSecondaryFixedVariant: Color(0xff5d3f39),
      tertiaryFixed: Color(0xfff9e0a6),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xffdcc48c),
      onTertiaryFixedVariant: Color(0xff554519),
      surfaceDim: Color(0xffe8d6d3),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xfffceae6),
      surfaceContainerHigh: Color(0xfff7e4e1),
      surfaceContainerHighest: Color(0xfff1dfdb),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
     useMaterial3: true,
     brightness: darkScheme().brightness,
     colorScheme: darkScheme(),
     textTheme: const TextTheme().apply(
       bodyColor: darkScheme().onSurface,
       displayColor: darkScheme().onSurface,
     ),
     scaffoldBackgroundColor: darkScheme().surface,
     canvasColor: darkScheme().surface,

    );
  }

   static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4a5),
      surfaceTint: Color(0xffffb4a5),
      onPrimary: Color(0xff561f14),
      primaryContainer: Color(0xff733428),
      onPrimaryContainer: Color(0xffffdad3),
      secondary: Color(0xffe7bdb4),
      onSecondary: Color(0xff442a24),
      secondaryContainer: Color(0xff5d3f39),
      onSecondaryContainer: Color(0xffffdad3),
      tertiary: Color(0xffdcc48c),
      onTertiary: Color(0xff3d2f04),
      tertiaryContainer: Color(0xff554519),
      onTertiaryContainer: Color(0xfff9e0a6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromARGB(255, 0, 0, 0),
      onSurface: Color(0xfff1dfdb),
      onSurfaceVariant: Color(0xffd8c2bd),
      outline: Color(0xffa08c88),
      outlineVariant: Color(0xff534340),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inversePrimary: Color(0xff904b3d),
      primaryFixed: Color(0xffffdad3),
      onPrimaryFixed: Color(0xff3a0a03),
      primaryFixedDim: Color(0xffffb4a5),
      onPrimaryFixedVariant: Color(0xff733428),
      secondaryFixed: Color(0xffffdad3),
      onSecondaryFixed: Color(0xff2c1510),
      secondaryFixedDim: Color(0xffe7bdb4),
      onSecondaryFixedVariant: Color(0xff5d3f39),
      tertiaryFixed: Color(0xfff9e0a6),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xffdcc48c),
      onTertiaryFixedVariant: Color(0xff554519),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423734),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1b),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3230),
    );
  }
 
}
