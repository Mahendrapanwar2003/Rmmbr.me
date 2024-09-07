import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/chat_message_controller.dart';

class ChatMessageView extends GetView<ChatMessageController> {
  const ChatMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
         (){
          controller.count.value;
          return Scaffold(
            // backgroundColor: Theme.of(Get.context!).colorScheme.onPrimary,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    CommonWidgets.commonAppBarView(appBarTitle: 'Chat'),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                        children: [
                          chatUserCardView(),
                          SizedBox(height: 15.px),
                          CommonWidgets.commonDividerView(),
                          SizedBox(height: 42.px),
                          Center(
                            child: dateTextView(date: '12 August 2024'),
                          ),
                          SizedBox(height: 29.px),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.px,horizontal: 12.px),
                            margin: EdgeInsets.only(right: 133.px),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(.05),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.px),
                                topLeft: Radius.circular(10.px),
                                bottomLeft: Radius.circular(20.px),
                                bottomRight: Radius.circular(20.px)
                              )
                            ),
                            child: messageTextView(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SafeArea(
                  child: sendMassageCardView(),
                )
              ],
            ),
          );
        }
    );
  }

  Widget chatUserCardView() => Row(
    children: [
      chatUserProfileView(),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chatUserNameTextView(),
            // SizedBox(height: 4.px),
            chatUserDetailTextView(),
          ],
        ),
      ),
    ],
  );

  Widget chatUserProfileView() => Container(
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

  Widget chatUserNameTextView() => Text(
    'Martin Randolph',
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
      height: 1.2,
      fontSize: 17.px,
    ),
    maxLines: 1,
    overflow:
    TextOverflow.ellipsis,
  );

  Widget chatUserDetailTextView() => Text(
    'Dallas , US',
    style: Theme.of(Get.context!).textTheme.titleMedium,
    maxLines: 2,
    overflow:
    TextOverflow.ellipsis,
  );

  Widget cameraIconButtonView() => CommonMethods.appIcons(
    assetName: IconConstants.icCamera,
    height: 22.px,
    width: 25.px,
  );

  Widget galleryIconButtonView() => CommonMethods.appIcons(
    assetName: IconConstants.icGallery,
    height: 22.px,
    width: 22.px,
  );

  Widget audioIconButtonView() => CommonMethods.appIcons(
    assetName: IconConstants.icAudio,
    height: 24.px,
    width: 18.px,
  );

  Widget sendMassageCardView() => Container(
    height: 72.px,
    color: Theme.of(Get.context!).colorScheme.onPrimary,
    padding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding,vertical: 16.px),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        cameraIconButtonView(),
        SizedBox(width: 16.px),
        galleryIconButtonView(),
        SizedBox(width: 16.px),
        audioIconButtonView(),
        SizedBox(width: 16.px),
        Expanded(
          child: sendMassageTextFieldView(),
        ),
      ],
    ),
  );

  Widget sendMassageTextFieldView() => CommonWidgets.commonMsgFieldView();

  Widget dateTextView({required String date}) => Text(
    date,
    style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
     fontSize: 12.px,
     fontWeight: FontWeight.w400
    ),
  );

  Widget messageTextView({String msgType = 'Text'}) {
    if(msgType == 'Img'){
      return CommonMethods.splashLogo();
    }else if(msgType == 'Video'){
      return Text(
        'VIDEO',
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
            fontSize: 17.px,
            color: Theme.of(Get.context!).colorScheme.primary
        ),
      );
    }else{
      return Text(
        'What are you doing?',
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
          fontSize: 17.px,
          color: Theme.of(Get.context!).colorScheme.primary
        ),
      );
    }
  }

}
