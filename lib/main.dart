// ignore_for_file: prefer_const_constructors, unused_import

import 'package:exit/bindings/initial_bindings.dart';
import 'package:exit/config/themes/app_dark_theme.dart';
import 'package:exit/config/themes/app_light_theme.dart';
import 'package:exit/controllers/ThemeController.dart';
import 'package:exit/data_uploader_screen.dart';
import 'package:exit/firebase_options.dart';
import 'package:exit/routes/AppRoutes.dart';
import 'package:exit/screens/introduction/introduction_screen.dart';
import 'package:exit/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }
