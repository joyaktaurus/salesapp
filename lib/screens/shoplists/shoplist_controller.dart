import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/shop_list.dart';
import '../../services/shoplist_services.dart';

class ShopListController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController customersScrollController = ScrollController();
  final RxBool isVisible = false.obs;
  RxList<Shop> myList = (List<Shop>.of([])).obs;
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
    //Map body = customersListApiPayload;
    ApiResp resp = await ShopListServices.getList();
    myList.value = ShopList.fromJson(resp.rdata).shop.toList();
    App.shopdetatils=myList.value;
    print(App.shopdetatils.first.shopName);
    // log(resp.rdata.toString());
    // customersTotalCount.value = resp.rdata["count"];
    // resp.rdata["result"].forEach((element) {
    //   ShopReg customers = ShopReg.fromJson(element);
    //   myList.add(customers);
    // });
    // log(myList.length.toString());
    // currentPage++;
    // offset = limit * currentPage;
    return myList;
  }
}
