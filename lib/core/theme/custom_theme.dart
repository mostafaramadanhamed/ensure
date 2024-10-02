import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      primaryColorLight: Colors.black,
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColorLight: Colors.white,
    );
  }
}
