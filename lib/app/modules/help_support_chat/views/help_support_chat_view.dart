import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/icons_constant.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/help_support_chat_controller.dart';

class HelpSupportChatView extends GetView<HelpSupportChatController> {
  const HelpSupportChatView({super.key});
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
                    CommonWidgets.commonAppBarView(appBarTitle: 'Help & Support'),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
                        children: [
                          Center(
                            child: dateTextView(date: '12 August 2024'),
                          ),
                          SizedBox(height: 32.px),
                          otherUserMsgView(),
                          SizedBox(height: 32.px),
                          yourMsgView(),
                          SizedBox(height: 32.px),
                          otherUserMsgView(),
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
        'Hi Kitsbase, Let me know you need help and you can ask us any questions.',
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
         fontSize: 17.px,
         wordSpacing: 0,
         letterSpacing: 0,
         color: Theme.of(Get.context!).colorScheme.primary
        ),
      );
    }
  }

  Widget otherUserMsgView() => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        height: 48.px,
        width: 48.px,
        margin: EdgeInsets.only(right: 12.px,bottom: 20.px),
        decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
            shape: BoxShape.circle
        ),
        child: CommonMethods.appIcons(
          assetName: IconConstants.icSmartToy,
          height: 20.px,
          width: 22.px,
        ),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 13.px,horizontal: 12.px),
              margin: EdgeInsets.only(right: 68.px,bottom: 8.px),
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
                borderRadius: BorderRadius.only(
                 topRight: Radius.circular(18.px),
                 topLeft: Radius.circular(18.px),
                 bottomRight: Radius.circular(18.px),
                 bottomLeft: Radius.circular(4.px),
                )
              ),
              child: Flexible(
                child: messageTextView(),
              ),
            ),
            Text(
              '08:20 AM',
              style: Theme.of(Get.context!).textTheme.labelLarge,
            )
          ],
        ),
      ),
    ],
  );

  Widget yourMsgView() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 13.px,horizontal: 12.px),
              margin: EdgeInsets.only(left: 68.px,bottom: 8.px),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
               color: Theme.of(Get.context!).colorScheme.error.withOpacity(.06),
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(18.px),
                 topLeft: Radius.circular(18.px),
                 bottomLeft: Radius.circular(18.px),
                 bottomRight: Radius.circular(4.px)
               )
              ),
              child: Flexible(
                child: messageTextView(),
              ),
            ),
            Text(
              '08:20 AM',
              style: Theme.of(Get.context!).textTheme.labelLarge,
            )
          ],
        ),
      ),
    ],
  );

}
