import 'package:get/get.dart';

import '../controllers/tree_controller.dart';

class TreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreeController>(
      () => TreeController(),
    );
  }
}
