// ignore_for_file: prefer_const_constructors

import 'package:exit/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/star.png",
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to Exit Exam Model Questions Practice App!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Exit Exam Model Questions Practice App This app helps you prepare for your graduation exit exam in any subject. You can practice with model questions based on your syllabus. This app will boost your knowledge, skills, and confidence.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () => Get.toNamed('/home'),
                  child: Image.asset(
                    "assets/images/right.png",
                    width: 50,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
