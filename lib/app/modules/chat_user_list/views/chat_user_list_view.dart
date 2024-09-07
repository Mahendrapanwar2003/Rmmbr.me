import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/colors.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/chat_user_list_controller.dart';

class ChatUserListView extends GetView<ChatUserListController> {
  const ChatUserListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
          controller.count.value;
          return Scaffold(
            body: Column(
              children: [
                CommonWidgets.commonAppBarView(appBarTitle: 'Chat'),
                Expanded(
                  child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 0.px, vertical: 32.px),
                    children: [
                      topUsersCardView(),
                      SizedBox(height: 24.px),
                      searchFieldView(),
                      SizedBox(height: 24.px),
                      chatUsersListView()
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  Widget topUsersCardView() => Container(
    height: 105.px,
    width: double.infinity,
    color: Theme.of(Get.context!).colorScheme.onPrimary,
    child: Center(
      child: SizedBox(
        height: 77.px,
        child: topUsersHorizontalListView(),
      ),
    ),
  );

  Widget topUsersHorizontalListView() => ListView.builder(
    shrinkWrap: true,
    padding:  EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
    itemCount: 10,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(right: index != 9 ? 8.px : 0.px),
        child: SizedBox(
          width: 65.px,
          child: Column(
            children: [
              topUserProfileView(index:index),
              SizedBox(height: 7.px),
              topUserNameTextView(index:index)
            ],
          ),
        ),
      );
    },
  );

  Widget topUserProfileView({required int index}) => Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
        height: 52.px,
        width: 52.px,
        decoration:  BoxDecoration(
         color: AppLightColors().scaffoldBackgroundColor,
         shape: BoxShape.circle
        ),
        child: CommonMethods.appIconsPng(
          assetName: 'assets/images/profile_dummy.png',
          height: 52.px,
          width: 52.px,
        ),
      ),
      Container(
        height: 12.px,
        width: 12.px,
        margin: EdgeInsets.only(bottom: 2.px,right: 2.px),
        decoration:  BoxDecoration(
         color: AppLightColors().success,
         shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(Get.context!).colorScheme.onPrimary,
            width: 2.px
          )
        ),
      ),
    ],
  );

  Widget topUserNameTextView({required int index}) => Text(
    'Karen',
    style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(
      fontSize: 13.px,
      color: AppLightColors().caption
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget searchFieldView() => CommonWidgets.commonSearchFieldView().paddingSymmetric(horizontal: SizeConstants.bodyHorizontalPadding);

  Widget chatUsersListView() => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: index != 9 ? 16.px : 60.px,
        ),
        child: GestureDetector(
          onTap: () => controller.clickOnChatUserCard(index:index),
          child: SizedBox(
            height: 76.px,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    SizedBox(width: 24.px),
                    chatUserCardView(index:index),
                    SizedBox(width: 24.px),
                    chatUserDeleteButtonView(index:index),
                    SizedBox(width: 24.px),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  Widget chatUserCardView({required int index}) => Container(
    height: 76.px,
    width: MediaQuery.sizeOf(Get.context!).width - 48.px,
    padding: EdgeInsets.symmetric(horizontal: 17.px, vertical: 8.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius:
      BorderRadius.circular(12.px),
    ),
    child: Row(
      children: [
        chatUserProfileView(index:index),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: chatUserNameTextView(index:index),
              ),
              // SizedBox(height: 4.px),
              chatUserDetailTextView(index:index),
            ],
          ),
        ),
      ],
    ),
  );

  Widget chatUserProfileView({required int index}) => Container(
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

  Widget chatUserNameTextView({required int index}) => Text(
    'Martin Randolph',
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
      height: 1.2,
      fontSize: 17.px,
    ),
    maxLines: 1,
    overflow:
    TextOverflow.ellipsis,
  );

  Widget chatUserDetailTextView({required int index}) => Text(
    'You: What’s man! · 9:40 AM',
    style: Theme.of(Get.context!).textTheme.titleMedium,
    maxLines: 1,
    overflow:
    TextOverflow.ellipsis,
  );

  Widget chatUserDeleteButtonView({required int index}) => Container(
    height: 40.px,
    width: 40.px,
    decoration: BoxDecoration(
      color: AppLightColors().onError,
      shape: BoxShape.circle,
    ),
    child: CommonMethods.appIcons(
      assetName: IconConstants.icDelete,
      width: 18.px,
      height: 19.px,
    ),
  );

}
