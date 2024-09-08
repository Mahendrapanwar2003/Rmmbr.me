import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/constants/string_constants.dart';

class EnterCodeController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController countryController = TextEditingController();

  final parameters = Get.parameters;

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
    if (parameters[StringConstants.previousPage] ==
        StringConstants.forgotPassword) {
      Get.toNamed(Routes.RESET_PASSWORD);
    } else {
      Get.toNamed(Routes.NAV_BAR);
    }
  }

  clickOnResendButton() {}
}
