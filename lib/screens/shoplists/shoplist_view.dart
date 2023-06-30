import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';
import 'package:salesapp/screens/customer_detail/detail_view.dart';
import 'package:salesapp/screens/marketing/marketing_view.dart';
import 'package:salesapp/screens/shoplists/shoplist_controller.dart';

import '../../components/app_blank_body.dart';
import '../../components/app_body_view.dart';
import '../../components/app_boxes.dart';
import '../../components/app_buttons.dart';
import '../../components/app_empty.dart';
import '../../components/app_load_more.dart';
import '../../components/app_searchbar.dart';
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
                padding: EdgeInsets.only(top: Get.height * .280),
                child: Obx(
                  () => controller.isScreenProgress.value == true
                      ? Column(
                          children: [
                            Expanded(child: Center(child: RoundedLoader()))
                          ],
                        )
                      : SingleChildScrollView(
                        child: Column(mainAxisSize: MainAxisSize.max, children: [
                          SizedBox(height: 10),
                          Padding(
                            padding:  EdgeInsets.only(left: 20.0, right: 20.0),
                            child: MASearchBar(
                              hintText: 'Search a Shop',
                              controller: controller.searchCntrl,
                              searchFn: () => controller.searchBtn(),
                              searchTypeChosenValue:
                                  controller.searchTypeChosenValue.value,
                              suffixIconBtnFn: () =>
                                  controller.searchSuffixIconBtn(),
                              textInputAction: TextInputAction.search,
                              textFieldOnchanged: (val) =>
                                  controller.searchOnChangeFn(val),
                              // dropDownOnchanged: (val) =>
                              //     controller.searchDropdownOnChangeFn(val),
                              onFieldSubmitted: (val) =>
                                  controller.onFieldSubmittedFn(val),
                              // goToQRScan: () => controller.qrScanBtn(),
                            ),
                          ),
                          LoadMore(
                            // isFinish: controller.myList.length ==
                            //     controller.inventoryItemsTotalCount.value,
                            onLoadMore: controller.loadMore,
                            delegate: DefaultLoadMoreDelegate(),
                            child:
                            controller.myList.isEmpty
                                ? MAResultEmpty(
                                    // buttnWidget: Container(),
                                    msg: 'Results Empty',
                                  )
                                : Padding(
                                  padding:  EdgeInsets.only(top:15.0, ),
                                  child: AppBoxes(
                                      width: Get.width * .9,
                                      height: Get.height * .55,
                                      child: ListView.builder(
                                        controller: controller.customersScrollController,
                                        itemCount: controller.myList.length,
                                        itemBuilder: (context, index) {
                                          Shop customers = controller.myList[index];
                                          return Padding(
                                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.currentPage = index;
                                                    controller.isVisible.value = !controller.isVisible.value;
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: Get.height * .06,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(color: MyTheme.myBlueDark),
                                                        ),
                                                        child: Image.asset(AssetHelper.shop),
                                                      ),
                                                      SizedBox(width: Get.width * .03),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(height: Get.height * .025),
                                                          Text(
                                                            '${customers.shopName}',
                                                            style: MyTheme.regularTextStyle(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: Get.height * .018,
                                                              color: MyTheme.myBlueDark,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${customers.customerName}',
                                                            style: MyTheme.regularTextStyle(
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: Get.height * .012,
                                                              color: Colors.black87,
                                                            ),
                                                          ),
                                                          SizedBox(height: Get.height * .02),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      FittedBox(
                                                        child: MAButton(
                                                          text: 'Detail',
                                                          buttonPress: () {
                                                            Get.to(() => DetailView(index));
                                                          },
                                                          isEnabled: true,
                                                          padding: EdgeInsets.only(top: 5, left: 0),
                                                          height: Get.height * 0.05,
                                                          width: Get.width * 0.3,
                                                          clipBehavior: 0,
                                                          radius: 30,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Obx(() => Visibility(
                                                  visible: controller.isVisible.value,
                                                  child: controller.currentPage == index
                                                      ? Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.setSelectedOption(index);
                                                          Get.to(MarketingView(
                                                            widgetId: index,
                                                          ));
                                                        },
                                                        child: Container(
                                                          width: Get.width * .4,
                                                          child: RadioListTile(
                                                            title: GestureDetector(
                                                              onTap: () {
                                                                Get.to(MarketingView(widgetId: index));
                                                              },
                                                              child: Text(
                                                                'Marketing',
                                                                style: MyTheme.regularTextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                  fontSize: Get.height * .014,
                                                                ),
                                                              ),
                                                            ),
                                                            value: true,
                                                            groupValue: controller.isMarketingSelected.value,
                                                            onChanged: (value) {
                                                              if (value != null && value) {
                                                                Get.to(MarketingView(widgetId: index));
                                                              }
                                                            },
                                                            activeColor: controller.currentPage == index ? controller.marketingColor.value : null,
                                                                // Default color for other radio buttons
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.setSelectedOption(index);
                                                          Get.to(
                                                            AddOrderView(
                                                              widgetId: index,
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: Get.width * .4,
                                                          child: RadioListTile(
                                                            title: GestureDetector(
                                                              onTap: () {
                                                                Get.to(AddOrderView(widgetId: index));
                                                              },
                                                              child: Text(
                                                                'Sales',
                                                                style: MyTheme.regularTextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                  fontSize: Get.height * .014,
                                                                ),
                                                              ),
                                                            ),
                                                            value: true,
                                                            groupValue: controller.isSalesSelected.value,
                                                            onChanged: (value) {
                                                              if (value != null && value) {
                                                                Get.to(AddOrderView(widgetId: index));
                                                              }
                                                            },
                                                            activeColor: controller.salesColor.value

                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                      : SizedBox(),
                                                )),
                                                Divider(),
                                              ],
                                            ),
                                          );
                                        },
                                      ),

                                  ),
                                ),
                          ),
                        ]),
                      ),
                ))
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
}
