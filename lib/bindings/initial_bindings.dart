import 'package:exit/controllers/ThemeController.dart';
import 'package:exit/controllers/auth_controller.dart';
import 'package:exit/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
