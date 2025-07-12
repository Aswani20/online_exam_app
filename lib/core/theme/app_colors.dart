import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffF9F9F9);
  static const Color grey = Color(0xff535353);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightGreen = Color(0xffCAF9CC);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color placeHolder = Color(0xffA6A6A6);
  static const Color skyBlue = Color(0xff4DA8F0);
  static MaterialColor blue = MaterialColor(0xff02369C,  <int, Color>{
    10: Color(0xFFCCD7EB),  // 10%
    20: Color(0xFFABBCDE), // 20%
    30: Color(0xFF819BCE), // 30%
    40: Color(0xFF5679BD), // 40%
    50: Color(0xFF2C5BAD), // 50%
    0: Color(0xFF02369C), // BASE
    60: Color(0xFF022D82), // 60%
    70: Color(0xFF012468), // 70%
    80: Color(0xFF011B4E), // 80%
    90: Color(0xFF011234), // 90%
    100: Color(0xFF000B1F), // 100% (Extra key, not used by default MaterialColor)
    },);
  static MaterialColor black = MaterialColor(0xFF0F0F0F,  <int, Color>{
    10: Color(0xFFCFCFCF),  // 10%
    20: Color(0xFFAFAFAF), // 20%
    30: Color(0xFF878787), // 30%
    40: Color(0xFF5F5F5F), // 40%
    50: Color(0xFF373737), // 50%
    0: Color(0xFF0F0F0F), // BASE
    60: Color(0xFF0D0D0D), // 60%
    70: Color(0xFF0A0A0A), // 70%
    80: Color(0xFF080808), // 80%
    90: Color(0xFF050505), // 90%
    100: Color(0xFF030303), // 100% (non-standard key)
  },);
}
