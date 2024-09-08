import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
                          StringConstants.forgotPasswordCapital,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 32.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.emailOrMobilePhoneNumber,
                        hintText: StringConstants.enterHere,
                        controller:
                            controller.emailOrMobilePhoneNumberController,
                      ),
                      SizedBox(height: 64.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnContinueButton(),
                        child: const Text(StringConstants.continueText),
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
