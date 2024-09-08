import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
          ),
          child: Center(
            child: Image.asset(
              ImageConstants.imageLogoSplash,
              width: 270.px,
              height: 326.px,
            ),
          ),
        ),
      );
    });
  }
}
