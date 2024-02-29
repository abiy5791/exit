// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/config/themes/app_icons.dart';
import 'package:exit/config/themes/custom_text_style.dart';
import 'package:exit/controllers/My_zoom_drawer_controller.dart';
import 'package:exit/controllers/question_papers/question_paper_controller.dart';
import 'package:exit/screens/home/my_menu_screen.dart';
import 'package:exit/screens/home/question_card.dart';
import 'package:exit/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        borderRadius: 50,
        controller: _.zoomDrawerController,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.DefaultStyle,
        backgroundColor: Colors.white.withOpacity(0.5),
        slideWidth: MediaQuery.of(context).size.width * 0.6,
        menuScreen: MyMenuScreen(),
        mainScreen: Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: controller.toogleDrawer,
                        child: Icon(
                          AppIcons.menuleft,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.peace,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Hello friend",
                              style: detailText.copyWith(
                                  color: onSurfaceTextColor),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "What do you want to study today !",
                        style: headerText,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() => ListView.separated(
                            padding: EdgeInsets.all(25),
                            shrinkWrap: true,
                            itemCount:
                                _questionPaperController.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                  model: _questionPaperController
                                      .allPapers[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
