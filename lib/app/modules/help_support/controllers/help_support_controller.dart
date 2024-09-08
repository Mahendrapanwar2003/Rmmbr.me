import 'package:get/get.dart';

class HelpSupportController extends GetxController {

  final count = 0.obs;

  final helpSupportSelectedValue = ''.obs;

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

  void clickOnDropDownButton({required int index}) {
    if(helpSupportSelectedValue.value.contains(index.toString())){
      helpSupportSelectedValue.value = '';
    }else{
      helpSupportSelectedValue.value = index.toString();
    }
    count.value++;
  }
}
