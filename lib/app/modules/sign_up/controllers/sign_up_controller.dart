import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../apis/api_key_constants.dart';
import '../../../../common/date_picker_view.dart';
import '../../../routes/app_pages.dart';

enum Gender { male, female, nonBinary }

class SignUpController extends GetxController {
  final gender = Rxn<Gender>();  // Nullable observable for gender
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobilePhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
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

  clickOnLoginButton() {
    Get.toNamed(Routes.LOGIN);
  }

  clickOnContinueButton() async {
    if (fullNameController.text.trim().isNotEmpty &&
        mobilePhoneNumberController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        dobController.text.trim().isNotEmpty &&
        gender.value != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.email, emailController.text);
      sp.setString(ApiKeyConstants.fullName, fullNameController.text);
      sp.setString(ApiKeyConstants.phone, mobilePhoneNumberController.text);
      sp.setString(ApiKeyConstants.countryCode, countryCodeShow.value);
      sp.setString(ApiKeyConstants.dob, dobController.text);
      sp.setString(ApiKeyConstants.gender, gender.value?.name ?? '');
      Get.toNamed(Routes.SIGN_UP_SECOND);
    } else {
      CommonMethods.showToast(msg: 'All field request!');
    }
  }

  clickOnCountryField() {
    return showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      searchAutofocus: true,
      onSelect: (Country country) {
        countryCode.value = country.countryCode;
        countryCodeShow.value = "+ ${country.phoneCode}";
      },
    );
  }

  clickOnDob() async {
    DateTime? dateTime =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (dateTime != null) {
      dobController.text = DateFormat('MM/dd/yyyy').format(dateTime).toString();
    }
  }
}
