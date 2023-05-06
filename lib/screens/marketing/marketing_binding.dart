import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'marketing_controller.dart';


class MarketingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketingController>(
          () => MarketingController(),
    );
  }
}
