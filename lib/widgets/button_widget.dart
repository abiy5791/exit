// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? btncolor;
  const MainButton(
      {super.key,
      this.btnText = "",
      required this.onTap,
      this.enabled = true,
      this.child,
      this.btncolor});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: btncolor ?? Theme.of(context).cardColor),
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: child ??
                  Center(
                    child: Text(
                      btnText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
