import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/search_model.dart';
import '../../models/shop_list.dart';
import '../../services/search_services.dart';
import '../../services/shopdetails_services.dart';
import '../../services/shoplist_services.dart';

class ShopListController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController CustomersSearchCntrl = TextEditingController(text: '');
  final ScrollController customersScrollController = ScrollController();
  final ScrollController itemsScrollController = ScrollController();
  final TextEditingController searchCntrl = TextEditingController(text: '');
  final RxBool isMarketingSelected = false.obs;
  RxInt inventoryItemsTotalCount = 0.obs;
  final RxBool isSalesSelected = false.obs;
  var marketingColor = Colors.grey.obs;
  var salesColor = Colors.grey.obs;
  RxBool isMarketingCompleted = false.obs;
  var isSalesCompleted = false.obs;
  Rx<int?> subOrg = App.selectedSuborg.id.obs;
  RxString searchTypeChosenValue = 'Name / P/N or SKU'.obs;


  late int shopId;


  Future<void> fetchShopDetails() async {
    // Make the API call to fetch shop details
    final response = await ShopDetailsServices.getShopDetailsById(shopId);

    if (response.ok) {
      // Handle the response and update the UI with the shop details
      // Access the shop details using response.rdata
    } else {
      // Handle error case, display error message or take appropriate action
      print('Failed to fetch shop details: ${response.msgs[0].msg}');
    }
  }

  void searchBtn() async {
    String shopName = searchCntrl.text.trim();

    if (shopName.isNotEmpty) {
      // Call fetchSearchList method to retrieve search results
      ApiResp response = await SearchListServices.fetchSearchList(shopName);

      if (response.ok) {
        // Update myList with the retrieved search results
        if (response.rdata is List) {
          myList.assignAll(response.rdata.map((data) => Shop.fromJson(data)));
        } else if (response.rdata is Map<String, dynamic>) {
          Map<String, dynamic> data = response.rdata;
          if (data.containsKey('shop')) {
            myList.assignAll((data['shop'] as List).map((data) => Shop.fromJson(data)));
          }
        }
      } else {
        // Handle error case, display error message or take appropriate action
        print('Search request failed: ${response.msgs[0].msg}');
      }
    }
  }



  void searchOnChangeFn(val) async {
    if (val.isEmpty) {
      searchCntrl.clear();
    }
  }


  void onFieldSubmittedFn(val) async {
    searchBtn();
  }

  void searchSuffixIconBtn() async {
    customersListApiPayload.clear();
    CustomersSearchCntrl.clear();
    isScreenProgress.value = true;

  }
  void submitMarketing() {
    isMarketingSelected.value = true;
    isSalesSelected.value = false;
    marketingColor.value = Colors.blue;
    salesColor.value = Colors.grey;
    isMarketingCompleted.value = true;
  }

  void submitSales() {
    isSalesSelected.value = true;
    isMarketingSelected.value = false;
    marketingColor.value = Colors.grey;
    salesColor.value = Colors.green;
  }

  final RxBool isVisible = false.obs;
  RxList<Shop> myList = (List<Shop>.of([])).obs;
  RxInt customersTotalCount = 0.obs;
  RxBool isScreenProgress = false.obs;
  Map customersListApiPayload = {};
  int limit = 20;
  int offset = 0;
  int currentPage = 0;
  var selectedOption = 1.obs;
  RxString statusFilterChosenValue = 'All Items'.obs;
  Map inventoryItemsListApiPayload = {};


  // void searchBtn() async {
  //   isScreenProgress.value = true;
  //   myList.clear();
  // }
  void setSelectedOption(int option) {
    selectedOption.value = option;
  }

  @override
  void onInit() async {
    super.onInit();
    customersScrollController.addListener(_scrollListener);
    fetchShopDetails();
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
    return myList;
  }
}