// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/config/themes/custom_text_style.dart';
import 'package:exit/screens/question/test_overview_screen.dart';
import 'package:exit/widgets/common/button_widget.dart';
import 'package:exit/widgets/common/custom_app_bar.dart';
import 'package:exit/widgets/common/question_placeholder.dart';
import 'package:exit/widgets/content_area.dart';
import 'package:exit/widgets/questions/answer_card.dart';
import 'package:exit/widgets/questions/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/question_papers/questions_controller.dart';
import '../../firebase_ref/loading_status.dart';
import '../../widgets/common/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questionsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountdownTimer(
                  time: controller.time.value,
                  color: onSurfaceTextColor,
                )),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarTS,
            ),
          ),
        ),
        body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionPlaceholder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                        child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              '${(controller.questionIndex.value + 1).toString().padLeft(2)}. ' +
                                  controller.currentQuestion.value!.question,
                              style: questionTextStyle,
                            ),
                            GetBuilder<QuestionsController>(
                                id: 'answer_list',
                                builder: (context) {
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 25),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          answer:
                                              '${answer.identifier}. ${answer.answer}',
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier);
                                          },
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext contex, int index) =>
                                              const SizedBox(
                                                height: 10,
                                              ),
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length);
                                })
                          ],
                        ),
                      ),
                    )),
                  ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Row(
                        children: [
                          Visibility(
                              visible: controller.isFirstQuestion,
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: SizedBox(
                                  height: 55,
                                  width: 55,
                                  child: MainButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Get.isDarkMode
                                          ? onSurfaceTextColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              child: Visibility(
                                  visible: controller.loadingStatus.value ==
                                      LoadingStatus.completed,
                                  child: MainButton(
                                    onTap: () {
                                      controller.isLastQuestion
                                          ? Get.toNamed(
                                              TestOverviewScreen.routeName)
                                          : controller.nextQuestion();
                                    },
                                    btnText: controller.isLastQuestion
                                        ? 'Complete'
                                        : 'Next',
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
