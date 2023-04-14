import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../utils/my_utils.dart';
import 'forgot_pass_controller.dart';


class ForgotPassView extends GetView<ForgotViewController> {
  const ForgotPassView({Key? key}) : super(key: key);

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