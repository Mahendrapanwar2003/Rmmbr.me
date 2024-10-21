import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../apis/api_Methods.dart';
import '../../../../apis/api_key_constants.dart';
import '../../../../apis/api_models/user_data_model.dart';
import '../../../../common/common_methods.dart';

class EnterCodeController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController otpController = TextEditingController();

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

  clickOnConfirmButton() async {
    if (parameters[StringConstants.previousPage] ==
        StringConstants.forgotPassword) {
      Get.toNamed(Routes.RESET_PASSWORD);
    } else {
      if (otpController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        increment();
        Map<String, dynamic> bodyParams = {
          ApiKeyConstants.otp: otpController.text,
        };
        UserDataModel? userDataModel =
            await ApiMethods.verifyOtpMethod(bodyParams: bodyParams);
        print('userDataModel::::::::::::::::::${userDataModel}');
        if (userDataModel != null) {
          Get.offAllNamed(Routes.LOGIN);
        }
        inAsyncCall.value = false;
        increment();
      } else {
        CommonMethods.showToast(msg: 'All field request!');
      }
      inAsyncCall.value = false;
      increment();
    }
  }

  clickOnResendButton() {}
}
