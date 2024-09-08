import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/modules/sign_up/controllers/sign_up_controller.dart';

class EditProfileController extends GetxController {

  final count = 0.obs;

  Gender? gender;

  final inAsyncCall = false.obs;
  TextEditingController relationController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobilePhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final countryCode = 'IN'.obs;
  final countryCodeShow = '+91'.obs;

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

  void clickOnSaveChangesButton() {}

  void clickOnCountryField() {}
}
