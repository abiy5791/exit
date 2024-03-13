// ignore_for_file: prefer_const_constructors

import 'package:exit/config/themes/app_dark_theme.dart';
import 'package:exit/config/themes/app_light_theme.dart';
import 'package:exit/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color wrongAnswerColor = Color(0xFFf85187);
const Color notAnsweredColor = Color(0xFF2a3c65);

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

Color customScaffoldColor(BuildContext context) =>
    UIparameters.isDarkMode() ? Color(0xFFE9F6FF) : Color(0xFFF2EFE5);

Color answerSelectedColor() => UIparameters.isDarkMode()
    ? Theme.of(Get.context!).cardColor
    : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() => UIparameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
