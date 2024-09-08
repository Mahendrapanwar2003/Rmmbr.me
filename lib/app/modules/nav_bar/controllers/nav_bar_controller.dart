import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:new_pro/app/modules/calendar/views/calendar_view.dart';
import 'package:new_pro/app/modules/chat/controllers/chat_controller.dart';
import 'package:new_pro/app/modules/chat/views/chat_view.dart';
import 'package:new_pro/app/modules/home/views/home_view.dart';
import 'package:new_pro/app/modules/profile/controllers/profile_controller.dart';
import 'package:new_pro/app/modules/profile/views/profile_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../constants/string_constants.dart';
import '../../family_tree/controllers/family_tree_controller.dart';
import '../../family_tree/views/family_tree_view.dart';

final selectedIndex = 0.obs;
class NavBarController extends GetxController {
  final count = 0.obs;
  late StreamSubscription streamSubscription;

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

  body() {
    switch (selectedIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        Get.delete<FamilyTreeController>();
        Get.lazyPut<FamilyTreeController>(
          () => FamilyTreeController(),
        );
        return const FamilyTreeView();
      case 2:
        Get.delete<CalendarController>();
        Get.lazyPut<CalendarController>(
          () => CalendarController(),
        );
        return const CalendarView();
      case 3:
        Get.delete<ChatController>();
        Get.lazyPut<ChatController>(
          () => ChatController(),
        );
        return const ChatView();
      case 4:
        Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        return const ProfileView();
    }
  }

  onWillPopMethod() {
    if (selectedIndex.value == 0) {
      CommonWidgets.showAlertDialog(
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex.value = 0;
    }
  }
}
