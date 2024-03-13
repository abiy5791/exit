// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:exit/config/themes/custom_text_style.dart';
import 'package:exit/config/themes/ui_parameters.dart';
import 'package:exit/controllers/question_papers/questions_controller.dart';
import 'package:exit/widgets/common/background_decoration.dart';
import 'package:exit/widgets/common/button_widget.dart';
import 'package:exit/widgets/common/custom_app_bar.dart';
import 'package:exit/widgets/content_area.dart';
import 'package:exit/widgets/questions/answer_card.dart';
import 'package:exit/widgets/questions/countdown_timer.dart';
import 'package:exit/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});

  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                  child: Column(
                children: [
                  Row(
                    children: [
                      CountdownTimer(
                          color: UIparameters.isDarkMode()
                              ? Theme.of(context).textTheme.bodyText1!.color
                              : Theme.of(context).primaryColor,
                          time: ''),
                      Obx(() => Text(
                            '${controller.time} Remaining',
                            style: countDownTimerTs(),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemCount: controller.allQuestions.length,
                      itemBuilder: (_, index) {
                        AnswerStatus? _answerStatus;
                        if (controller.allQuestions[index].selectedAnswer !=
                            null) {
                          _answerStatus = AnswerStatus.answered;
                        }
                        return QuestionNumberCard(
                            index: index + 1,
                            status: _answerStatus,
                            onTap: () => controller.jumpToQuestion(index));
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
                child: MainButton(
                  btnText: 'Complete',
                  onTap: () {
                    controller.complete();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
