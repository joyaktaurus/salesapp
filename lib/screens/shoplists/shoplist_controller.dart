import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class Report {
//   String selectedPeriod;
//
//   Report({required this.selectedPeriod});
// }

class ShopListController extends GetxController {
  final RxBool isVisible = false.obs;


  var selectedOption = 1.obs;
  void setSelectedOption(int option) {
    selectedOption.value = option;
  }

}



//RxBool isChecked = false.obs;
// var report = Report(selectedPeriod: "").obs;
//
// List<String> period = ["Marketing", "Sales"];
//
// set selectedPeriod(String selectedPeriod) {
//   report.update((val) {
//     val!.selectedPeriod = selectedPeriod;
//   });
// }
//
// String get selectedPeriod => report.value.selectedPeriod;