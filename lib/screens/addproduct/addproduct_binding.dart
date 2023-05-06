import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'addproduct_controller.dart';

class AddProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
          () => AddProductController(),
    );
  }
}