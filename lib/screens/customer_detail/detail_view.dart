import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app.dart';
import '../../components/app_blank_body.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'detail_controller.dart';

class DetailView extends GetView<DetailViewController> {
  final int shopId;

  const DetailView(this.shopId, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final shop = App.shopdetatils[shopId];
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            // key: controller.scaffoldKey,
            body: Stack(children: [
          BodyViewTop(
            color: Colors.grey[300],
            width: Get.width * .200,
            height: Get.height * .250,
            child: Image.asset(
              AssetHelper.addShopImage,
              color: MyTheme.myBlueDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * .210),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "shop details".toUpperCase(),
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
                padding: EdgeInsets.only(top: Get.height * .330, left: 10, right: 10),
                child: Column(
                  children: [
                    CustomerDetails("Shop Name", shop.shopName),
                    CustomerDetails("Customer Name", shop.customerName),
                    CustomerDetails("Phone Number", shop.phoneNumber),
                    CustomerDetails("Email", shop.strEmail),
                    CustomerDetails("AddressLine 1", shop.addressLine1),
                    CustomerDetails("AddressLine 2", shop.addressLine2),
                    CustomerDetails("Pincode", shop.pincode),
                    CustomerDetails("Instructions", shop.strInstructions),
                  ],
                ),
              ),
        ])));
  }

   CustomerDetails(String text, text1) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom:25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: MyTheme.regularTextStyle(
                fontSize: Get.height * .016,
                color: MyTheme.myBlueDark,
                fontWeight: FontWeight.w600),
          ),
          Container(
            width: Get.width * .6,
            height: Get.height *.04,
            decoration: BoxDecoration(color: MyTheme.myBlueDark,
            borderRadius: BorderRadius.circular(20)),
            child:  Center(
              child: Text(
                text1,
                style: MyTheme.regularTextStyle(
                    fontSize: Get.height * .017,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),

          )

        ],
      ),
    );
  }
}
