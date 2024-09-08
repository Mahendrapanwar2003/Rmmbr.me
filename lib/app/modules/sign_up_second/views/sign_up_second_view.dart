import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/sign_up_second_controller.dart';

class SignUpSecondView extends GetView<SignUpSecondController> {
  const SignUpSecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: GestureDetector(
          onTap: () => CommonMethods.unFocsKeyBoard(),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.px),
                      Center(
                        child: CommonMethods.appIcons(
                            assetName: IconConstants.icLogo, height: 166.px),
                      ),
                      SizedBox(height: 32.px),
                      Center(
                        child: Text(
                          StringConstants.signup,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 22.px),
                      Center(
                        child: CommonMethods.appIconsPng(
                            assetName: IconConstantsPng.icAddProfileImage,
                            height: 64.px,
                            width: 64.px),
                      ),
                      SizedBox(height: 16.px),
                      Center(
                        child: Text(
                          StringConstants.addProfileImage,
                          style: Theme.of(Get.context!).textTheme.labelMedium,
                        ),
                      ),
                      SizedBox(height: 24.px),
                      /*CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.country,
                        hintText: StringConstants.enterHere,
                        controller: controller.countryController,
                      ),
                      SizedBox(height: 16.px),*/
                      CommonWidgets.commonDropDownForLoginSignUP(
                        title: StringConstants.country,
                        hintText: StringConstants.enterHere,
                        controller: controller.countryController,
                        value: controller.countryValue.value,
                        items: <String>[
                          'India',
                          'Uk',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: Theme.of(context).textTheme.titleMedium),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.countryValue.value = value ?? '';
                        },
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonDropDownForLoginSignUP(
                        title: StringConstants.city,
                        hintText: StringConstants.enterHere,
                        controller: controller.cityController,
                        value: controller.cityValue.value,
                        items: <String>[
                          'Indore',
                          'Ujjain',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: Theme.of(context).textTheme.titleMedium),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.cityValue.value = value ?? '';
                        },
                      ),/*
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.city,
                        hintText: StringConstants.enterHere,
                        controller: controller.cityController,
                      ),*/
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.createPassword,
                        hintText: StringConstants.enterHere,
                        controller: controller.createPasswordController,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.reEnterPassword,
                        hintText: StringConstants.enterHere,
                        controller: controller.reEnterPasswordController,
                      ),
                      SizedBox(height: 8.px),
                      GestureDetector(
                        onTap: () => controller.clickOnAcceptTermsOfUseCheckBox(),
                        child: Row(
                          children: [
                            Container(
                              height: 20.px,
                              width: 20.px,
                              decoration: BoxDecoration(
                                  color: controller.acceptTermsOfUseValue.value
                                      ? const Color(0xffF3F3F3)
                                      : null,
                                  border: controller.acceptTermsOfUseValue.value
                                      ? null
                                      : Border.all(
                                      color:
                                      Theme.of(context).primaryColor),
                                  borderRadius:
                                  BorderRadius.circular(4.px)),
                              child: controller.acceptTermsOfUseValue.value
                                  ? const SizedBox()
                                  : Center(
                                child:
                                Icon(Icons.done, size: 16.px),
                              ),
                            ),
                            SizedBox(width: 8.px),
                            Text(
                              StringConstants.acceptTermsOfUse,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                letterSpacing: .2.px,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnSignUpButton(),
                        child: const Text(StringConstants.signup),
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StringConstants.alreadyAMember,
                              style: Theme.of(context).textTheme.labelLarge),
                          InkWell(
                            onTap: () => controller.clickOnLoginButton(),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.px),
                              child: Text(
                                StringConstants.login,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      letterSpacing: .2.px,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
