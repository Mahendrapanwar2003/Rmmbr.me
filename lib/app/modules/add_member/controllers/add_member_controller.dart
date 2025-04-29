import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../apis/api_Methods.dart';
import '../../../../apis/api_key_constants.dart';
import '../../../../apis/api_models/user_data_model.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/date_picker_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../../constants/string_constants.dart';
import '../../sign_up/controllers/sign_up_controller.dart';

class AddMemberController extends GetxController {
  final count = 0.obs;
  final gender = Rxn<Gender>(); // Nullable observable for gender
  final inAsyncCall = false.obs;
  TextEditingController relationController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobilePhoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final countryCode = 'IN'.obs;
  final countryCodeShow = '+91'.obs;
  final r_id = Get.arguments;

  List<DropdownMenuItem<String>> items = [];
  var relationList = [
    "Great mainfather",
    "Great mainmother",
    "P.mainmother",
    "P.mainfather",
    "Mom",
    "Dad",
    "Sister",
    "Brother",
    "Spouse",
    "Child",
    "Child 1",
    "Child 2",
    "wife",
    "Wife2",
    "Myself",
    "First Wife",
    "Second Wife",
    "Step Mother",
    "Step Brother",
    "Step Sister",
    "Third Wife",
    "mainchild",
    "Father in Law",
    "Mother in Law",
    "main_female_child",
  ];

  final imageValue = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    relationList.forEach(
      (element) {
        items.add(DropdownMenuItem(
          value: element,
          child: Text(element),
        ));
      },
    );
    print('r_id:::::::::::::::${r_id}');
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

  clickOnSaveChangesButton() async {
    if (imageValue.value != null) {
      if (relationController.text.trim().isNotEmpty &&
          fullNameController.text.trim().isNotEmpty &&
          mobilePhoneNumberController.text.trim().isNotEmpty &&
          emailController.text.trim().isNotEmpty &&
          dobController.text.trim().isNotEmpty &&
          countryController.text.trim().isNotEmpty &&
          stateController.text.trim().isNotEmpty &&
          cityController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        increment();
        Map<String, dynamic> bodyParams = {
          ApiKeyConstants.rid: r_id.toString(),
          ApiKeyConstants.linkedAccount: 'acc',
          ApiKeyConstants.relation: relationController.text.toString(),
          ApiKeyConstants.fullName: fullNameController.text.toString(),
          ApiKeyConstants.mobileNumber: mobilePhoneNumberController.text.toString(),
          ApiKeyConstants.email: emailController.text.toString(),
          ApiKeyConstants.dob: dobController.text.toString(),
          ApiKeyConstants.country: countryController.text.toString(),
          ApiKeyConstants.state: stateController.text.toString(),
          ApiKeyConstants.city: cityController.text.toString(),
          ApiKeyConstants.gender: gender.value?.name.toString(),
        };
        UserDataModel? userDataModel = await ApiMethods.addNewMember(
          bodyParams: bodyParams,
          image: imageValue.value,
          imageKey: ApiKeyConstants.image,
        );
        if (userDataModel != null &&
            userDataModel.success != null &&
            userDataModel.success!) {
          Get.back();
        }else{
          CommonMethods.showToast(msg: userDataModel?.message??'');
        }
        inAsyncCall.value = false;
        increment();
      } else {
        CommonMethods.showToast(msg: 'All field request!');
      }
    } else {
      CommonMethods.showToast(msg: 'Image field request!');
    }

    inAsyncCall.value = false;
    increment();
  }

  clickOnDob() async {
    DateTime? dateTime =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (dateTime != null) {
      dobController.text = DateFormat('MM/dd/yyyy').format(dateTime).toString();
    }
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

  Widget selectImageTextView() => Text(StringConstants.selectImage);

  Widget contentTextView() =>
      Text(StringConstants.chooseImageFromTheOptionsBelow);

  Widget cameraTextButtonView() => Text(StringConstants.camera);

  Widget galleryTextButtonView() => Text(StringConstants.gallery);

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
