import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../models/api_resp.dart';
import '../../models/order_resp.dart';
import '../../services/addorder_services.dart';

class AddOrderController extends GetxController {

  final TextEditingController nameCtrl = TextEditingController(text: '');
  final TextEditingController qntyCtrl = TextEditingController(text: '');
  final TextEditingController insCtrl = TextEditingController(text: '');


  final FocusNode nameCtrlfNode = FocusNode();
  final FocusNode qntyCtrlfNode = FocusNode();
  final FocusNode insCtrlfNode = FocusNode();

  final TextEditingController addproductCtrl = TextEditingController(text: '');
  int shopid=0;
  late DateTime dateTime;
  // void shopOrder() async {
  //   log("Sales Order Called");
  //   ApiResp resp = await AddOrderServices.fetchOrder(
  //       shopid: shopid ,
  //       orderdate:DateTime.now().toString(),
  //       longitude: '',
  //       visitpurpose: 'sales',
  //       latitude: '',
  //       product_details: addproductCtrl.text,
  //
  //   );
  //   OrderList orderList = OrderList.fromJson(resp.rdata);
  //   Get.snackbar('Sales Order Successfully Completed', 'success', backgroundColor: Colors.white);
  //   if (orderList.message == 'Sales Order  Successfully Completed') {
  //
  //     // _radioController.isMarketingSelected.value = true;
  //     // _radioController.isSalesSelected.value = false;
  //     // _radioController.marketingColor.value = Colors.red;
  //
  //     addproductCtrl.clear();
  //   }
  // }
//..............................................

  // Assuming you have longitude and latitude values captured from the user
  String longitude = "123.456";
  String latitude = "78.901";
  List<Map<String, dynamic>> productDetails = [];
// Inside your submit button press method
  void submitButtonPressed() {
    String instructions = insCtrl.text; // Update with your desired instructions
     longitude = longitude; // Make sure you have the longitude value
     latitude = latitude; // Make sure you have the latitude value
    int shopId = shopid;
    String orderDate = DateTime.now().toString();
    String visitPurpose = 'sale';
    String name = nameCtrl.text;
    String quantity = qntyCtrl.text;

    // Create a list to hold the product details
    List<Map<String, dynamic>> productDetails = [];

    // Create a map for each product and add it to the list
    Map<String, dynamic> product = {"name": name, "quantity": quantity};
    productDetails.add(product);

    // Convert the list to a JSON string
    String productDetailsJson = jsonEncode(productDetails);

    // Call the fetchOrder method from the service
    AddOrderServices.fetchOrder(
      instructions: instructions,
      longitude: longitude.toString(),
      latitude: latitude.toString(),
      product_details: productDetailsJson,
      shopid: shopId,
      orderdate: orderDate,
      visitpurpose: visitPurpose,
    ).then((response) {
      // Handle the response here
    }).catchError((error) {
      // Handle any errors
    });
  }

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