import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(
              isBackButtonVisible: false, appBarTitle: StringConstants.home),
          SizedBox(height: 24.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
            child: commonCardForSettingView(text: 'Rmmbr'),
          ),
          SizedBox(height: 24.px),
          Padding(
            padding: EdgeInsets.only(left: SizeConstants.bodyHorizontalPadding),
            child: SizedBox(
              height: 120.px,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.px),
                    child: Column(children: [
                      CommonMethods.appIcons(
                        assetName: IconConstants.icAddStory,
                        height: 75.px,
                        width: 75.px,
                      ),
                      SizedBox(height: 6.px),
                      Text(
                        'My Story',
                        style:  Theme.of(Get.context!).textTheme.labelLarge,
                      ),
                    ]),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 24.px),
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: SizeConstants.bodyHorizontalPadding),
              children: [

                CommonWidgets.commonSearchFieldView(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget commonCardForSettingView(
          {required String text, GestureTapCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.px, horizontal: 16.px),
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12.px),
          ),
          child: Row(
            children: [
              CommonMethods.appIconsPng(
                assetName: 'assets/images/profile_dummy.png',
                height: 40.px,
                width: 40.px,
              ),
              SizedBox(width: 12.px),
              Text(
                text,
                style: Theme.of(Get.context!).textTheme.labelSmall,
              ),
              Spacer(),
              CommonMethods.appIcons(
                  assetName: IconConstants.icVerticalEllipsis, height: 30.px)
            ],
          ),
        ),
      );

  Widget userDataCardView() => Container(
        height: 76.px,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 17.px, vertical: 8.px),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12.px),
        ),
        child: Row(
          children: [
            userHomeView(),
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
                  SizedBox(height: 2.px),
                  userDetailTextView(text: '1946 , Dallas , US '),
                  SizedBox(height: 2.px),
                  Row(
                    children: [
                      userDetailTextView(
                          text: '10 ',
                          color: Theme.of(Get.context!).colorScheme.primary),
                      CommonMethods.appIcons(
                          assetName: IconConstants.icPpCoin,
                          height: 12.px,
                          width: 12.px)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget userHomeView() => Container(
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
        'Martha Craig ',
        style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
              height: 1.2,
              fontWeight: FontWeight.w600,
              color: const Color(0xff19295C),
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget checkIconView() => CommonMethods.appIcons(
        assetName: IconConstants.icCheck,
        width: 12.px,
        height: 12.px,
      );

  Widget userDetailTextView({required String text, Color? color}) => Text(
        text,
        style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(height: 1.2, fontSize: 10.px, color: color),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
