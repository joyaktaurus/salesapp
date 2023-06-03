import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';
import '../../components/app_alertbox.dart';
import '../../components/app_blank_body.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'addproduct_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "ADD PRODUCT",
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
                padding: EdgeInsets.only(top: Get.height * .212, left: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: Get.width * .9,
                    height: Get.height * .07,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Search Products",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.search,
                            color: MyTheme.myBlueDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * .300, left: 20, right: 20),
                child: Wrap(spacing: 20.0, runSpacing: 10.0, children: [
                  Text(
                    "All",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "Filter 1",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "Filter 2",
                    style: TextStyle(color: Colors.black54),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * .320, left: 20, right: 20),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                          // height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset:
                                    Offset(2, 0), // changes position of shadow
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          width: Get.width * .20,
                                          height: Get.height * .20,
                                          decoration: BoxDecoration(),
                                          child:
                                              Image.asset(AssetHelper.swatch)),
                                    ],
                                  ),
                                  SizedBox(width: Get.width * .03),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, bottom: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Product Name",
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.myBlueDark,
                                            fontSize: Get.height * .018,
                                          ),
                                        ),
                                        SingleChildScrollView(
                                            child: Container(
                                          width: 200,
                                          height: 50,
                                          child: Text(
                                            "FDHgdfgdfgdgtkgktgnfkgnfnfnfghnfkghnkgjhnkjghkghndghdhhghghdghdgh",
                                            style: MyTheme.regularTextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                              fontSize: Get.height * .013,
                                            ),
                                          ),
                                        )),
                                        SizedBox(height: Get.height * .01),
                                        Text(
                                          "Rs. 10000",
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: Get.height * .018,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, right: 20),
                                child: Row(
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
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
            ])));
  }
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
                ProfileRows("Rate  :   ", "10000.00"),
                Divider(thickness: 1),
                ProfileRows("Rate  :   ", "10000.00"),
                Divider(thickness: 1),
                ProfileRows("Quantity  :   ", "1"),
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