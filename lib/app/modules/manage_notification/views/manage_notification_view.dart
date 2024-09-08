import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/manage_notification_controller.dart';

class ManageNotificationView extends GetView<ManageNotificationController> {
  const ManageNotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Column(
          children: [
            CommonWidgets.commonAppBarView(appBarTitle: 'Manage'),
            Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                children: [
                  commonSwitchButton(
                    title: 'Request Notifications',
                    value: controller.requestNotificationsValue.value,
                    onTap: (val) => controller.clickOnRequestNotification(val:val),
                  ),
                  commonSwitchButton(
                    title: 'Message Notifications',
                    value: controller.msgNotificationsValue.value,
                    onTap: (val) => controller.clickOnMessageNotification(val:val),
                  ),
                  commonSwitchButton(
                    title: 'Comment Notifications',
                    value: controller.commentNotificationsValue.value,
                    onTap: (val) => controller.clickOnCommentNotification(val:val),
                  ),
                  commonSwitchButton(
                    title: 'Post Notifications',
                    value: controller.postNotificationsValue.value,
                    onTap: (val) => controller.clickOnPostNotification(val:val),
                  ),
                  commonSwitchButton(
                    title: 'Events Notifications',
                    value: controller.eventsNotificationsValue.value,
                    onTap: (val) => controller.clickOnEventsNotification(val:val),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget commonSwitchButton({
    required String title,
    required bool value,
    required Function onTap,
  }) => Container(
    padding: EdgeInsets.symmetric(horizontal: 16.px,vertical: 21.px),
    margin: EdgeInsets.only(bottom: 16.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(12.px),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.labelSmall,
        ),
        GestureDetector(
          onTap: () {
            value = !value;
            onTap(value);
            controller.count.value++;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 20,
            width: 40,
            padding: EdgeInsets.symmetric(horizontal: 2.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: value
                  ? Theme.of(Get.context!).colorScheme.primary
                  : Theme.of(Get.context!).colorScheme.surface.withOpacity(.5),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(Get.context!).colorScheme.onPrimary,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

}
