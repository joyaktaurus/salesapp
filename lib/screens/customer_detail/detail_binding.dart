import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'detail_controller.dart';


class DetailViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailViewController>(
          () => DetailViewController(),
    );
  }
}