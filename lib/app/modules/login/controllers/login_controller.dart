import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../apis/api_Methods.dart';
import '../../../../apis/api_key_constants.dart';
import '../../../../apis/api_models/user_data_model.dart';
import '../../../../common/common_methods.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  TextEditingController emailOrMobilePhoneNumberController =
      TextEditingController();
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

  clickOnLoginButton() async {
    if (emailOrMobilePhoneNumberController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      increment();
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.email: emailOrMobilePhoneNumberController.text.trim(),
        ApiKeyConstants.password: passwordController.text.trim(),
      };
      UserDataModel? userDataModel =
          await ApiMethods.loginMethod(bodyParams: bodyParams);
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.token, userDataModel?.token ?? '');
      if (userDataModel != null &&
          userDataModel.success != null &&
          userDataModel.success!) {
        Get.toNamed(Routes.NAV_BAR);
      }else{
        if(userDataModel != null &&
            userDataModel.message != null &&
            userDataModel.message!.isNotEmpty)
          {
            CommonMethods.showToast(msg: userDataModel.message!);
          }
      }
      inAsyncCall.value = false;
      increment();
    } else {
      CommonMethods.showToast(msg: 'All field request!');
    }
    inAsyncCall.value = false;
    increment();
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
