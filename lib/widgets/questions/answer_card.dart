// ignore_for_file: sort_child_properties_last

import 'package:exit/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor,
            border: Border.all(
                color:
                    isSelected ? answerSelectedColor() : answerBorderColor())),
        child: Text(
          answer,
          style: TextStyle(
              color: isSelected ? onSurfaceTextColor : null,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  final String answer;
  const CorrectAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: correctAnswerColor.withOpacity(0.1)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: correctAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  final String answer;
  const WrongAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: wrongAnswerColor.withOpacity(0.1)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: wrongAnswerColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  final String answer;
  const NotAnswered({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: notAnsweredColor.withOpacity(0.1)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        answer,
        style: const TextStyle(
            color: notAnsweredColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
