import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/components/app_boxes.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import '../../app.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/my_utils.dart';
import 'addorder_controller.dart';

class AddOrderView extends GetView<AddOrderController> {
  final widgetId;
   AddOrderView({Key? key,required this.widgetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddOrderController());
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Stack(children: [
              BodyView(),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                                      Obx( () =>
                                          Text( controller.selectedDate.value,
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
                            // Container(
                            //   width: Get.width * .9,
                            //   height: Get.height * .27,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(45),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.black.withOpacity(0.1),
                            //         spreadRadius: 3,
                            //         blurRadius: 8,
                            //         offset: Offset(
                            //             2, 0), // changes position of shadow
                            //       )
                            //     ],
                            //     color: Colors.white,
                            //   ),
                            //   child: Padding(
                            //     padding:
                            //     EdgeInsets.only(left: 20, right: 20, top: 20),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text("Products",
                            //             style: MyTheme.regularTextStyle(
                            //                 fontSize: Get.height * .014,
                            //                 color: Colors.black)),
                            //         SizedBox(height: Get.height * .07),
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           children: [
                            //             Icon(
                            //               Icons.add,
                            //               color: Colors.grey,
                            //             ),
                            //             SizedBox(width: Get.width * .05),
                            //             Text("Empty! Click here to add products",
                            //                 style: MyTheme.regularTextStyle(
                            //                     fontSize: Get.height * .014,
                            //                     color: Colors.grey)),
                            //           ],
                            //         ),
                            //         SizedBox(height: Get.height * .05),
                            //         Padding(
                            //           padding: EdgeInsets.only(left: 260),
                            //           child: CircleAvatar(
                            //             radius: 20,
                            //             child: IconButton(
                            //               onPressed: () {
                            //                 Get.to(AddProductView());
                            //               },
                            //               icon: Icon(Icons.add),
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
                                controller: controller.addproductCtrl,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(left: 20, top: 10),
                                  labelText: 'Add Products',
                                  labelStyle: MyTheme.regularTextStyle(
                                    fontSize: Get.height * 0.014,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .01),
                            ProfileRows("Sub Total : ", ""),
                            ProfileRows("Tax Implied : ", ""),
                            SizedBox(height: Get.height * .01),
                            ProfileRows("Grand Total : ", ""),
                            ProfileRows("Credits Applied : ", ""),
                            ProfileRows("Balance Due : ", ""),
                            SizedBox(height: Get.height * .01),
                            Divider(thickness: 1),
                            SizedBox(height: Get.height * .0001),
                            MAButton(
                              text: 'Submit',
                              buttonPress: () {
                                errM(() {
                                  final AddOrderController marketingController = Get.find<AddOrderController>();
                                  final String shopid = App.shopdetatils[widgetId].shopName.toString();
                                  final String customername = App.shopdetatils[widgetId].customerName.toString();
                                  final String orderdate = controller.selectedDate.value;
                                  final String product_details = controller.addproductCtrl.text;
                                  final String visitpurpose = 'sales';
                                  final String longitude = 'longitude';
                                  final String latitude = 'latitude';// Set the visit purpose

                                  marketingController.submitMarketingData(shopid: '',
                                      customername: customername,
                                      longitude: longitude,
                                      visitpurpose: visitpurpose,
                                      latitude: latitude,
                                      product_details:product_details,
                                      orderdate: orderdate

                                  );
                                });
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