import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF00BF63); // #00BF63
  static const Color textColor = Color(0xFFA6A6A6);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColorblack = Color(0xFF000000);
  static const Color borderColor = Color(0xFFDDDDDD);
}
class ColorFilters {
  static final greyscale = ColorFilter.matrix(<double>[
    /// greyscale filter
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]);
}