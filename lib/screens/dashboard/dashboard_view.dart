import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/components/app_dash_cards.dart';
import 'package:salesapp/my_theme.dart';
import 'package:salesapp/screens/addproduct/addproduct_view.dart';
import 'package:salesapp/screens/addshop/addshop_view.dart';
import 'package:salesapp/screens/personaldetails/personal_view.dart';
import 'package:salesapp/screens/shoplists/shoplist_view.dart';
import '../../app.dart';
import '../../components/app_blue_card.dart';
import '../../routes.dart';
import '../../services/privileges_resp.dart';
import '../../utils/asset_helper.dart';
import '../../utils/local_store.dart';
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
            height: Get.height * 0.50,
            color: MyTheme.myBlueDark,
            clipBehavior: 0,
            radius: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 50, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            LocalStore.clearData();
                            App.selectedSuborg =
                                SelectedSuborg(id: -1, name: "All");
                            Get.offNamed(Routes.login);
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    //backgroundColor: Colors.red,
                    backgroundImage: AssetImage(AssetHelper.profilePic),
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
                                           //   controller.removeImages();
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
                  "${App.user.name?.toUpperCase()}",
                  style: MyTheme.regularTextStyle(
                    fontWeight: FontWeight.w600,
                      fontSize: Get.height * .027, color: MyTheme.whiteColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Employee ID : ",
                      style: MyTheme.regularTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: Get.height * .020, color: MyTheme.whiteColor),
                    ),
                    Text(
                      "${App.user.userId}",
                      style: MyTheme.regularTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: Get.height * .020, color: MyTheme.whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 500),
            child: Stack(children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .140,
                      text: "Personal Details",
                      onTap: () {
                           Get.to(PersonalView());
                      },
                      image: AssetHelper.profileImage,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .140,
                      text: "Add a Shop",
                      onTap: () {
                           Get.to(AddShopView());
                      },
                      image: AssetHelper.addShopImage, widthh: 30, heightt: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .140,
                      text: "Shop Visits",
                      onTap: () {
                           Get.to(ShopListView());
                      },
                      image: AssetHelper.shop,Scale: .7,
                    ),
                    DashBoardCards(
                      width: Get.width * .400,
                      height: Get.height * .140,
                      text: "Products View",
                      onTap: () {
                        Get.to(AddProductView());
                      },
                      image: AssetHelper.proView,Scale: 1.1,
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .028,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     DashBoardCards(
                //       width: Get.width * .400,
                //       height: Get.height * .110,
                //       text: "Products View",
                //       onTap: () {
                //            Get.to(AddProductView());
                //       },
                //       image: AssetHelper.profileImage,
                //     ),
                //     DashBoardCards(
                //       width: Get.width * .400,
                //       height: Get.height * .110,
                //       text: "Personal Details",
                //       onTap: () {
                //         //   Get.to(LeaveRequestView()
                //       },
                //       image: AssetHelper.profileImage,
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: Get.height * .028,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     DashBoardCards(
                //       width: Get.width * .400,
                //       height: Get.height * .110,
                //       text: "Personal Details",
                //       onTap: () {
                //         //   Get.to(LeaveRequestView()
                //       },
                //       image: AssetHelper.profileImage,
                //     ),
                //     DashBoardCards(
                //       width: Get.width * .400,
                //       height: Get.height * .110,
                //       text: "Personal Details",
                //       onTap: () {
                //         //   Get.to(LeaveRequestView()
                //       },
                //       image: AssetHelper.profileImage,
                //     ),
                //   ],
                // ),
              ]),
            ]),
          )
        ])));
  }
}
