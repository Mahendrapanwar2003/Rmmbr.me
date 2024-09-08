import 'package:get/get.dart';

import '../controllers/help_support_chat_controller.dart';

class HelpSupportChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpSupportChatController>(
      () => HelpSupportChatController(),
    );
  }
}
