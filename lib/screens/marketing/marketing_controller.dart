import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:salesapp/screens/shoplists/shoplist_controller.dart';
import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/marketing_res.dart';
import '../../services/marketing_services.dart';

class MarketingController extends GetxController {
  final ShopListController _radioController = Get.find<ShopListController>();
  int shopid=0;
  late DateTime dateTime;
  //String Date='';
  final TextEditingController cusnameCtrl = TextEditingController(text: '');
  final TextEditingController dateCtrl = TextEditingController(text: '');
  final TextEditingController notesCtrl = TextEditingController(text: '');

  final FocusNode shopnameCtrlfNode = FocusNode();
  final FocusNode cusnameCtrlfNode = FocusNode();
  final FocusNode dateCtrlfNode = FocusNode();
  final FocusNode notesCtrlfNode = FocusNode();

  void shopMarketing() async {
    log("Shop marketing called");
    ApiResp resp = await MarketingServices.fetchMarketing(
      shopid: shopid ,
      visitdate:DateTime.now().toString(),
      marketingnotes: notesCtrl.text,
      visitpurpose: 'marketing',
     // shopname: App.shopdetatils.first.shopName.toString(),
   //   customername: App.shopdetatils.first.customerName.toString(),
    );
    if (resp.ok == false) {
     // MyUtils.msg(resp.msgs);
      _radioController.isMarketingSelected.value = true;
      _radioController.isSalesSelected.value = false;
      _radioController.marketingColor.value = Colors.red;

      return;
    }
    MarketList marketList = MarketList.fromJson(resp.rdata);
    Get.snackbar('Marketing Successfully Completed', 'success', backgroundColor: Colors.white);
    if (marketList.message == 'Marketing Successfully Completed') {

      // _radioController.isMarketingSelected.value = true;
      // _radioController.isSalesSelected.value = false;
      // _radioController.marketingColor.value = Colors.red;


      //shopnid.clear();
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
      final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
      final String displayDate = serverFormater.format(pickedDate);
      selectedDate.value = Convet.toString();
      selectedDate.value=Convet;
      DateTime Date=DateTime.parse(displayDate);

      print(displayDate);
    }
  }
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    dateTime=displayDate;
    return formatted;
  }
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))))) {
      return true;
    }
    return false;
  }


  //.........................................................................................................

  // final TextEditingController notesCtrl = TextEditingController(text: '');
  //
  // Future<void> submitMarketingData({
  //   required String shopid,
  // //required String shopname,
  //   required String customername,
  //   required String visitdate,
  //   required String visitpurpose,
  //   required String marketingnotes,
  // }) async {
  //
  //   // Call the MarketingServices method to submit the data
  //   final ApiResp resp = await MarketingServices.fetchMarketing(
  //     shopid: shopid,
  //     visitdate: visitdate,
  //     visitpurpose: visitpurpose,
  //     marketingnotes: marketingnotes, customername: customername,
  //     //shopname: shopname,
  //   );
  //   // Handle the response as needed
  // }
//..............................................................................................................
  // final TextEditingController shopnameCtrl = TextEditingController(text: '');
  // final TextEditingController cusnameCtrl = TextEditingController(text: '');
  // final TextEditingController dateCtrl = TextEditingController(text: '');
  // final TextEditingController notesCtrl = TextEditingController(text: '');
  //
  // final FocusNode shopnameCtrlfNode = FocusNode();
  // final FocusNode cusnameCtrlfNode = FocusNode();
  // final FocusNode dateCtrlfNode = FocusNode();
  // final FocusNode notesCtrlfNode = FocusNode();
  // RxBool isMarketProgress = false.obs;
  // void shopMarketing() async {
  //
  //   ApiResp resp = await MarketingServices.fetchMarketing(shopid: '', visitdate: '', visitpurpose: '', marketingnotes: '');
  //   if (resp.ok == false) {
  //     MyUtils.msg(resp.msgs);
  //     isMarketProgress.value = false;
  //     return;
  //   }
  // }
//................................................................................................................
//   Rx<String> selectedDate = 'Start Date'.obs;
//   final startDate = DateTime.now().obs;
//
//   //var selecteenddDate = DateTime.now().obs;
//
//
//   choosestartDate() async {
//     DateTime? pickedDate = await showDatePicker(
//         context: Get.context!,
//         initialDate: startDate.value,
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2028),
//         // initialEntryMode: DatePickerEntryMode.input,
//         // initialDatePickerMode: DatePickerMode.year,
//         helpText: 'Select Date',
//         cancelText: 'Close',
//         confirmText: 'Confirm',
//         errorFormatText: 'Enter valid date',
//         errorInvalidText: 'Enter valid date range',
//         //fieldLabelText: 'DOB',
//         fieldHintText: 'Month/Date/Year',
//         selectableDayPredicate: disableDate);
//     if (pickedDate != null && pickedDate != selectedDate.value) {
//       String Convet = DateFormat.yMMMd('en_US').format(pickedDate!);
//       selectedDate.value = Convet.toString();
//       startDate.value = pickedDate;
//     }
//   }
//
//   bool disableDate(DateTime day) {
//     if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))))) {
//       return true;
//     }
//     return false;
//   }
//
 }