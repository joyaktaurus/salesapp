import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salesapp/screens/addorder/addorder_view.dart';

import '../../components/app_blank_body.dart';
import '../../my_theme.dart';
import '../../utils/my_utils.dart';
import 'itemlist_controller.dart';

class ItemListView extends GetView<ItemListController> {
  ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemListController());
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
                      "add item".toUpperCase(),
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
                padding: EdgeInsets.only(
                    left: 18.0, right: 18.0, top: Get.height * .280),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Container(
                         width: 100,
                         height: 30,
                         child:TextField(
                           controller: controller.itemnameCtrl,
                           decoration: InputDecoration(
                               hintText: 'Item Name',
                               hintStyle: TextStyle(
                                 color: MyTheme.myBlueDark,
                               ),
                               border: InputBorder.none),
                         ),
                       ),
                      SizedBox(height: Get.height *.05),
                      Container( width: 100,
                        height: 30,
                        child: TextField(
                          controller: controller.quantityCtrl,
                          decoration: InputDecoration(
                              hintText: 'Quantity',
                              hintStyle: TextStyle(
                                color: MyTheme.myBlueDark,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: Get.height *.05),
                      Container( width: 100,
                        height: 30,
                        child: TextField(
                          controller: controller.priceCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Price',
                              hintStyle: TextStyle(color: MyTheme.myBlueDark),
                              border: InputBorder.none),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            child: Text(
                              'CANCEL',
                              style: TextStyle(color: MyTheme.myBlueDark),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyTheme.myBlueDark,
                                foregroundColor: Colors.white,
                                fixedSize: Size(100, 30)),
                            child: Text('ADD'),
                            onPressed: () {
                              // controllerr.addToListt();
                              showDialog(
                                context: context,
                                builder: (_) => AddOrderView(widgetId: 2),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
