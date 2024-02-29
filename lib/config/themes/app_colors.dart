// ignore_for_file: prefer_const_constructors

import 'package:exit/config/themes/app_dark_theme.dart';
import 'package:exit/config/themes/app_light_theme.dart';
import 'package:exit/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient() =>
    UIparameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIparameters.isDarkMode()
    ? Color(0xFFE9F6FF)
    : Color.fromARGB(255, 157, 171, 187);
