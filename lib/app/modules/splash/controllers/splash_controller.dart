import 'package:get/get.dart';

import '../../../../common/globle.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    manageSession();
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

  Future<void> manageSession() async {
    selectedIndex.value = 0;
    increment();
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed(Routes.SIGN_UP);
  }
}
