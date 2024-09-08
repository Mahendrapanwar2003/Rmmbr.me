import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/enter_code_controller.dart';

class EnterCodeView extends GetView<EnterCodeController> {
  const EnterCodeView({Key? key}) : super(key: key);

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
                          StringConstants.enterCode,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(height: 32.px),
                      Text(
                        StringConstants.enterOtpCodeHere,
                        style: Theme.of(Get.context!).textTheme.labelMedium,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonOtpView(),
                      SizedBox(height: 64.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnConfirmButton(),
                        child: const Text(StringConstants.confirm),
                      ),
                      SizedBox(height: 48.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StringConstants.didNotReceiveACode,
                              style: Theme.of(context).textTheme.labelLarge),
                          InkWell(
                            onTap: () => controller.clickOnResendButton(),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.px),
                              child: Text(
                                StringConstants.resend,
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
