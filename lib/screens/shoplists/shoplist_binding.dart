import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/addshop/addshop_controller.dart';
import 'package:salesapp/screens/shoplists/shoplist_controller.dart';

class ShopListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopListController>(
          () => ShopListController(),
    );
  }
}