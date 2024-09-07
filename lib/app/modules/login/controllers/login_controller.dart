import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController enterYourEmailAndPasswordController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  clickOnLoginButton() {}

  clickOnForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }
}
