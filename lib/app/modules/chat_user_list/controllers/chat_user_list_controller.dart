import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class ChatUserListController extends GetxController {

  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void increment() => count.value++;

  void clickOnChatUserCard({required int index}) {
    Get.toNamed(Routes.CHAT_MESSAGE);
  }
}
