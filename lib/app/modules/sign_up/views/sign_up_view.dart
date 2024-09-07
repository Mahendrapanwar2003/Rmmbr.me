import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                          assetName: IconConstants.icLogo,
                          height: 166.px,
                        ),
                      ),
                      SizedBox(height: 32.px),
                      Center(
                        child: Text(
                          StringConstants.signup,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 22.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.fullName,
                        hintText: StringConstants.enterHere,
                        controller: controller.fullNameController,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.mobilePhoneNumber,
                        hintText: StringConstants.enterHere,
                        controller: controller.mobilePhoneNumberController,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.email,
                        hintText: StringConstants.enterHere,
                        controller: controller.emailController,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.dob,
                        hintText: StringConstants.enterHere,
                        controller: controller.dobController,
                      ),
                      SizedBox(height: 16.px),
                      Text(
                        StringConstants.gender,
                        style: Theme.of(Get.context!).textTheme.labelMedium,
                      ),
                      SizedBox(height: 16.px),
                      Row(
                        children: [
                          gender(
                            title: StringConstants.male,
                            value: Gender.male,
                            onChanged: (index) {
                              controller.gender = Gender.male;
                              controller.count;
                            },
                          ),
                          gender(
                            title: StringConstants.female,
                            value: Gender.female,
                            onChanged: (index) {
                              controller.gender = Gender.female;
                              controller.count;
                            },
                          ),
                          gender(
                            title: StringConstants.nonBinary,
                            value: Gender.nonBinary,
                            onChanged: (index) {
                              controller.gender = Gender.nonBinary;
                              controller.count;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 22.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnContinueButton(),
                        child: const Text(StringConstants.continueText),
                      ),
                      SizedBox(height: 48.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.alreadyAMember,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          InkWell(
                            onTap: () => controller.clickOnLoginButton(),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.px),
                              child: Text(
                                StringConstants.login,
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(
                                      letterSpacing: .2.px,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context).primaryColor,
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

  Widget gender({required String title, required Gender value, required ValueChanged? onChanged}) {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            disabledColor: Theme.of(Get.context!).colorScheme.surface,
          ),
          child: Radio(
            value: value,
            groupValue: controller.gender,
            onChanged: onChanged,
            activeColor: Theme.of(Get.context!).primaryColor,
          ),
        ),
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.headlineSmall,
        )
      ],
    );
  }

}
