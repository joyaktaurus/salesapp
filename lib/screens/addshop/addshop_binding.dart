import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/addshop/addshop_controller.dart';

class AddShopBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddShopController>(
          () => AddShopController(),
    );
  }
}