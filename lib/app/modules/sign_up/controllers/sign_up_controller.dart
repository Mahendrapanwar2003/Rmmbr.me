import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

enum Gender { male, female, nonBinary }

class SignUpController extends GetxController {
  Gender? gender = Gender.male;

  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobilePhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

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
    Get.toNamed(Routes.LOGIN);
  }

  clickOnContinueButton() {
    Get.toNamed(Routes.SIGN_UP_SECOND);
  }
}
