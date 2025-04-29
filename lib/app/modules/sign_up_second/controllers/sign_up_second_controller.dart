import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/apis/api_Methods.dart';
import 'package:new_pro/apis/api_models/user_data_model.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../apis/api_key_constants.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../../constants/string_constants.dart';

class SignUpSecondController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  final countryValue = 'India'.obs;
  final cityValue = 'Indore'.obs;

  final acceptTermsOfUseValue = true.obs;

  final imageValue = Rxn<File>();


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

  clickOnSignUpButton() async {
    if(imageValue.value!=null)
      {
    if (countryController.text.trim().isNotEmpty &&
        stateController.text.trim().isNotEmpty &&
        cityController.text.trim().isNotEmpty &&
        createPasswordController.text.trim().isNotEmpty &&
        reEnterPasswordController.text.trim().isNotEmpty) {
      if (!acceptTermsOfUseValue.value) {
        if (createPasswordController.text.trim() ==
            reEnterPasswordController.text.trim()) {
          inAsyncCall.value = true;
          increment();
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(ApiKeyConstants.country, countryController.text);
          sp.setString(ApiKeyConstants.state, stateController.text);
          sp.setString(ApiKeyConstants.city, cityController.text);
          sp.setString(ApiKeyConstants.password, createPasswordController.text);
          String? email = sp.getString(ApiKeyConstants.email);
          String? fullName = sp.getString(ApiKeyConstants.fullName);
          String? phone = sp.getString(ApiKeyConstants.phone);
          String? dob = sp.getString(ApiKeyConstants.dob);
          String? countryCode = sp.getString(ApiKeyConstants.countryCode);
          String? gender = sp.getString(ApiKeyConstants.gender);

          Map<String, dynamic> bodyParams = {
            ApiKeyConstants.email: email.toString(),
            ApiKeyConstants.fullName: fullName.toString(),
            ApiKeyConstants.phone: phone.toString(),
            ApiKeyConstants.dob: dob.toString(),
            ApiKeyConstants.gender: gender.toString(),
            ApiKeyConstants.countryCode: countryCode.toString(),
            ApiKeyConstants.country: countryController.text.toString(),
            ApiKeyConstants.state: stateController.text.toString(),
            ApiKeyConstants.city: cityController.text.toString(),
            ApiKeyConstants.password: createPasswordController.text.toString(),
          };
          UserDataModel? userDataModel =
              await ApiMethods.signupMethod(bodyParams: bodyParams,image: imageValue.value,imageKey:  ApiKeyConstants.image,);
          if (userDataModel != null) {
            Get.toNamed(Routes.ENTER_CODE);
          }

          inAsyncCall.value = false;
          increment();
        } else {
          CommonMethods.showToast(
              msg: 'Password and Confirm password mismatch!');
        }
      } else {
        CommonMethods.showToast(msg: 'Accept Terms Of Use request!');
      }
    } else {
      CommonMethods.showToast(msg: 'All field request!');
    }} else {
      CommonMethods.showToast(msg: 'Image field request!');
    }

    inAsyncCall.value = false;
    increment();
  }

  clickOnLoginButton() {
    Get.toNamed(Routes.LOGIN);
  }

  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  clickOnAcceptTermsOfUseCheckBox() {
    acceptTermsOfUseValue.value = !acceptTermsOfUseValue.value;
  }

  Widget selectImageTextView() => Text(
    StringConstants.selectImage
  );

  Widget contentTextView() => Text(
    StringConstants.chooseImageFromTheOptionsBelow
  );

  Widget cameraTextButtonView() => Text(
    StringConstants.camera
  );

  Widget galleryTextButtonView() => Text(
    StringConstants.gallery
  );

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> pickCamera() async {
    imageValue.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).scaffoldBackgroundColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
    imageValue.value = await ImagePickerAndCropper.pickImage(
      pickImageFromGallery: true,
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).scaffoldBackgroundColor,
    );
    increment();
  }

  clickOnProfile() {
    showAlertDialog();
  }
}
