import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../models/api_resp.dart';
import '../../models/marketing_res.dart';
import '../../models/shop_list.dart';
import '../../services/marketing_services.dart';
import '../../utils/my_utils.dart';

class MarketingController extends GetxController {

  final TextEditingController shopnameCtrl = TextEditingController(text: '');
  final TextEditingController cusnameCtrl = TextEditingController(text: '');
  final TextEditingController dateCtrl = TextEditingController(text: '');
  final TextEditingController notesCtrl = TextEditingController(text: '');

  final FocusNode shopnameCtrlfNode = FocusNode();
  final FocusNode cusnameCtrlfNode = FocusNode();
  final FocusNode dateCtrlfNode = FocusNode();
  final FocusNode notesCtrlfNode = FocusNode();

  void shopMarketing() async {
    log("Shop registraion called");
    ApiResp resp = await MarketingServices.fetchMarketing(
        shopid:'',
        visitdate: cusnameCtrl.text,
        marketingnotes: notesCtrl.text, visitpurpose: '',
       );
    if (resp.ok == false) {
      MyUtils.msg(resp.msgs);
      return;
    }
    MarketList marketList = MarketList.fromJson(resp.rdata);
    Get.snackbar(marketList.message, 'success', backgroundColor: Colors.white);
    if (marketList.message == 'Marketing Successfully Completed') {
      shopnameCtrl.clear();
      cusnameCtrl.clear();
      notesCtrl.clear();
    }
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