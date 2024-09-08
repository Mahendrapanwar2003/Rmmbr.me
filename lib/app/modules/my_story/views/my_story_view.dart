import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/colors.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/my_story_controller.dart';

class MyStoryView extends GetView<MyStoryController> {
  const MyStoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(appBarTitle: 'MY STORY'),
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
              children: [
                userDataCardView(),
                userCardView(),
                searchAndYearDropDownView(),
                ListView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 24.px),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 24.px),
                      child: postView(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

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

  Widget userProfileView({double? h, double? w}) => Container(
    height: h ?? 48.px,
    width: w ?? 48.px,
    margin: EdgeInsets.only(right: 9.px),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: CommonMethods.appIconsPng(
      assetName: 'assets/images/profile_dummy.png',
      height: h ?? 48.px,
      width: w ?? 48.px,
    ),
  );

  Widget userDataCardView() => Container(
    height: 80.px,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 16.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(16.px),
      boxShadow: [
        BoxShadow(
          color: AppLightColors().text.withOpacity(.12),
          blurRadius: 10.px,
          offset: Offset(1.px, 0.px),
        ),
      ],
    ),
    child: Row(
      children: [
        userProfileView(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Erica Sinclair',
              style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(
                color: Theme.of(Get.context!).colorScheme.primary
              ),
            ),
            Text(
              'Dallas , US',
              style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(
                fontSize: 14.px
              ),
            ),
          ],
        )
      ],
    ),
  );

  Widget userCardView() => Container(
    height: 80.px,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 12.px,vertical: 16.px),
    margin: EdgeInsets.only(top: 16.px,bottom: 24.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(16.px),
      boxShadow: [
        BoxShadow(
          color: AppLightColors().text.withOpacity(.12),
          blurRadius: 10.px,
          offset: Offset(1.px, 0.px),
        ),
      ],
    ),
    child: Row(
      children: [
        userProfileView(),
        Text(
          'Rmmbr',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(
            color: Theme.of(Get.context!).colorScheme.primary,
            fontWeight: FontWeight.w600
          ),
        ),
        const Spacer(),
        CommonMethods.appIcons(
          assetName: IconConstants.icGrayMenu,
          height: 20.px,
          width: 4.px,
          color: Theme.of(Get.context!).colorScheme.primary,
        ),
      ],
    ),
  );

  Widget searchAndYearDropDownView() => Row(
    children: [
      Expanded(
        child: CommonWidgets.commonSearchFieldView(),
      ),
      SizedBox(width: 16.px),
      Container(
        padding: EdgeInsets.all(10.px),
        decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
                color: AppLightColors().text.withOpacity(.12),
                blurRadius: 10.px,
                offset: Offset(1.px, 0.px),
              ),
            ],
          color: Theme.of(Get.context!).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(6.px)
        ),
        child: Row(
          children: [
            Text(
              '2024',
              style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
                color: Theme.of(Get.context!).colorScheme.primary,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(width: 8.px),
            CommonMethods.appIcons(
              assetName: IconConstants.icCalendar,
              height: 16.px,
              width: 16.px
            )
          ],
        ),
      )
    ],
  );

  Widget postView() => Container(
    padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 14.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(12.px),
      boxShadow: [
          BoxShadow(
            color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.4),
            blurRadius: 5.px,
          )
        ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        postUserDataCardView(),
        SizedBox(height: 18.px),
        Text(
          '''1980:\nJan, 8: "Had a major operation today."\nFeb,1: "Had a dental surgery''',
          style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
            // color: const Color(0xff2D3F7B),
            wordSpacing: 0,
            letterSpacing: 0,
            height: 1.2,
          ),
        ),
        SizedBox(height: 18.px),
        Align(
          alignment: Alignment.centerRight,
          child: userDetailTextView(text: '8:20 AM 10/12/2024'),
        ),
        SizedBox(height: 10.px),
        Row(
          children: [
            Container(
              height: 40.px,
              width: 40.px,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).colorScheme.primary,
                shape: BoxShape.circle,
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
                shape: BoxShape.circle,
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
                shape: BoxShape.circle,
              ),
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
              width: 41.px,
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
                ),
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
                        width: 3.px,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.px),
                  userDetailTextView(
                    text: 'Greet work! Well done girl. 👏🏽',
                    fontSize: 12.px,
                  ),
                  SizedBox(height: 12.px),
                  Row(
                    children: [
                      userDetailTextView(
                        text: 'Like',
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 20.px),
                      userDetailTextView(
                        text: 'Reply',
                        fontWeight: FontWeight.w700,
                      ),
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

  Widget postUserNameTextView() => Text(
    'Ryan Yashmak ',
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

  Widget twoRingsIconView() => CommonMethods.appIcons(
      assetName: IconConstants.icTwoRings, height: 14.px, width: 18.px);

  Widget editAndDeletePopUpWidget() => Align(
    alignment: Alignment.topRight,
    child: PopupMenuButton<String>(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      onSelected: (value) {
        // Handle actions based on the selected option
        if (value == 'Edit') {
          print('Edit post selected');
        } else if (value == 'Delete') {
          print('Delete post selected');
        }
      },
      style: ButtonStyle(
        visualDensity: VisualDensity(horizontal: -4.px),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Edit',
            height: 36.px,
            child: Text(
              'Edit post',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          PopupMenuItem(
            child: CommonWidgets.commonDividerView(),
            padding: EdgeInsets.zero,
            height: 0.px,
          ),
          PopupMenuItem<String>(
            value: 'Delete',
            height: 36.px,
            child: Text(
              'Delete post',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ];
      },
      icon:CommonMethods.appIcons(
        assetName: IconConstants.icGrayMenu,
        height: 20.px,
        width: 4.px,
        color: Theme.of(Get.context!).colorScheme.primary,
      ),
    ),
  );

  Widget postUserDataCardView() => Row(
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
                  child: Row(
                    children: [
                      postUserNameTextView(),
                      checkIconView(),
                      twoRingsIconView()
                    ],
                  ),
                ),
                editAndDeletePopUpWidget(),
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

}
