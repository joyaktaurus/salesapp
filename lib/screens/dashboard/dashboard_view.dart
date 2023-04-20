import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/components/app_dash_cards.dart';
import 'package:salesapp/my_theme.dart';
import '../../components/app_blue_card.dart';
import '../../components/mycards.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'dashboard_controller.dart';

class DashBoardView extends GetView<DashboardViewController> {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          MyBlueCard(
            height: Get.height * .333,
            color: MyTheme.myBlueDark,
            clipBehavior: 0,
            radius: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    // foregroundImage: AssetImage(AssetHelper.lakeSmall),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          await Get.bottomSheet(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  )),
                              height: 170,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Profile Photo",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              controller.removeImages();
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              child: Center(
                                                child: IconButton(
                                                    onPressed: () {
                                                      // controller.takePhoto(
                                                      //     ImageSource
                                                      //         .camera);
                                                      Get.back();
                                                    },
                                                    icon: Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white,
                                                      size: 25,
                                                    )),
                                              ),
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Text(
                                              "Camera",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                child: Center(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        // controller.Photogallery(
                                                        //     ImageSource
                                                        //         .gallery);
                                                        // Get.back();
                                                        // print(controller.pickedfile.value);
                                                      },
                                                      icon: Icon(
                                                        Icons.image,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: Get.height * 0.01),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20.0,
                          child: Icon(
                            Icons.camera_alt,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    radius: 55.0,
                    // backgroundImage: Image.file(
                    //   controller.pickedfile.value!,
                    //   width: 130,
                    //   height: 130,
                    //   fit: BoxFit.cover,
                    // ).image,
                  ),
                ),
                SizedBox(
                  height: Get.height * .028,
                ),
                Text(
                  "TOM JOE",
                  style: MyTheme.regularTextStyle(
                      fontSize: Get.height * .027, color: MyTheme.whiteColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 350),
            child: Stack(children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .028,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .028,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .028,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .110,
                      text: "Personal Details",
                      onTap: () {
                        //   Get.to(LeaveRequestView()
                      },
                      image: AssetHelper.profileImage,
                    ),
                  ],
                ),
              ]),
            ]),
          )
        ])));
  }
}
