import 'package:get/get.dart';

import '../controllers/reported_accounts_controller.dart';

class ReportedAccountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportedAccountsController>(
      () => ReportedAccountsController(),
    );
  }
}
