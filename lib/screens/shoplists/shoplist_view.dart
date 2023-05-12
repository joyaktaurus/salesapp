import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';
import 'package:salesapp/screens/marketing/marketing_view.dart';
import 'package:salesapp/screens/shoplists/shoplist_controller.dart';
import '../../components/app_body_view.dart';
import '../../components/app_boxes.dart';
import '../../components/app_buttons.dart';
import '../../components/rounded_loader.dart';
import '../../models/shop_list.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import '../addshop/addshop_view.dart';

class ShopListView extends GetView<ShopListController> {
  const ShopListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ShopListController());
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
          key: controller.scaffoldKey,
          body: Stack(children: [
            BodyView(
              color: Colors.grey[300],
              width: Get.width * .200,
              height: Get.height * .250,
              child: Image.asset(
                AssetHelper.addShopImage,
                color: MyTheme.myBlueDark,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * .220),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SHOP LISTS",
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
              padding:
                  EdgeInsets.only(top: Get.height * .280, left: 20, right: 20),
              child: Container(
                width: Get.width * .9,
                height: Get.height * .07,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search a Shop",
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
            Padding(
              padding: EdgeInsets.only(
                top: Get.height * .370,
              ),
              child: AppBoxes(
                  width: Get.height * .8,
                  height: Get.height * .55,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    child:
                     Obx( () =>
                         controller.isScreenProgress == true
                         ? Center(child: const RoundedLoader())
                         :
                     ListView.builder(
                           controller: controller.customersScrollController,
                            itemCount: controller.myList.length,
                            itemBuilder: (context,  index) {
                              ShopReg customers = controller.myList[index];
                              return Column(children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.isVisible.value =
                                        !controller.isVisible.value;
                                  },
                                  child: BuildShopList(index, customers),
                                ),
                              ]);
                            },
                          ),
                       ),
                     ),
                    ),
                  ),

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
        ));
  }

  Container BuildShopList(index,ShopReg customers) {
    return Container(
                                // height: 100,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.grey),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
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
                                                child: Image.asset(
                                                    AssetHelper.shop)),
                                          ],
                                        ),
                                        SizedBox(width: Get.width * .03),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                              '${customers.shopName}',
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
                                        Column(
                                          children: [
                                            MAButton(
                                              text: 'Detail',
                                              buttonPress: () {
                                                Get.to(() => AddShopView());
                                              },
                                              isEnabled: true,
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 70),
                                              height: Get.height * 0.05,
                                              width: Get.width * 0.3,
                                              clipBehavior: 0,
                                              radius: 30,
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                       child:  Obx( ()=>
                                           Visibility(
                                             visible: controller.isVisible.value,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                               children: [
                                                 GestureDetector(
                                                   onTap: () => controller.setSelectedOption(1),
                                                   child: Container(
                                                     width: 170,
                                                     child: RadioListTile(
                                                       title: Text('Marketing', style: MyTheme.regularTextStyle(
                                                         fontWeight: FontWeight.w500,
                                                         color: MyTheme.myBlueDark,
                                                         fontSize: Get.height * .016,
                                                       ),),
                                                       value: 1,
                                                       groupValue: controller.selectedOption.value,
                                                       onChanged: (value) {
                                                         controller.setSelectedOption(value!);
                                                         Get.to(MarketingView());
                                                       },
                                                     ),
                                                   ),
                                                 ),
                                                 GestureDetector(
                                                   onTap: () => controller.setSelectedOption(2),
                                                   child: Container(
                                                     width: 150,
                                                     child: RadioListTile(
                                                       title: Text('Sales', style: MyTheme.regularTextStyle(
                                                         fontWeight: FontWeight.w500,
                                                         color: MyTheme.myBlueDark,
                                                         fontSize: Get.height * .016,
                                                       ),),
                                                       value: 2,
                                                       groupValue: controller.selectedOption.value,
                                                       onChanged: (value) {
                                                         controller.setSelectedOption(value!);
                                                          Get.to(AddOrderView());
                                                       },
                                                     ),
                                                   ),
                                                 ),
                                             ],
                                         ),
                                           ),
                                       ),

                                    )
                                  ],
                                ),
                              );
  }
}
