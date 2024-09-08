import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/modules/profile/views/profile_view.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationController extends GetxController  with GetSingleTickerProviderStateMixin {

  final count = 0.obs;
  late TabController tabController;

  final selectedTab = 0.obs;

  final currentValue = 0.3.obs;

  TextEditingController yourPPDeductionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnTab({required int value}) {
    selectedTab.value = value;
    increment();
  }

  void clickOnDeleteButton() {
    weeklyResetDialog();
  }

  void clickOnPublishButton() {
    showPublishCommentDialog();
  }

  void showPublishCommentDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
           () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Padding(
                padding: EdgeInsets.symmetric(vertical: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Publish Comment',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                    SizedBox(height: 14.px),
                    Text(
                      'Publication Points',
                      style: Theme.of(context).textTheme.labelSmall,
                    ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                    SizedBox(height: 8.px),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Theme.of(context).colorScheme.primary,
                        inactiveTrackColor: Theme.of(context).colorScheme.surface.withOpacity(.3),
                        trackHeight: 8.0,
                        thumbShape: _CustomThumbShape(),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.px),
                        valueIndicatorColor: Theme.of(context).colorScheme.primary,
                        valueIndicatorTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      child: Slider(
                        value: currentValue.value,
                        min: 0.1,
                        max: 0.5,
                        label: currentValue.value.toStringAsFixed(1),
                        onChanged: (value) {
                          currentValue.value = value;
                          yourPPDeductionController.text = value.toString();
                          increment();
                        },
                        allowedInteraction: SliderInteraction.slideThumb,
                      ).paddingSymmetric(horizontal: 6.px),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0.1',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '0.5',
                            style: Theme.of(context).textTheme.labelMedium
                        ),
                      ],
                    ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                    SizedBox(height: 16.px),
                    SizedBox(
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                        title: 'Your PP Deduction',
                        hintText: "Enter here...",
                        controller: yourPPDeductionController,
                        readOnly: true,
                      ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                    ),
                    SizedBox(height: 24.px),
                    SizedBox(
                      height:42.px,
                      child: const ProfileView().commonEleButtonView(
                        buttonText: 'Confirm',
                        onPressed: () {
                          Get.back();
                          rewardSuccessfulDialog();
                        },
                      ),
                    ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void rewardSuccessfulDialog(){
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
           () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Padding(
                padding: EdgeInsets.symmetric(vertical: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Reward Successful! 🎉',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void weeklyResetDialog(){
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
           () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding,vertical: 24.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 34.px),
                        CommonMethods.appIcons(
                          assetName: IconConstants.icPpCoin,
                          width: 89.px,
                          height: 89.px,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.px),
                    Text(
                      'Weekly Reset',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 9.px),
                    Text(
                      'PP Credits reset to 10. Unused credits have expired.',
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}

class _CustomThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20.0, 20.0); // Custom thumb size
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required Size sizeWithOverflow,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
      }) {
    final Canvas canvas = context.canvas;

    // Custom thumb design
    final Paint paint = Paint()
      ..color = Colors.black // Custom thumb color
      ..style = PaintingStyle.fill;

    // Draw a circle as the thumb
    canvas.drawCircle(center, 10.0, paint);

    // Draw a shadow for the thumb
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 14.0, shadowPaint);
  }
}
