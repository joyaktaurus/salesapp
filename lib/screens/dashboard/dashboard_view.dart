import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../utils/my_utils.dart';
import 'dashboard_controller.dart';


class DashBoardView extends GetView<DashboardViewController> {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 128, 1),
            body: Stack(children: [

            ])));
  }
}