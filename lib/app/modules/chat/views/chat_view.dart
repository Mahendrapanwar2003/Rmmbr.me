import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/colors.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(isBackButtonVisible: false, appBarTitle: 'Start Chat'),
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
              children: [
                CommonWidgets.commonSearchFieldView(),
                SizedBox(height: 24.px),
                usersListView()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget usersListView() => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: index != 9 ? 16.px : 60.px,),
        child: userDataCardView(index:index),
      );
    },
  );

  Widget userDataCardView({required int index}) => Container(
    height: 76.px,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 17.px, vertical: 8.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(12.px),
    ),
    child: Row(
      children: [
        userProfileView(index:index),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                    child: userNameTextView(index:index),
                  ),
                  checkIconView(),
                ],
              ),
              SizedBox(height: 4.px),
              userDetailTextView(text: '1970, Hamburg'),
              SizedBox(height: 2.px),
              userDetailTextView(text: 'Ryan Yashmak'),
            ],
          ),
        ),
        SizedBox(
          height: 34.px,
          width: 79.px,
          child: Center(
            child: chatButtonView(index:index),
          ),
        )
      ],
    ),
  );

  Widget userProfileView({required int index}) => Container(
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

  Widget userNameTextView({required int index}) => Text(
    'Ryan Yashmak ',
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2),
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
    style: Theme.of(Get.context!).textTheme.titleMedium
        ?.copyWith(height: 1.2,fontSize: 10.px),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget chatButtonView({required int index}) => CommonWidgets.commonElevatedButton(
    buttonMargin: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    onPressed: () => controller.clickOnChatButton(index:index),
    child: Text(
      'Chat',
      style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
        color: AppLightColors().onPrimary,
      ),
    ),
  );

}
