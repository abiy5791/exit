// ignore_for_file: prefer_const_constructors

import 'package:exit/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  final bool addPadding;
  const ContentArea({super.key, required this.child, this.addPadding = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(color: customScaffoldColor(context)),
        padding: addPadding
            ? EdgeInsets.only(top: 25, left: 25, right: 25)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
