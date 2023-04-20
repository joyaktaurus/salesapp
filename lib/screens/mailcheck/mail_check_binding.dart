import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'mail_check_controller.dart';

class MailCheckBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailCheckController>(
      () => MailCheckController(),
    );
  }
}
