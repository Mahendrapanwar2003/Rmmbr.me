import 'package:get/get.dart';
import 'package:new_pro/apis/api_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('sharedPreferences Value::::::::::::::::::::::::::::::::::::::${sharedPreferences.getString(ApiKeyConstants.token)}');
    if(sharedPreferences.getString(ApiKeyConstants.token)!=null && sharedPreferences.getString(ApiKeyConstants.token)!.isNotEmpty){
      Get.offAllNamed(Routes.NAV_BAR);
    }else{
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
