import 'package:flutter/material.dart';

class UIparameters {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
