import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../my_theme.dart';
import '../routes.dart';
import '../utils/asset_helper.dart';
import 'app_buttons.dart';

void MarkCleanAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45))),
          title: Column(
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
              Text(
                "UPDATE INFORMATION",
                style: MyTheme.regularTextStyle(
                    color: MyTheme.myBlueDark,
                    fontSize: Get.height * .020,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Get.height * .03),
              TextFormField(
                // controller: controller.userCtrl,
                // focusNode: controller.userCtrlfocusNode,
                decoration: textBoxDecoration('Email'),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: Get.height * .03),
              TextFormField(
                // controller: controller.userCtrl,
                // focusNode: controller.userCtrlfocusNode,
                decoration: textBoxDecoration('Mobile Number'),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: Get.height * .0039),
              MAButton(
                text: 'Update',
                buttonPress: () {
                  Get.offNamed(Routes.dashBoardPage);
                },
                isEnabled: true,
                padding: const EdgeInsets.all(30),
                height: Get.height * 0.06,
                width: Get.width * 0.3,
                clipBehavior: 0,
                radius: 30, fontSize: 20,
              ),
            ],
          ),
        );
      });
}


void ProductShow(BuildContext context) {
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
                Text(
                  "Product Name",
                  style: MyTheme.regularTextStyle(
                      color: Colors.black,
                      fontSize: Get.height * .017,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                    width: Get.width * .20,
                    height: Get.height * .20,
                    decoration: BoxDecoration(),
                    child:
                    Image.asset(AssetHelper.swatch)),
                ProfileRows("Rate  :   ", "10000.00"),
                ProfileRows("Quantity  :   ", "1"),
                SizedBox(height: Get.height * .01),
                Divider(thickness: 1),
                SizedBox(height: Get.height * .01),
                ProfileRows("Final Amount  :   ", "10000.00"),
                SizedBox(height: Get.height * .02),
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



InputDecoration textBoxDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    hintStyle: MyTheme.regularTextStyle(
        fontSize: Get.height * .018, color: Colors.black),
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