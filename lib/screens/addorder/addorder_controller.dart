import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../models/api_resp.dart';
import '../../models/order_resp.dart';
import '../../services/addorder_services.dart';
import '../shoplists/shoplist_controller.dart';

class AddOrderController extends GetxController {

  final TextEditingController nameCtrl = TextEditingController(text: '');
  final TextEditingController qntyCtrl = TextEditingController(text: '');
  final TextEditingController priceCtrl = TextEditingController(text: '');
  final TextEditingController insCtrl = TextEditingController(text: '');


  final FocusNode nameCtrlfNode = FocusNode();
  final FocusNode qntyCtrlfNode = FocusNode();
  final FocusNode insCtrlfNode = FocusNode();

  final TextEditingController addproductCtrl = TextEditingController(text: '');
  int shopid=0;
  late DateTime dateTime;

  final ShopListController radioController = Get.find<ShopListController>();
  // Assuming you have longitude and latitude values captured from the user
  // String longitude = "123.456";
  // String latitude = "78.901";
  List<Map<String, dynamic>> productDetails = [];
  Future<void> submitButtonPressed() async {
    String instructions = insCtrl.text; // Update with your desired instructions
    int shopId = shopid;
    String orderDate = DateTime.now().toString();
    String visitPurpose = 'sales';
    String name = nameCtrl.text;
    String quantity = qntyCtrl.text;
    List<Map<String, dynamic>> productDetails = [];
    Map<String, dynamic> product = {"name": name, "quantity": quantity};
    productDetails.add(product);
    String productDetailsJson = jsonEncode(productDetails);

    // Fetch the current location
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      // Handle location fetch error
      print('Error fetching location: $e');
      // Show a snackbar or display an error message
      return;
    }

    double longitude = position.longitude;
    double latitude = position.latitude;

    // Call the API with the location data
    ApiResp resp = await AddOrderServices.fetchOrder(
      instructions: instructions,
      longitude: longitude.toString(),
      latitude: latitude.toString(),
      product_details: productDetailsJson,
      shopid: shopId,
      orderdate: orderDate,
      visitpurpose: visitPurpose,
    );

    if (resp.ok == false) {
      return;
    }

    OrderList orderList = OrderList.fromJson(resp.rdata);
    radioController.submitSales();
    Get.back();
    Get.snackbar('Sales Order Successfully Completed', 'success', backgroundColor: Colors.white);
    if (orderList.message == 'Sales Order Successfully Completed') {
      // Get.offNamed(Routes.shopListPage);
      // cusnameCtrl.clear();
      // notesCtrl.clear();
    }
  }

// Inside your submit button press method
//   Future<void> submitButtonPressed() async {
//     String instructions = insCtrl.text; // Update with your desired instructions
//     double longitude = 4.2555555;
//     double latitude = 10.2222555;// Make sure you have the latitude value
//     int shopId = shopid;
//     String orderDate = DateTime.now().toString();
//     String visitPurpose = 'sales';
//     String name = nameCtrl.text;
//     String quantity = qntyCtrl.text;
//     List<Map<String, dynamic>> productDetails = [];
//     Map<String, dynamic> product = {"name": name, "quantity": quantity};
//     productDetails.add(product);
//     String productDetailsJson = jsonEncode(productDetails);
//     ApiResp resp = await AddOrderServices.fetchOrder(
//       instructions: instructions,
//       longitude: longitude.toString(),
//       latitude: latitude.toString(),
//       product_details: productDetailsJson,
//       shopid: shopId,
//       orderdate: orderDate,
//       visitpurpose: visitPurpose,
//     );
//     if (resp.ok == false) {
//       return;
//     }
//     OrderList orderList = OrderList.fromJson(resp.rdata);
//     radioController.submitSales();
//     Get.back();
//     Get.snackbar('Sales Order Successfully Completed', 'success', backgroundColor: Colors.white);
//     if (orderList.message == 'Sales Order Successfully Completed') {
//       // Get.offNamed(Routes.shopListPage);
//       // cusnameCtrl.clear();
//       // notesCtrl.clear();
//     }
//   }
  //........................................
  Rx<String> selectedDate = 'Start Date'.obs;
  final startDate = DateTime.now().obs;
  //var selecteenddDate = DateTime.now().obs;
  choosestartDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: startDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2028),
        // initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select Date',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        //fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      String Convet = DateFormat.yMMMd('en_US').format(pickedDate!);
      selectedDate.value = Convet.toString();
      startDate.value = pickedDate;
    }
  }
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))))) {
      return true;
    }
    return false;
  }

}