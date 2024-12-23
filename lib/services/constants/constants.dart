import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff597928);
  static Color fill = const Color(0x00f4feea).withOpacity(1);
  static Color secondaryColor = const Color(0xff1B7E56);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color screenBgColor = const Color(0xffFBFEF8);
  static Color? textFiledColor = const Color(0xfff5f7f4);
  static Color? IconColors = const Color(0xff979d97);
  static Color lighyGreyColor1 = const Color(0xffc2c2c2);
  static Color CancelRed = Colors.red;
  static Color grey = Colors.grey;
  static Color bottomIcon = const Color(0xff9DB2CE);
  static Color lightGreen = const Color(0xff56FF85);
  static const Color redContainer = Color(0xffC21D21);
  static const Color greyText = Color(0xff7C7C7C);
  static  Color containerBorderColor = Colors.grey[200]!;
}

class AppFontsFamily {
  static const String poppins = "poppins";
}

class AppFontSizes {
  static const double title = 28.0;
  static const double title1 = 24.0;
  static const double subtitle = 20.0;
  static const double subtitle1 = 18.0;
  static const double body = 16.0;
  static const double small = 12.0;
  static const double body1 = 14.0;
}



class ThemeColor {
  // Helper function to create MaterialColor from a Color
  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
