import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class EnterCodeController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController countryController = TextEditingController();

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

  void increment() => count.value++;

  clickOnConfirmButton() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnResendButton() {}
}
