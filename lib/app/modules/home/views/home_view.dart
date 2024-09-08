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
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: SizeConstants.bodyHorizontalPadding),
              children: [
                SizedBox(height: 24.px),
                commonCardForSettingView(text: 'Rmmbr'),
                SizedBox(height: 24.px),
                SizedBox(
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
                            style: Theme.of(Get.context!).textTheme.labelLarge,
                          ),
                        ]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 4.px),
                CommonWidgets.commonSearchFieldView(),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => postView(),
                ),
                SizedBox(height: 80.px),
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
                  assetName: IconConstants.icGrayMenu,
                  height: 20.px,
                  width: 4.px,
                  color: Theme.of(Get.context!).colorScheme.primary),
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

  Widget userProfileView({double? h, double? w}) => Container(
        height: h ?? 61.px,
        width: w ?? 61.px,
        margin: EdgeInsets.only(right: 9.px),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: CommonMethods.appIconsPng(
          assetName: 'assets/images/profile_dummy.png',
          height: h ?? 60.px,
          width: w ?? 60.px,
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

  Widget twoRingsIconView() => CommonMethods.appIcons(
      assetName: IconConstants.icTwoRings, height: 14.px, width: 18.px);

  Widget postView() => Container(
        margin: EdgeInsets.symmetric(vertical: 24.px),
        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 14.px),
        decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12.px),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(Get.context!)
                      .colorScheme
                      .surface
                      .withOpacity(.4),
                  blurRadius: 5.px)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postUserDataCardView(),
            SizedBox(height: 18.px),
            Text(
              '''Hey pals, guess what? 🎉 I've just wrapped up crafting these mind-blowing 3D wallpapers, drenched in the coolest of the cool colors! 🌈💎''',
              style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
                  color: const Color(0xff2D3F7B),
                  wordSpacing: 0,
                  letterSpacing: 0,
                  height: 1.2),
            ),
            SizedBox(height: 16.px),
            SizedBox(
              height: 220.px,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.px),
                    child: Container(
                      height: 220,
                      width: 112.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.px),
                        image: DecorationImage(
                          image:
                              AssetImage(controller.postCardImageList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 18.px),
            userDetailTextView(text: '3.4k Comments • 46 Shares • 46 Likes'),
            SizedBox(height: 10.px),
            Row(
              children: [
                Container(
                  height: 40.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                      color: Theme.of(Get.context!).colorScheme.primary,
                      shape: BoxShape.circle),
                  child: CommonMethods.appIcons(
                    assetName: IconConstants.icLike,
                    height: 20.px,
                    width: 20.px,
                  ),
                ),
                Container(
                  height: 40.px,
                  width: 40.px,
                  margin: EdgeInsets.symmetric(horizontal: 10.px),
                  decoration: BoxDecoration(
                      color: Theme.of(Get.context!)
                          .colorScheme
                          .surface
                          .withOpacity(.2),
                      shape: BoxShape.circle),
                  child: CommonMethods.appIcons(
                    assetName: IconConstants.icMessage,
                    height: 14.px,
                    width: 14.px,
                  ),
                ),
                Container(
                  height: 40.px,
                  width: 40.px,
                  margin: EdgeInsets.only(right: 22.px),
                  decoration: BoxDecoration(
                      color: Theme.of(Get.context!)
                          .colorScheme
                          .surface
                          .withOpacity(.2),
                      shape: BoxShape.circle),
                  child: CommonMethods.appIcons(
                    assetName: IconConstants.icShare,
                    height: 12.px,
                    width: 14.px,
                  ),
                ),
                Flexible(
                  child:
                      userDetailTextView(text: 'Q&A with Mark & 361k others'),
                ),
                CommonMethods.appIconsPng(
                    assetName: 'assets/dummy_img/all_emoji.png',
                    height: 17.px,
                    width: 41.px)
              ],
            ),
            SizedBox(height: 18.px),
            CommonWidgets.commonDividerView(),
            SizedBox(height: 16.px),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30.px,
                  width: 30.px,
                  margin: EdgeInsets.only(right: 8.px),
                  decoration: BoxDecoration(
                      color: Theme.of(Get.context!)
                          .colorScheme
                          .surface
                          .withOpacity(.2),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile_dummy.png'),
                      )),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: postUserNameTextView(),
                          ),
                          CommonMethods.appIcons(
                              assetName: IconConstants.icGrayMenu,
                              height: 12.px,
                              width: 3.px),
                        ],
                      ),
                      SizedBox(height: 8.px),
                      userDetailTextView(
                          text: 'Greet work! Well done girl. 👏🏽',
                          fontSize: 12.px),
                      SizedBox(height: 12.px),
                      Row(
                        children: [
                          userDetailTextView(
                              text: 'Like', fontWeight: FontWeight.w700),
                          SizedBox(width: 20.px),
                          userDetailTextView(
                              text: 'Reply', fontWeight: FontWeight.w700),
                          SizedBox(width: 20.px),
                          userDetailTextView(
                            text: '2m',
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget postUserDataCardView() => Row(
        children: [
          userProfileView(h: 48.px, w: 48.px),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          userNameTextView(),
                          checkIconView(),
                          twoRingsIconView()
                        ],
                      ),
                    ),
                    CommonMethods.appIcons(
                        assetName: IconConstants.icGrayMenu,
                        height: 20.px,
                        width: 4.px,
                        color: Theme.of(Get.context!).colorScheme.primary),
                  ],
                ),
                SizedBox(height: 4.px),
                userDetailTextView(text: '1970, Hamburg'),
                SizedBox(height: 2.px),
                userDetailTextView(text: 'Ryan Yashmak'),
              ],
            ),
          ),
        ],
      );

  Widget postUserProfileView() => Container(
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

  Widget postUserNameTextView() => Text(
        'Ryan Yashmak ',
        style:
            Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget userDetailTextView({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            height: 1.2,
            fontSize: fontSize ?? 10.px,
            color: color,
            fontWeight: fontWeight),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
