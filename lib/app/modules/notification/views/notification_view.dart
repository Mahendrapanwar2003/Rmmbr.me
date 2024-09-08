import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/colors.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        body: Column(
          children: [
            CommonWidgets.commonAppBarView(appBarTitle: 'NOTIFICATIONS',isNotificationClick: false),
            Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                children: [
                  tabBarView(),
                  SizedBox(height: 15.px),
                  titleTextView(text: 'New'),
                  SizedBox(height: 10.px),
                  commonContainerView(
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height: 60.px,
                              width: 60.px,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface.withOpacity(.2),
                                shape: BoxShape.circle
                              ),
                            ),
                            Container(
                              height: 24.px,
                              width: 24.px,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                shape: BoxShape.circle
                              ),
                              child: Icon(
                                Icons.message,
                                size: 12.px,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 14.px),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleTextView(
                                text: 'Eric Sinclair Commented on your story.',
                                fontSize: 14.px,
                                maxLines: 2
                              ),
                              Text(
                                '6 hour ago',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              SizedBox(height: 10.px),
                              SizedBox(
                                height: 38.px,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CommonWidgets.commonElevatedButton(
                                        buttonColor: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
                                        onPressed: () => controller.clickOnDeleteButton(),
                                        child: Text(
                                          'Delete',
                                          style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
                                           letterSpacing: 0
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.px),
                                    Expanded(
                                      child: CommonWidgets.commonElevatedButton(
                                        onPressed: () => controller.clickOnPublishButton(),
                                        child: Text(
                                          'Publish',
                                          style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
                                           color: Theme.of(Get.context!).colorScheme.onPrimary,
                                            letterSpacing: 0
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px),
                  titleTextView(text: 'Earlier'),
                  SizedBox(height: 10.px),
                  commonContainerView(
                    widget: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height: 60.px,
                              width: 60.px,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface.withOpacity(.2),
                                shape: BoxShape.circle
                              ),
                            ),
                            Container(
                              height: 24.px,
                              width: 24.px,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                shape: BoxShape.circle
                              ),
                              child: Icon(
                                Icons.message,
                                size: 12.px,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 14.px),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleTextView(
                                text: 'Robin Buckley shred a reel: Design Faster With The Best Figma AI Plugins 😍⚡',
                                fontSize: 14.px,
                                maxLines: 3
                              ),
                              Text(
                                '4 days ago',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget tabBarView() => Container(
    height: 54.px,
    padding: EdgeInsets.symmetric(horizontal: 11.px, vertical: 9.px),
    decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: AppLightColors().text.withOpacity(.12),
            blurRadius: 10.px,
            offset: Offset(1.px, 0.px),
          ),
        ],
        borderRadius: BorderRadius.circular(24.px)
    ),
    child: TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontSize: 14.px),
      unselectedLabelStyle: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
        fontSize: 14.px,
        color: Theme.of(Get.context!).textTheme.headlineMedium?.color,
      ),
      dividerColor: Colors.transparent,
      controller: controller.tabController,
      indicator: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.primary,
        borderRadius: BorderRadius.circular(32.px),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      onTap: (value) => controller.clickOnTab(value: value),
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'My Story'),
      ],
    ),
  );

  Widget titleTextView({required String text,double? fontSize, int? maxLines}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
     fontWeight: FontWeight.w500,
      fontSize: fontSize,
      wordSpacing: 0,
      letterSpacing: 0
    ),
    maxLines: maxLines ?? 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget commonContainerView({required Widget widget}) => Container(
    padding: EdgeInsets.all(14.px),
    decoration: BoxDecoration(
     color: Theme.of(Get.context!).colorScheme.onPrimary,
     boxShadow: [
      BoxShadow(
       color: AppLightColors().text.withOpacity(.12),
       blurRadius: 10.px,
       offset: Offset(1.px, 0.px),
      ),
     ],
     borderRadius: BorderRadius.circular(12.px)
    ),
    child: widget,
  );

}
