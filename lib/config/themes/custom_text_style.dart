// ignore_for_file: deprecated_member_use

import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle cardTitle(context) => TextStyle(
    color: UIparameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const questionTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
const appBarTS = TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: onSurfaceTextColor);

TextStyle countDownTimerTs() => TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: UIparameters.isDarkMode()
        ? Theme.of(Get.context!).textTheme.bodyText1!.color
        : Theme.of(Get.context!).primaryColor);
