// ignore_for_file: prefer_const_constructors
import 'package:exit/controllers/My_zoom_drawer_controller.dart';
import 'package:exit/controllers/question_papers/question_paper_controller.dart';
import 'package:exit/controllers/question_papers/questions_controller.dart';
import 'package:exit/screens/home/home_screen.dart';
import 'package:exit/screens/introduction/introduction_screen.dart';
import 'package:exit/screens/question/answer_check_screen.dart';
import 'package:exit/screens/question/questions_screen.dart';
import 'package:exit/screens/question/result_screen.dart';
import 'package:exit/screens/question/test_overview_screen.dart';
import 'package:get/get.dart';
import '../screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => IntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(
              QuestionPaperController(),
            );
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => TestOverviewScreen()),
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen()),
        GetPage(
            name: AnswerCheckScreen.routeName, page: () => AnswerCheckScreen()),
      ];
}
