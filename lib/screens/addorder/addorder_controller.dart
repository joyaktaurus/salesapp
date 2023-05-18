import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../models/api_resp.dart';
import '../../services/addorder_services.dart';

class AddOrderController extends GetxController {

  final TextEditingController addproductCtrl = TextEditingController(text: '');

  Future<void> submitMarketingData({
    required String shopid,
    //  required String shopname,
    required String customername,
  //  required String instructions,
    required String longitude,
    required String visitpurpose,
    required String latitude,
    required String product_details,
    required String orderdate,
  }) async {

    // Call the MarketingServices method to submit the data
    final ApiResp resp = await AddOrderServices.fetchOrder(
  //   instructions: instructions,
      longitude: longitude,
      visitpurpose: visitpurpose,
      latitude: latitude,
      product_details: product_details,
      shopid: shopid,
      orderdate: orderdate,
      //shopname: shopname,
    );
    // Handle the response as needed
  }


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