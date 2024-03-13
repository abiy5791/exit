// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:exit/controllers/question_papers/question_controller_extension.dart';
import 'package:exit/controllers/question_papers/questions_controller.dart';
import 'package:exit/screens/question/answer_check_screen.dart';
import 'package:exit/widgets/common/background_decoration.dart';
import 'package:exit/widgets/common/button_widget.dart';
import 'package:exit/widgets/common/custom_app_bar.dart';
import 'package:exit/widgets/content_area.dart';
import 'package:exit/widgets/questions/answer_card.dart';
import 'package:exit/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../config/themes/custom_text_style.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});

  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
            child: ContentArea(
                child: Column(
              children: [
                SvgPicture.asset('assets/images/bulb.svg'),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Congratulations',
                    style: headerText.copyWith(color: _textColor),
                  ),
                ),
                Text(
                  'You have ${controller.points} points',
                  style: TextStyle(color: _textColor),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Tap below question numbers to view correct answers',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 75,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: controller.allQuestions.length,
                    itemBuilder: (_, index) {
                      final _question = controller.allQuestions[index];
                      AnswerStatus _status = AnswerStatus.notanswered;
                      final _selectedAnswer = _question.selectedAnswer;
                      final _correctAnswer = _question.correctAnswer;
                      if (_selectedAnswer == _correctAnswer) {
                        _status = AnswerStatus.correct;
                      } else if (_question.selectedAnswer == null) {
                        _status = AnswerStatus.wrong;
                      } else {
                        _status = AnswerStatus.wrong;
                      }
                      return QuestionNumberCard(
                          index: index + 1,
                          status: _status,
                          onTap: () {
                            controller.jumpToQuestion(index, isGoBack: false);
                            Get.toNamed(AnswerCheckScreen.routeName);
                          });
                    },
                  ),
                ),
              ],
            )),
          ),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      onTap: () {
                        controller.tryAgain();
                      },
                      btnText: 'Try Again',
                      btncolor: Color(0xFFE3FDFD),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: MainButton(
                    onTap: () {
                      controller.saveTestResults();
                    },
                    btncolor: Color(0xFFEEEEEE),
                    btnText: 'Go Home',
                  )),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
