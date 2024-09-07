import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () => controller.onWillPopMethod(),
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: controller.body(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.px),
                  topLeft: Radius.circular(24.px)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.px,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(8.px),
                        child: GNav(
                          padding: EdgeInsets.zero,
                          tabs: [
                            button(
                                image: selectedIndex.value == 0
                                    ? IconConstants.icActiveHome
                                    : IconConstants.icInActiveHome,
                                text: StringConstants.home,
                                index: 0),
                            button(
                                image: selectedIndex.value == 1
                                    ? IconConstants.icActiveTree
                                    : IconConstants.icInActiveTree,
                                text: StringConstants.tree,
                                index: 1),
                            button(
                                image: selectedIndex.value == 2
                                    ? IconConstants.icActiveCalendar
                                    : IconConstants.icInActiveCalendar,
                                text: StringConstants.calendar,
                                index: 2),
                            button(
                                image: selectedIndex.value == 3
                                    ? IconConstants.icActiveChat
                                    : IconConstants.icInActiveChat,
                                text: StringConstants.chat,
                                index: 3),
                            button(
                                image: selectedIndex.value == 4
                                    ? IconConstants.icActiveProfile
                                    : IconConstants.icInActiveProfile,
                                text: StringConstants.profile,
                                index: 4),
                          ],
                          selectedIndex: selectedIndex.value,
                          onTabChange: (index) {
                            selectedIndex.value = index;
                            controller.increment();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  button({required String image, required String text, required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          CommonMethods.appIcons(
            assetName: image,
            width: 36.px,
            height: 36.px,
          ),
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
                  fontSize: 12.px,
                  color: selectedIndex.value == index
                      ? Theme.of(Get.context!).textTheme.headlineMedium?.color
                      : null,
                ),
          ),
        ],
      ),
    );
  }
}
