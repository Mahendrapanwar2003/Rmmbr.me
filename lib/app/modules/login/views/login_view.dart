import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                        child: CommonMethods.appIcons(assetName: IconConstants.icLogo, height: 166.px),
                      ),
                      SizedBox(height: 64.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.enterYourEmailAndPassword,
                        hintText: StringConstants.enterHere,
                        controller: controller.enterYourEmailAndPasswordController,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        title: StringConstants.password,
                        hintText: StringConstants.enterHere,
                        controller: controller.passwordController,
                      ),
                      SizedBox(height: 12.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20.px,
                                width: 20.px,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(4.px),
                                ),
                              ),
                              SizedBox(width: 8.px),
                              Text(
                                StringConstants.rememberMe,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => controller.clickOnForgotPassword(),
                            child: Text(
                              StringConstants.forgotPassword,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14.px),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24.px),
                      Text(
                        StringConstants.useMobileData,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 64.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnLoginButton(),
                        child: const Text(StringConstants.loginCapital),
                      ),
                      SizedBox(height: 24.px),
                      CommonWidgets.commonElevatedButton(
                        buttonColor: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () => controller.clickOnLoginButton(),
                        child: Text(
                          StringConstants.createANewAccount,
                          style: Theme.of(Get.context!).textTheme.labelSmall
                              ?.copyWith(color: Theme.of(Get.context!).primaryColor),
                        ),
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
