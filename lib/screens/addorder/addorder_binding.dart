import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/addshop/addshop_controller.dart';

import 'addorder_controller.dart';

class AddOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddOrderController>(
          () => AddOrderController(),
    );
  }
}