import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/modules/profile/views/profile_view.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileController extends GetxController {

  final count = 0.obs;

  final selectTabBarValue = 'Settings'.obs;

  List cardTabBarTitles = [
    'Settings',
    'Info',
    'Posts',
    'Photos',
    'Videos',
  ];

  List cardSettingTitles = [
    'Reported accounts',
    'Help & Support',
    'Terms of use',
    'Privacy Policy',
    'Manage Notification',
    'Privacy Settings',
    'Logout',
  ];

  List postCardImageList = [
    'assets/dummy_img/w1.png',
    'assets/dummy_img/w2.png',
    'assets/dummy_img/w3.png',
  ];

  List photosImgList = [
    'assets/dummy_img/1.png',
    'assets/dummy_img/2.png',
    'assets/dummy_img/3.png',
    'assets/dummy_img/4.png',
    'assets/dummy_img/5.png',
    'assets/dummy_img/6.png',
    'assets/dummy_img/7.png',
  ];

  List videosImgList = [
    'assets/dummy_img/8.png',
    'assets/dummy_img/9.png',
    'assets/dummy_img/8.png',
    'assets/dummy_img/9.png',
    'assets/dummy_img/8.png',
    'assets/dummy_img/9.png',
    'assets/dummy_img/8.png',
    'assets/dummy_img/9.png',
  ];

  final List<Map<String, dynamic>> photosGridItems = [
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/1.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/2.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/3.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/4.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/5.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/6.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/7.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/1.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/2.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/3.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/4.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/5.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/6.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/7.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/1.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/2.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/3.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/4.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/5.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/6.png'},
  ];

  final List<Map<String, dynamic>> videosGridItems = [
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/8.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/9.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/8.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/9.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/8.png'},
    {'crossAxisCellCount': 2, 'mainAxisCellCount': 2, 'image': 'assets/dummy_img/9.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/8.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/9.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/8.png'},
    {'crossAxisCellCount': 1, 'mainAxisCellCount': 1, 'image': 'assets/dummy_img/9.png'},
  ];

  final selectedOption = ''.obs;

  final List<String> privacyOptions = ['Private', 'Family Only', 'Followers Only'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnTabBarView({required String tabBarValue}) {
    selectTabBarValue.value = tabBarValue;
    count.value++;
  }

  void clickOnSettingCards({required int index}) {
    if(index == 0){
      Get.toNamed(Routes.REPORTED_ACCOUNTS);
    }else if(index== 1) {
      Get.toNamed(Routes.HELP_SUPPORT);
    }else if(index== 2) {
      Get.toNamed(Routes.TERMS_OF_USE);
    }else if(index== 3) {
      Get.toNamed(Routes.PRIVACY_POLICY);
    }else if(index== 4) {
      Get.toNamed(Routes.MANAGE_NOTIFICATION);
    }else if(index== 5) {
      showPrivacyDialog();
    }else{
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void showPrivacyDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
          () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConstants.bodyHorizontalPadding,vertical: 24.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Privacy Settings',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.px),
                    ListView.builder(
                      itemCount: privacyOptions.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: privacyOptions.length-1 != index ? 16.px : 0.px),
                          child: GestureDetector(
                            onTap: () {
                              selectedOption.value = privacyOptions[index];
                              count.value++;
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 14.px,
                                  width: 14.px,
                                  margin: EdgeInsets.only(right: 8.px),
                                  decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedOption.value.contains(privacyOptions[index])
                                          ? Theme.of(context).colorScheme.primary
                                          : Theme.of(context).colorScheme.surface
                                    )
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 8.px,
                                      width: 8.px,
                                      decoration: BoxDecoration(
                                        color: selectedOption.value.contains(privacyOptions[index])
                                          ? Theme.of(context).colorScheme.primary
                                          : Colors.transparent,
                                        shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  privacyOptions[index].toUpperCase(),
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: selectedOption.value.contains(privacyOptions[index])
                                     ? Theme.of(context).colorScheme.primary
                                     : Theme.of(context).colorScheme.surface
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24.px),
                    SizedBox(
                      height:42.px,
                      child: const ProfileView().commonEleButtonView(
                        buttonText: 'Save',
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}

