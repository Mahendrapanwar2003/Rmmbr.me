import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class SignUpSecondController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  final countryValue = 'India'.obs;
  final cityValue = 'Indore'.obs;

  final acceptTermsOfUseValue = true.obs;

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

  clickOnSignUpButton() {
    Get.toNamed(Routes.ENTER_CODE);
  }

  clickOnLoginButton() {
    Get.toNamed(Routes.LOGIN);
  }

  clickOnAcceptTermsOfUseCheckBox() {
    acceptTermsOfUseValue.value = !acceptTermsOfUseValue.value;
  }
}
