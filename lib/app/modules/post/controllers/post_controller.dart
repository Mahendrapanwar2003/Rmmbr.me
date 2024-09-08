import 'package:get/get.dart';

class PostController extends GetxController {

  final count = 0.obs;

  final realCheckSelectedValue = ''.obs;

  List realCheckList = [
    'Edited media',
    'Real and un-edited media',
    'Wholly or partially computer-generated media',
  ];

  final classificationSelectedValue = ''.obs;

  List classificationList = [
    'No nudity, sex,  violence or weapons',
    'Contains nudity, sex, violence or weapons',
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

  void clickOnRealCheckItem({required int index}) {
    if(realCheckSelectedValue.value.contains(realCheckList[index])){
      realCheckSelectedValue.value = '';
    }else{
      realCheckSelectedValue.value = realCheckList[index];
    }
    count.value++;
  }

  void clickOnClassificationItem({required int index}) {
    if(classificationSelectedValue.value.contains(classificationList[index])){
      classificationSelectedValue.value = '';
    }else{
      classificationSelectedValue.value = classificationList[index];
    }
    count.value++;
  }

}
