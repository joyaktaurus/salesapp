import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'dashboard_controller.dart';


class DashboardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardViewController>(
          () => DashboardViewController(),
    );
  }
}