import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  List postCardImageList = [
    'assets/dummy_img/w1.png',
    'assets/dummy_img/w2.png',
    'assets/dummy_img/w3.png',
  ];

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

  clickOnTopCard() {
    Get.toNamed(Routes.POST);
  }
}
