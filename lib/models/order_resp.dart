// To parse this JSON data, do
//
//     final shopList = shopListFromJson(jsonString);

import 'dart:convert';

OrderList shopListFromJson(String str) => OrderList.fromJson(json.decode(str));

String shopListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  String message;

  OrderList({
    required this.message,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
