import 'package:exit/config/themes/app_dark_theme.dart';
import 'package:exit/config/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkThem();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
