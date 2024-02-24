import 'package:exit/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/books.png",
            width: 200,
            height: 200,
          )),
    );
  }
}
