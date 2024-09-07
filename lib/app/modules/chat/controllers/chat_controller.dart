import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class ChatController extends GetxController {

  final count = 0.obs;
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

  void clickOnChatButton({required int index}) {
    Get.toNamed(Routes.CHAT_USER_LIST);
  }

}
