import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController emailOrMobilePhoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final languageValue = 'English'.obs;

  final rememberMeValue = true.obs;

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

  clickOnLoginButton() {
    Get.toNamed(Routes.NAV_BAR);
  }

  clickOnForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  clickOnCreateANewAccountButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnRememberMeCheckBox() {
    rememberMeValue.value = !rememberMeValue.value;
  }
}
