import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/components/app_alertbox.dart';
import 'package:salesapp/screens/personaldetails/personal_controller.dart';
import '../../components/app_body_view.dart';
import '../../components/app_boxes.dart';
import '../../components/mycards.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';

class PersonalView extends GetView<PersonalController> {
  const PersonalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Stack(children: [
              BodyView(
                color: Colors.red,
                width: Get.width * .270,
                height: Get.height * .270,
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * .220),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TOM JOE",
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
                padding: EdgeInsets.only(top: Get.height * .280),
                child: Column(
                  children: [
                    AppBoxes(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "PERSONAL DETAILS",
                              style: MyTheme.regularTextStyle(
                                fontWeight: FontWeight.w600,
                                color: MyTheme.myBlueDark,
                                fontSize: Get.height * .020,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Employee ID",
                                    style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      fontSize: Get.height * .016,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      MarkCleanAlert(context);
                                    },
                                    child: Image.asset(
                                      AssetHelper.edit,
                                      color: MyTheme.myBlueDark,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: Get.height * .007),
                            ProfileRows("Name : ", "Joya Kuriakose"),
                            ProfileRows("Gender : ", "Female"),
                            ProfileRows("Date of Birth : ", "11 / 08 / 1995"),
                            ProfileRows("Mobile Number : ", "7356238775"),
                            ProfileRows("Email : ", "joyaas@gmail.com"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * .026),
                    AppBoxes(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Text(
                              "SALES PERFORMANCE",
                              style: MyTheme.regularTextStyle(
                                fontWeight: FontWeight.w600,
                                color: MyTheme.myBlueDark,
                                fontSize: Get.height * .020,
                              ),
                            ),
                            SizedBox(height: Get.height * .007),
                            ProfileRows("Number of Sales Made : ", "1k"),
                            ProfileRows("Deals Closed : ", "5k"),
                            ProfileRows("Products Sold : ", "7k"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * .026),
                    AppBoxes(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                        child: Column(
                          children: [
                            Text(
                              "TERRITORY INFORMATION",
                              style: MyTheme.regularTextStyle(
                                fontWeight: FontWeight.w600,
                                color: MyTheme.myBlueDark,
                                fontSize: Get.height * .020,
                              ),
                            ),
                            SizedBox(height: Get.height * .007),
                            ProfileRows("Territory Name : ", "Checkoslovakya"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }

  Padding ProfileRows(String text, text1) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Row(
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
