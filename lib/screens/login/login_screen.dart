import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/common/button_widget.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/exam.png",
                width: 150,
                height: 150,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  "Exit Exam Model Questions Practice App This app helps you prepare for your graduation exit exam in any subject.",
                  style: TextStyle(
                      color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              MainButton(
                onTap: () {
                  controller.signInWithGoogle();
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 25,
                      child: SvgPicture.asset("assets/icons/google.svg"),
                    ),
                    Center(
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
