import 'package:get/get.dart';

import '../controllers/chat_user_list_controller.dart';

class ChatUserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatUserListController>(
      () => ChatUserListController(),
    );
  }
}
