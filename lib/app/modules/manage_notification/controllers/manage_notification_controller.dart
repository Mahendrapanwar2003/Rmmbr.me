import 'package:get/get.dart';

class ManageNotificationController extends GetxController {

  final count = 0.obs;
  final requestNotificationsValue = false.obs;
  final msgNotificationsValue = false.obs;
  final commentNotificationsValue = false.obs;
  final postNotificationsValue = false.obs;
  final eventsNotificationsValue = false.obs;


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

  void clickOnRequestNotification({required val}) {
    requestNotificationsValue.value = val;
    count.value++;
  }

  void clickOnMessageNotification({required val}) {
    msgNotificationsValue.value = val;
    count.value++;
  }

  void clickOnCommentNotification({required val}) {
    commentNotificationsValue.value = val;
    count.value++;
  }

  void clickOnPostNotification({required val}) {
    postNotificationsValue.value = val;
    count.value++;
  }

  void clickOnEventsNotification({required val}) {
    eventsNotificationsValue.value = val;
    count.value++;
  }
}
