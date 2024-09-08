import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../sign_up/controllers/sign_up_controller.dart';

class AddMemberController extends GetxController {
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

  clickOnCountryField() {}

  clickOnSaveChangesButton() {}
}
