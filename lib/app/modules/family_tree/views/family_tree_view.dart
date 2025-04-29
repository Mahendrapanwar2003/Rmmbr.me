import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/family_tree_controller.dart';

class FamilyTreeView extends GetView<FamilyTreeController> {
  const FamilyTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return controller.inAsyncCall.value ? CircularProgressIndicator():Scaffold(
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
                  if (controller.selectedTab.value == 0)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 4.px),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/1.6,
                            child: WebViewWidget(
                                controller: controller.webViewController),
                          ),
                        ],
                      ),
                    )
                  else
                    controller.requests.isEmpty?Center(child: CommonMethods.dataNotFound()):
                    ListView.builder(
                      itemCount: controller.requests.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 16.px),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.px,
                            horizontal: 14.px,
                          ),
                          decoration: BoxDecoration(
                            color:
                            Theme.of(Get.context!).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(24.px),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidgets.imageView(image: controller.requests[index].profileImageUrl ?? '', height: 60.px,
                                width: 60.px,borderRadius: BorderRadius.circular(30.px)),
                              SizedBox(width: 14.px),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.requests[index].fullName ?? ''} is inviting you, as a ${controller.requests[index].relation ?? ''}, to be included in the family tree.',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                        color: Theme.of(Get.context!)
                                            .colorScheme
                                            .primary,
                                        fontSize: 14.px,
                                      ),
                                    ),
                                    SizedBox(height: 10.px),
                                    SizedBox(
                                      height: 38.px,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CommonWidgets
                                                .commonElevatedButton(
                                              buttonColor:
                                              Theme.of(Get.context!)
                                                  .colorScheme
                                                  .surface
                                                  .withOpacity(.2),
                                              onPressed: () {},
                                              child: Text(
                                                'Reject',
                                                style: Theme.of(Get.context!)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                    letterSpacing: 0,
                                                    fontSize: 14.px),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16.px),
                                          Expanded(
                                            child: CommonWidgets
                                                .commonElevatedButton(
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.px),
                                              onPressed: () => controller
                                                  .clickOnAcceptButton(index: index),
                                              child: Text(
                                                'Accept',
                                                style: Theme.of(Get.context!)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                    color: Theme.of(
                                                        Get.context!)
                                                        .colorScheme
                                                        .onPrimary,
                                                    letterSpacing: 0,
                                                    wordSpacing: 0,
                                                    fontSize: 14.px),
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
                        );
                      },
                    )
                ],
              ),
            )
          ],
        ),
      );
    },);
  }
}
