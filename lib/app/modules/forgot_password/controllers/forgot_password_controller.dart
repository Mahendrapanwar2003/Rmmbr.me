import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/constants/string_constants.dart';

class ForgotPasswordController extends GetxController {
  final count = 0.obs;

  TextEditingController emailOrMobilePhoneNumberController = TextEditingController();

  final inAsyncCall = false.obs;

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

  clickOnContinueButton() {
    Get.toNamed(Routes.ENTER_CODE,parameters: {StringConstants.previousPage :StringConstants.forgotPassword});
  }
}
