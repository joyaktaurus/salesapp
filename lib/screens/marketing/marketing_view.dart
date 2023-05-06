import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/components/app_boxes.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import '../../components/app_body_view.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'marketing_controller.dart';

class MarketingView extends GetView<MarketingController> {
  const MarketingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    height: Get.height * .65,
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
                                          "shop 1".toUpperCase(),
                                          style: MyTheme.regularTextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: MyTheme.myBlueDark,
                                            fontSize: Get.height * .018,
                                          ),
                                        ),
                                        Text(
                                          "Owner Name",
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
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: MyTheme.myBlueDark,
                                    ),
                                    SizedBox(width: Get.width * .05),
                                    Text("Select Date",
                                        style: MyTheme.regularTextStyle(
                                            fontSize: Get.height * .014,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .020),
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
                                    Text("Order To",
                                        style: MyTheme.regularTextStyle(
                                            fontSize: Get.height * .014,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * .020),
                            Container(
                              width: Get.width * .9,
                              height: Get.height * .17,
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
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: Text("Order Notes",
                                    style: MyTheme.regularTextStyle(
                                        fontSize: Get.height * .014,
                                        color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: Get.height * .020),
                            MAButton(
                              text: 'Submit',
                              buttonPress: () {
                                Get.offNamed(Routes.dashBoardPage);
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