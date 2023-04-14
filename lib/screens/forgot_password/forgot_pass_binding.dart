import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'forgot_pass_controller.dart';


class ForgotViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotViewController>(
          () => ForgotViewController(),
    );
  }
}