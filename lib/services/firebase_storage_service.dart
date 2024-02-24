// ignore_for_file: non_constant_identifier_names

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

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
      return null;
    }
  }
}
