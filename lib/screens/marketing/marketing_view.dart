import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:salesapp/components/app_boxes.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import '../../app.dart';
import '../../components/app_blank_body.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/my_utils.dart';
import '../shoplists/shoplist_controller.dart';
import 'marketing_controller.dart';

class MarketingView extends GetView<MarketingController> {
  final widgetId;
 MarketingView({Key? key,required this.widgetId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MarketingController());
    controller.shopid =int.parse(App.shopdetatils[widgetId].intShopId!);
      return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
         key: controller.scaffoldKey,
            backgroundColor: Colors.grey[200],
            body: Stack(children: [
              BodyViewTop(),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .163),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "marketing".toUpperCase(),
                      style: MyTheme.regularTextStyle(
                        fontWeight: FontWeight.w600,
                        color: MyTheme.myBlueDark,
                        fontSize: Get.height * .027,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .220),
                child: AppBoxes(
                    width: Get.width * .9,
                    height: Get.height * .60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          width: Get.width * .10,
                                          height: Get.height * .10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: Get.width * .002,
                                              color: MyTheme.myBlueDark,
                                            ),
                                          ),
                                          child: Image.asset(AssetHelper.shop)),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * .03),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          App.shopdetatils[widgetId].shopName!.toUpperCase(),
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.myBlueDark,
                                            fontSize: Get.height * .018,
                                          ),
                                        ),
                                        Text(
                                          App.shopdetatils[widgetId].customerName!,
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                            fontSize: Get.height * .015,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(thickness: 2),
                            SizedBox(height: Get.height * .015),
                            Container(
                              width: Get.width * .9,
                              height: Get.height * .06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: Offset(
                                        2, 0), // changes position of shadow
                                  )
                                ],
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {

                                          controller.choosestartDate();
                                        },
                                        icon: Icon(Icons.calendar_month,
                                            color: MyTheme.myBlueDark)),
                                  //  SizedBox(width: Get.width * .05),
                                    Obx( () =>
                                     Text(
                                         controller.selectedDate.value,
                                          style: MyTheme.regularTextStyle(
                                              fontSize: Get.height * .014,
                                              color: Colors.black)
                                     ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .030),
                            Container(
                                width: Get.width * .9,
                                height: Get.height * .17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset.zero,
                                    color: Colors.grey.shade300,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: controller.notesCtrl,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(left: 20, top: 10),
                                  labelText: 'Order Notes',
                                  labelStyle: MyTheme.regularTextStyle(
                                    fontSize: Get.height * 0.014,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: Get.height * .020),
                            MAButton(
                              text: 'Submit',
                              buttonPress: () {
                                MyUtils.hideKeyboard();
                                errM(() => controller.shopMarketing());
                              },
                              isEnabled: true,
                              padding: const EdgeInsets.all(30),
                              height: Get.height * 0.07,
                              width: Get.width * 0.4,
                              clipBehavior: 0,
                              radius: 30, fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ]),
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyTheme.myBlueDark,
            foregroundColor: MyTheme.whiteColor,
            onPressed: () {
              Get.toNamed(Routes.addShopPage);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        )
    );
  }

  Padding ProfileRows(String text, text1) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: MyTheme.regularTextStyle(
                fontSize: Get.height * .016,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            text1,
            style: MyTheme.regularTextStyle(
                fontSize: Get.height * .016,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
Widget MesssageBox() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
        minLines: 2,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        // onSaved: (value) => _message = value,
        // onChanged: (value) {
        //   _message = value;
        // },
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return "Enter Message";
        //   } else {
        //     return null;
        //   }
        // },
        decoration: InputDecoration(
          labelText: 'Order Notes',
          hintStyle: TextStyle(color: Colors.grey),
          // enabledBorder: myinputborder(),
          // focusedBorder: myfocusborder(),
          border: InputBorder.none
        ),
      ),
    ],
  );
}