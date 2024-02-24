// ignore_for_file: prefer_const_constructors

import 'package:exit/controllers/question_papers/data_uploader.dart';
import 'package:exit/firebase_ref/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(() => Text(
              controller.loadingStatus.value == LoadingStatus.completed
                  ? "uploading completed"
                  : "Uploading ..."))),
    );
  }
}
