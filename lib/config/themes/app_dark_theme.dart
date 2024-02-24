import 'package:exit/config/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColorDark = Color(0xFF0F1035);
const Color primaryColorDark = Color(0xFF3D3B40);
const Color mainTextColorDark = Color(0xFFF6FDC3);

class DarkTheme with SubThemeData {
  ThemeData buildDarkThem() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
