import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/config/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

TextStyle cardTitle(context) => TextStyle(
    color: UIparameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
