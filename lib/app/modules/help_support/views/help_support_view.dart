import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/help_support_controller.dart';

class HelpSupportView extends GetView<HelpSupportController> {
  const HelpSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        body: Column(
          children: [
            CommonWidgets.commonAppBarView(appBarTitle: 'Help & Support'),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index != 9 ? 16.px : 50.px),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding,vertical: 16.px),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(12.px),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => controller.clickOnDropDownButton(index:index),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet.',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    letterSpacing: 0,
                                    wordSpacing: 0
                                  ),
                                ),
                                Container(
                                  height: 24.px,
                                  width: 24.px,
                                  decoration: BoxDecoration(
                                   color: controller.helpSupportSelectedValue.value.contains('$index')
                                     ? Theme.of(context).colorScheme.primary
                                     : Theme.of(context).colorScheme.surface,
                                   shape: BoxShape.circle
                                  ),
                                  child: RotatedBox(
                                    quarterTurns: controller.helpSupportSelectedValue.value.contains('$index')
                                        ? 135
                                        : 45,
                                    child: CommonMethods.appIcons(
                                        assetName: IconConstants.icBackArrow,
                                        height: 10.px,
                                        width: 6.px
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if(controller.helpSupportSelectedValue.value.contains('$index'))
                          SizedBox(height: 8.px),
                          if(controller.helpSupportSelectedValue.value.contains('$index'))
                          Text(
                            '''Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ''',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              // letterSpacing: 0,
                              // wordSpacing: 0
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => controller.clickOnNeedHelpView(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 8.px),
                    margin: EdgeInsets.only(right: 13.px),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(4.px)
                    ),
                    child: Text(
                      'Need Help?',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  CommonMethods.appIcons(
                    assetName: IconConstants.icHelpSupport,
                    height: 48.px,
                    width: 48.px
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
