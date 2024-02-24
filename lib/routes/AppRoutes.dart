// ignore_for_file: prefer_const_constructors
import 'package:exit/controllers/question_papers/question_paper_controller.dart';
import 'package:exit/screens/home/home_screen.dart';
import 'package:exit/screens/introduction/introduction_screen.dart';
import 'package:get/get.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => IntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            }))
      ];
}