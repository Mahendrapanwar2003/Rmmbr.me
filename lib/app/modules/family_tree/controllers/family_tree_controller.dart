import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/size_constants.dart';

class FamilyTreeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;

  final selectedTab = 0.obs;

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

  clickOnTab({required int value}) {
    selectedTab.value = value;
    increment();
  }

  clickOnAddMember({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.px),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConstants.bodyHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.px),
                Container(
                  height: 5.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.px),
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(.2.px)),
                ),
                SizedBox(height: 12.px),
                userDataCardView(),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  title: Text(
                    'Dallas , US',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icDallasUs),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.EDIT_MEMBER);
                  },
                  title: Text(
                    'Edit',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icEditMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  title: Text(
                    'Delete Member',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icDeleteMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  title: Text(
                    'Report Member',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icReportMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget userDataCardView() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userProfileView(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: userNameTextView(),
                      ),
                      checkIconView(),
                    ],
                  ),
                  SizedBox(height: 4.px),
                  userDetailTextView(text: '1970, Hamburg'),
                ],
              ),
            ),
            CommonMethods.appIcons(assetName: IconConstants.icCross)
          ],
        ),
      );

  Widget userProfileView() => Container(
        height: 61.px,
        width: 61.px,
        margin: EdgeInsets.only(right: 9.px),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: CommonMethods.appIconsPng(
          assetName: 'assets/images/profile_dummy.png',
          height: 60.px,
          width: 60.px,
        ),
      );

  Widget userNameTextView() => Text(
        'Erina Yamashita ',
        style:
            Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget checkIconView() => CommonMethods.appIcons(
        assetName: IconConstants.icCheck,
        width: 12.px,
        height: 12.px,
      );

  Widget userDetailTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(height: 1.2, fontSize: 10.px),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
