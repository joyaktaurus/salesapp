import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/components/app_alertbox.dart';
import 'package:salesapp/screens/personaldetails/personal_controller.dart';
import '../../app.dart';
import '../../components/app_body_view.dart';
import '../../components/app_boxes.dart';
import '../../components/app_buttons.dart';
import '../../components/mycards.dart';
import '../../models/login_resp.dart';
import '../../models/login_resp.dart';
import '../../my_theme.dart';
import '../../routes.dart';
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
                // child: Container(
                //   child: CircleAvatar(
                //     backgroundImage: AssetHelper.profilePic,
                //   ),
                // ),
                color: Colors.grey,
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
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(children: [
                                    Text(
                                      "Employee ID : ",
                                      style: MyTheme.regularTextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * .016,
                                      ),
                                    ),
                                    Text(
                                      "${App.user.userId}",
                                      style: MyTheme.regularTextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * .016,
                                      ),
                                    ),
                                  ]),
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
                            ProfileRows("Name : ", "${App.user.name}"),
                            ProfileRows("Gender : ", "${App.user.gender}"),
                            ProfileRows("Date of Birth : ", "${App.user.dob}"),
                            ProfileRows("Mobile Number : ", "${App.user.phone}"),
                            ProfileRows("Email : ", "${App.user.email}"),
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
                            ProfileRows("Territory Name : ", "Ernakulam"),
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
void MarkCleanAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45))),
          title: Container(
            width: Get.width * .9,
            child: Column(
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
          ),
        );
      });
}


