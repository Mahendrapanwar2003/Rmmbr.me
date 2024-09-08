import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/common/colors.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        body: Column(
          children: [
            CommonWidgets.commonAppBarView(appBarTitle: 'POST'),
            Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                children: [
                  userCardView(),
                  SizedBox(height: 15.px),
                  commonContainerView(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleTextView(text: 'RealCheck*'),
                        SizedBox(height: 24.px),
                        ListView.builder(
                          itemCount: controller.realCheckList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.px),
                              child: GestureDetector(
                                onTap: () => controller.clickOnRealCheckItem(index:index),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 16.px,
                                      width: 16.px,
                                      margin: EdgeInsets.only(right: 8.px),
                                      decoration: BoxDecoration(
                                          color: controller.realCheckSelectedValue.value.contains(controller.realCheckList[index])
                                              ? Theme.of(context).colorScheme.primary
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: controller.realCheckSelectedValue.value.contains(controller.realCheckList[index])
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).colorScheme.surface,
                                          ),
                                          borderRadius: BorderRadius.circular(2.px)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: controller.realCheckSelectedValue.value.contains(controller.realCheckList[index])
                                              ? Theme.of(context).colorScheme.onPrimary
                                              : Colors.transparent,
                                          size: 12.px,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.realCheckList[index],
                                      style: Theme.of(context).textTheme.labelLarge,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16.px),
                        titleTextView(text: 'Classification*'),
                        SizedBox(height: 24.px),
                        ListView.builder(
                          itemCount: controller.classificationList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.px),
                              child: GestureDetector(
                                onTap: () => controller.clickOnClassificationItem(index:index),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 16.px,
                                      width: 16.px,
                                      margin: EdgeInsets.only(right: 8.px),
                                      decoration: BoxDecoration(
                                       color: controller.classificationSelectedValue.value.contains(controller.classificationList[index])
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                       border: Border.all(
                                        color: controller.classificationSelectedValue.value.contains(controller.classificationList[index])
                                          ? Theme.of(context).colorScheme.primary
                                         : Theme.of(context).colorScheme.surface,
                                        ),
                                       borderRadius: BorderRadius.circular(2.px)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: controller.classificationSelectedValue.value.contains(controller.classificationList[index])
                                              ? Theme.of(context).colorScheme.onPrimary
                                              : Colors.transparent,
                                          size: 12.px,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      controller.classificationList[index],
                                      style: Theme.of(context).textTheme.labelLarge,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
  
  Widget titleTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
     fontWeight: FontWeight.w500
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget commonContainerView({required Widget widget}) => Container(
    padding: EdgeInsets.all(16.px),
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

  Widget userCardView() => commonContainerView(
    widget: Column(
    children: [
      Row(
        children: [
          Container(
            height: 40.px,
            width: 40.px,
            margin: EdgeInsets.only(right: 9.px),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: CommonMethods.appIconsPng(
              assetName: 'assets/images/profile_dummy.png',
              height: 40.px,
              width: 40.px,
            ),
          ),
          Expanded(
            child: titleTextView(text: 'Tyler Tornberg '),
          ),
          SizedBox(
            width: 88.px,
            height: 38.px,
            child: CommonWidgets.commonElevatedButton(
              onPressed: () => Get.toNamed(Routes.MY_STORY),
              child: Text(
                'Post',
                style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(Get.context!).colorScheme.onPrimary,
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 16.px),
      Text(
        '''1980: \nJan, 8: "Had a major operation today."\nFeb,1: "Had a dental surgery''',
        style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
            color: Theme.of(Get.context!).colorScheme.surface
        ),
      ),
      SizedBox(height: 113.px),
    ],
  ),
  );

}
