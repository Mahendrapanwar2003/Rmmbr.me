import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
          controller.count.value;
          return Scaffold(
            body: Column(
              children: [
                CommonWidgets.commonAppBarView(isBackButtonVisible: false, appBarTitle: 'Profile'),
                Expanded(
                  child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                    children: [
                      userDataCardView(),
                      postCardView(),
                      SizedBox(
                        height: 40.px,
                        child: ListView.builder(
                          itemCount: controller.cardTabBarTitles.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: index != controller.cardTabBarTitles.length-1 ? 16.px : 0.px),
                              child: GestureDetector(
                                onTap: () => controller.clickOnTabBarView(tabBarValue:controller.cardTabBarTitles[index]),
                                child: Container(
                                  // height: 40.px,
                                  padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 10.px),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.px),
                                      color: controller.selectTabBarValue.value == controller.cardTabBarTitles[index]
                                          ? Theme.of(context).colorScheme.primary
                                          : Theme.of(context).colorScheme.onPrimary,
                                      border: Border.all(
                                          color: controller.selectTabBarValue.value == controller.cardTabBarTitles[index]
                                              ? Colors.transparent
                                              : Theme.of(context).colorScheme.surface.withOpacity(.2),
                                          width: controller.selectTabBarValue.value == controller.cardTabBarTitles[index]
                                              ? 0.px
                                              : .5.px
                                      )
                                  ),
                                  child: Text(
                                    controller.cardTabBarTitles[index],
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        // height: 1.2,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectTabBarValue.value == controller.cardTabBarTitles[index]
                                            ? Theme.of(context).colorScheme.onPrimary
                                            : Theme.of(context).colorScheme.surface
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 8.px),
                      if(controller.selectTabBarValue.value == 'Settings')
                        settingView(),
                      if(controller.selectTabBarValue.value == 'Info')
                      editProfileView(),
                      if(controller.selectTabBarValue.value == 'Posts')
                      postView(),
                      if(controller.selectTabBarValue.value == 'Photos')
                      photosView(),
                      if(controller.selectTabBarValue.value == 'Videos')
                      videosView(),
                      SizedBox(height: 80.px)
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }


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
                  twoRingsIconView(),
                ],
              ),
              SizedBox(height: 2.px),
              userDetailTextView(text: '1946 , Dallas , US '),
              SizedBox(height: 2.px),
              Row(
                children: [
                  userDetailTextView(text: '10 ',color: Theme.of(Get.context!).colorScheme.primary),
                  CommonMethods.appIcons(
                    assetName: IconConstants.icPpCoin,
                    height: 12.px,
                    width: 12.px
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget userProfileView({double? h,double? w}) => Container(
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
      assetName: IconConstants.icTwoRings,
      height: 14.px,
      width: 18.px
  );

  Widget userDetailTextView({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
      height: 1.2,
      fontSize: fontSize ?? 10.px,
      color: color,
      fontWeight: fontWeight
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget commonWidgetForCardRowText({required String text1,required String text2}) =>  Row(
    children: [
      Flexible(
        child: Text(
          text1,
          style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontSize: 17.px),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(width: 5.px),
      Text(
        text2,
        style: Theme.of(Get.context!).textTheme.titleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );

  Widget postCardView() => Container(
    margin: EdgeInsets.only(top: 16.px,bottom: 24.px),
    padding: EdgeInsets.all(16.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8.px),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: commonWidgetForCardRowText(text1: '100', text2: 'Posts'),
        ),
        SizedBox(width: 5.px),
        Expanded(
          flex: 4,
          child: commonWidgetForCardRowText(text1: '1.1K', text2: 'Followers'),
        ),
        SizedBox(width: 5.px),
        Expanded(
          flex: 4,
          child: commonWidgetForCardRowText(text1: '200', text2: 'Following'),
        ),
      ],
    ),
  );

  Widget commonEleButtonView({required String buttonText,required VoidCallback onPressed}) => CommonWidgets.commonElevatedButton(
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
       color: Theme.of(Get.context!).colorScheme.onPrimary
      ),
    ),
  );

  ///TODO Setting View

  Widget commonCardForSettingView({required String text,GestureTapCallback? onTap}) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: 16.px),
      padding: EdgeInsets.symmetric(vertical: 17.px,horizontal: 24.px),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12.px),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.labelSmall,
          ),
          Container(
            height: 24.px,
            width: 24.px,
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: RotatedBox(
              quarterTurns: 90,
              child: CommonMethods.appIcons(
                assetName: IconConstants.icBackArrow,
                height: 11.px,
                width: 11.px
              ),
            ),
          )
        ],
      ),
    ),
  );

  Widget settingView() => ListView.builder(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.cardSettingTitles.length,
    itemBuilder: (context, index) {
      if(index != controller.cardSettingTitles.length-1){
        return commonCardForSettingView(
          text: controller.cardSettingTitles[index],
          onTap: () => controller.clickOnSettingCards(index:index),
        );
      }else{
        return commonEleButtonView(
          onPressed: () => controller.clickOnSettingCards(index:index),
          buttonText: controller.cardSettingTitles[index],
        ).paddingOnly(top: 32.px);
      }
    },
  );

  ///TODO Edit Profile View

  Widget commonRowForEditProfileCardView({required String text1,required String text2})=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '$text1 :',
        style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
          fontSize: 16.px,
          color: Theme.of(Get.context!).colorScheme.primary
        ),
        textAlign: TextAlign.start,
      ),
      Text(
        text2,
        style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
         color: Theme.of(Get.context!).colorScheme.surface
        ),
        textAlign: TextAlign.end,
      ),
    ],
  );

  Widget editProfileView() =>  Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 32.px),
        padding: EdgeInsets.symmetric(vertical: 24.px,horizontal: 16.px),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12.px),
        ),
        child: Column(
          children: [
            commonRowForEditProfileCardView(text1: 'Email', text2: 'John234@gmail.com'),
            SizedBox(height: 20.px),
            commonRowForEditProfileCardView(text1: 'DOB', text2: '02/12/2024'),
            SizedBox(height: 20.px),
            commonRowForEditProfileCardView(text1: 'Gender', text2: 'Male'),
            SizedBox(height: 20.px),
            commonRowForEditProfileCardView(text1: 'Location', text2: 'Dallas , US'),
            SizedBox(height: 20.px),
            commonRowForEditProfileCardView(text1: 'Age', text2: '36'),
          ],
        ),
      ),
      SizedBox(height: 120.px),
      commonEleButtonView(buttonText: 'Edit Profile', onPressed: () {},)
    ],
  );

  ///TODO Post View

  Widget postView() => Container(
    margin: EdgeInsets.symmetric(vertical: 24.px),
    padding: EdgeInsets.symmetric(vertical: 16.px,horizontal: 14.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(12.px),
      boxShadow: [
        BoxShadow(
          color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.4),
          blurRadius: 5.px
        )
      ]
    ),
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
            height: 1.2
          ),
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
             return  Padding(
               padding: EdgeInsets.only(right: 10.px),
               child: Container(
                 height: 220,
                 width: 112.px,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(14.px),
                   image: DecorationImage(
                     image: AssetImage(controller.postCardImageList[index]),
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
                shape: BoxShape.circle
              ),
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
                color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
                shape: BoxShape.circle
              ),
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
                color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
                shape: BoxShape.circle
              ),
              child: CommonMethods.appIcons(
                assetName: IconConstants.icShare,
                height: 12.px,
                width: 14.px,
              ),
            ),
            Flexible(
              child: userDetailTextView(text: 'Q&A with Mark & 361k others'),
            ),
            CommonMethods.appIconsPng(
              assetName: 'assets/dummy_img/all_emoji.png',
              height: 17.px,
              width: 41.px
            )
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
                color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile_dummy.png'),
                )
              ),
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
                        width: 3.px
                      ),
                    ],
                  ),
                  SizedBox(height: 8.px),
                  userDetailTextView(text: 'Greet work! Well done girl. 👏🏽',fontSize: 12.px),
                  SizedBox(height: 12.px),
                  Row(
                    children: [
                      userDetailTextView(text: 'Like',fontWeight: FontWeight.w700),
                      SizedBox(width: 20.px),
                      userDetailTextView(text: 'Reply',fontWeight: FontWeight.w700),
                      SizedBox(width: 20.px),
                      userDetailTextView(text: '2m',),
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
      userProfileView(h: 48.px,w: 48.px),
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
                  color: Theme.of(Get.context!).colorScheme.primary
                ),
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
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  /// TODO Photos View

  Widget photosView() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.photosImgList.length,
    padding: EdgeInsets.symmetric(vertical: 24.px),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1, // Square images
    ),
    itemBuilder: (context, index) {
      return CommonMethods.appIconsPng(
        assetName: controller.photosImgList[index],
        height: 102.px,
        width: 124.px,
      );
    },
  );

  /// TODO Videos View

  Widget videosView() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: controller.photosImgList.length,
    padding: EdgeInsets.symmetric(vertical: 24.px),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1, // Square images
    ),
    itemBuilder: (context, index) {
      return CommonMethods.appIconsPng(
        assetName: controller.videosImgList[index],
        height: 102.px,
        width: 124.px,
      );
    },
  );

}
// reported_accounts
// help_support
// terms_of_use
// privacy_policy
// manage_notification
// privacy_settings