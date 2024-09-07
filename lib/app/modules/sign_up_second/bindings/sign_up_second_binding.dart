import 'package:get/get.dart';

import '../controllers/sign_up_second_controller.dart';

class SignUpSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpSecondController>(
      () => SignUpSecondController(),
    );
  }
}
