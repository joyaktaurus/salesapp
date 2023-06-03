import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'itemlist_controller.dart';

class ItemListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemListController>(
          () => ItemListController(),
    );
  }
}