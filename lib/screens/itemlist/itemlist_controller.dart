import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
class ListItem {
  final String name;
  final String quantity;
  final double price;

  ListItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      name: json['name'],
      quantity: json['quantity'],
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }
}
class ItemListController extends GetxController {

  // final MyListController controllerr = Get.find();

  final TextEditingController itemnameCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();

  // void addToListt() {
  //   String name = itemnameCtrl.text;
  //   String quantity = quantityCtrl.text;
  //   double price = double.tryParse(priceCtrl.text) ?? 0.0;
  //   if (name.isNotEmpty) {
  //     controllerr.addToList(ListItem(
  //       name: name,
  //       quantity: quantity,
  //       price: price,
  //     ));
  //     Get.back();
  //   }
  // }

}

// class MyListController extends GetxController {
//   late final GetStorage storage;
//   final RxList<ListItem> myList = (List<ListItem>.of([])).obs;
//
//   double get totalPrice => myList.fold(
//     0,
//         (sum, item) => sum + item.price,
//   );
//
//   @override
//   void onInit() {
//     super.onInit();
//     storage = GetStorage();
//     List<dynamic>? storedList = storage.read<List<dynamic>>('myList');
//     if (storedList != null) {
//       myList.addAll(storedList.map((item) => ListItem.fromJson(item)));
//     }
//   }
//
//   void addToList(ListItem item) {
//     myList.add(item);
//     storage.write('myList', myList.toList());
//   }
//
//   void removeFromList(int index) {
//     myList.removeAt(index);
//     storage.write('myList', myList.toList());
//   }
// }