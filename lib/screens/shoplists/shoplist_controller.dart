import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/api_resp.dart';
import '../../models/shop_list.dart';
import '../../services/shoplist_services.dart';


class ShopListController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController customersScrollController = ScrollController();
  final RxBool isVisible = false.obs;
  RxList<ShopReg> myList = (List<ShopReg>.of([])).obs;
  RxInt customersTotalCount = 0.obs;
  RxBool isScreenProgress = false.obs;
  Map customersListApiPayload = {};
  int limit = 20;
  int offset = 0;
  int currentPage = 0;
  var selectedOption = 1.obs;
  void setSelectedOption(int option) {
    selectedOption.value = option;
  }
  @override
  void onInit() async {
    super.onInit();
    customersScrollController.addListener(_scrollListener);
    customersListApiPayload = ShopListServices.getAllCustomersListPayload();
   isScreenProgress.value = true;
   await initialCustomersList();
   isScreenProgress.value = false;
    }

  Future<bool> loadMore() async {
    log("onLoadMore");
    return true;
  }

  void _scrollListener() {
    if (customersScrollController.offset >=
        customersScrollController.position.maxScrollExtent &&
        !customersScrollController.position.outOfRange) {
      log("reach the bottom");

      if (myList.length == customersTotalCount.value) {
        log("all items loaded");
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () async {
          await initialCustomersList();
        });
      }
    }
    if (customersScrollController.offset <=
        customersScrollController.position.minScrollExtent &&
        !customersScrollController.position.outOfRange) {
      log("reach the top");
    }
  }


  initialCustomersList() async {
    Map body = customersListApiPayload;
    ApiResp resp =
    await ShopListServices.getList();
    log(resp.rdata.toString());
    customersTotalCount.value = resp.rdata["count"];
    resp.rdata["result"].forEach((element) {
      ShopReg customers = ShopReg.fromJson(element);
      myList.add(customers);
    });
    log(myList.length.toString());
    currentPage++;
    offset = limit * currentPage;
    return myList;
  }
}

