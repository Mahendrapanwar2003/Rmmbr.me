import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/family_tree_controller.dart';

class FamilyTreeView extends GetView<FamilyTreeController> {
  const FamilyTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.increment();
        return Scaffold(
          body: Column(
            children: [
              CommonWidgets.commonAppBarView(
                  isBackButtonVisible: false,
                  appBarTitle: StringConstants.familyTree),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: SizeConstants.bodyHorizontalPadding,
                    vertical: 32.px),
                child: Column(
                  children: [
                    Container(
                      height: 54.px,
                      decoration: BoxDecoration(
                        color: Theme.of(Get.context!).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24.px),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 10.px),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: Theme.of(Get.context!)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 14.px),
                          unselectedLabelStyle: Theme.of(Get.context!)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(Get.context!)
                                    .textTheme
                                    .headlineMedium
                                    ?.color,
                              ),
                          dividerColor: Colors.transparent,
                          controller: controller.tabController,
                          indicator: BoxDecoration(
                            color: Theme.of(Get.context!).colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                                32.px), // Rounded selected tab
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          onTap: (value) => controller.clickOnTab(value: value),
                          tabs: const [
                            Tab(text: 'Family Tree'),
                            Tab(text: 'Requests'),
                          ],
                        ),
                      ),
                    ),
                    (controller.selectedTab.value == 0)
                        ? SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () => controller.clickOnAddMember(context: context),
                              child: Image.asset(
                                  'assets/images/tem_family_tree.png'),
                            ))
                        : SizedBox()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
