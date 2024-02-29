// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:exit/firebase_ref/references.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? ImageName) async {
    if (ImageName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child('question_paper_images')
          .child('${ImageName.toLowerCase()}.png');
      var ImgUrl = await urlRef.getDownloadURL();
      return ImgUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
