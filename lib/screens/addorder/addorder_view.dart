import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/components/app_boxes.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import '../../app.dart';
import '../../components/app_alertbox.dart';
import '../../components/app_blank_body.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/my_utils.dart';
import '../itemlist/itemlist_view.dart';
import '../shoplists/shoplist_controller.dart';
import 'addorder_controller.dart';

class AddOrderView extends GetView<AddOrderController> {
  final widgetId;

  AddOrderView({Key? key, required this.widgetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddOrderController());
    controller.shopid = int.parse(App.shopdetatils[widgetId].intShopId!);
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Stack(children: [
              BodyViewTop(),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .163),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ADD ORDER",
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
                    height: Get.height * .9,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 20),
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
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          App.shopdetatils[widgetId].shopName!
                                              .toUpperCase(),
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.myBlueDark,
                                            fontSize: Get.height * .018,
                                          ),
                                        ),
                                        Text(
                                          App.shopdetatils[widgetId]
                                              .customerName!,
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                            fontSize: Get.height * .013,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(thickness: 2),
                            SizedBox(height: Get.height * .012),
                            Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
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
                                      Obx(
                                        () => Text(
                                            controller.selectedDate.value,
                                            style: MyTheme.regularTextStyle(
                                                fontSize: Get.height * .014,
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .020),
                            Container(
                                width: Get.width * .9,
                                height: Get.height * .30,
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
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      Text("Add Products"),
                                      SizedBox(height: Get.height * .02),
                                      Wrap(
                                        children: [
                                            Container(
                                              width: Get.width * .2,
                                              height: Get.height * .099,
                                              child: TextFormField(
                                                controller: controller.nameCtrl,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                       EdgeInsets.only(
                                                           top: 10),
                                                  labelText: 'Name',
                                                  labelStyle:
                                                      MyTheme.regularTextStyle(
                                                    fontSize: Get.height * 0.014,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(width: Get.width * .1),
                                            Container(
                                              width: Get.width * .2,
                                              height: Get.height * .09,
                                              child: TextFormField(
                                                controller: controller.qntyCtrl,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                       EdgeInsets.only(
                                                          top: 10),
                                                  labelText: 'Quantity',
                                                  labelStyle:
                                                      MyTheme.regularTextStyle(
                                                    fontSize: Get.height * 0.014,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(width: Get.width * .1),
                                            Container(
                                              width: Get.width * .2,
                                              height: Get.height * .09,
                                              child: TextFormField(
                                              //  controller: controller.qntyCtrl,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                   EdgeInsets.only(
                                                       top: 10),
                                                  labelText: 'Price',
                                                  labelStyle:
                                                  MyTheme.regularTextStyle(
                                                    fontSize: Get.height * 0.014,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                        ),
                                     ] ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 260, top: Get.height * .07),
                                        child: CircleAvatar(
                                          radius: 20,
                                          child: IconButton(
                                            onPressed: () {
                                             // Get.to(ItemListView());
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      )
                                    ]))),
                            SizedBox(height: Get.height * .02),
                            Container(
                              width: Get.width * .9,
                              height: Get.height * .09,
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
                                controller: controller.insCtrl,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  labelText: 'Order Notes',
                                  labelStyle: MyTheme.regularTextStyle(
                                    fontSize: Get.height * 0.014,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .03),
                            ProfileRows("Sub Total : ", ""),
                            // ProfileRows("Tax Implied : ", ""),
                            // SizedBox(height: Get.height * .01),
                            // ProfileRows("Grand Total : ", ""),
                            // ProfileRows("Credits Applied : ", ""),
                            // ProfileRows("Balance Due : ", ""),
                            // SizedBox(height: Get.height * .01),
                            Divider(thickness: 1),
                            SizedBox(height: Get.height * .01),
                            MAButton(
                              text: 'Submit',
                              buttonPress: () {
                                errM(() => controller.submitButtonPressed());
                              },
                              isEnabled: true,
                              padding: const EdgeInsets.all(30),
                              height: Get.height * 0.07,
                              width: Get.width * 0.4,
                              clipBehavior: 0,
                              radius: 30,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ])));
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

InputDecoration productBoxDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    hintStyle: MyTheme.regularTextStyle(
        fontSize: Get.height * .014, color: Colors.black),
  );
}
void AddToList(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          title: Container(
            width: Get.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close,
                            color: MyTheme.myBlueDark, size: 15))
                  ],
                ),
                ProfileRows("Name  :   ", "Pen"),
                Divider(thickness: 1),
                ProfileRows("Price  :   ", "100.00"),
                Divider(thickness: 1),
                ProfileRows("Quantity  :   ", "10"),
                SizedBox(height: Get.height * .01),
                Divider(thickness: 1),
                SizedBox(height: Get.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ProductShow(context);
                      },
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(15),
                            color: MyTheme.myBlueDark),
                        child: Center(
                          child: Text(
                            "ADD",
                            style: MyTheme.regularTextStyle(
                              fontWeight: FontWeight.w600,
                              color: MyTheme.whiteColor,
                              fontSize: Get.height * .018,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        );
      });
}