import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salesapp/screens/addshop/addshop_controller.dart';

import '../../models/api_resp.dart';
import '../../models/shop_list.dart';
import '../../services/addashop_services.dart';
import '../../services/shoplist_services.dart';
import '../shoplists/shoplist_controller.dart';

class DetailViewController extends GetxController {
  // Rx<ApiResp?> shopListResponse = Rx<ApiResp?>(null);
  // RxList<Shop> shopDetails = (List<Shop>.of([])).obs;

  final shopController = Get.find<ShopListController>();
}
