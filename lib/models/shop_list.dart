// To parse this JSON data, do
//
//     final shopList = shopListFromJson(jsonString);

import 'dart:convert';

ShopList shopListFromJson(String str) => ShopList.fromJson(json.decode(str));

String shopListToJson(ShopList data) => json.encode(data.toJson());

class ShopList {
  String message;
  List<Shop> shop;

  ShopList({
    required this.message,
    required this.shop,
  });

  factory ShopList.fromJson(Map<String, dynamic> json) => ShopList(
    message: json["message"],
    shop: List<Shop>.from(json["shop"].map((x) => Shop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "shop": List<dynamic>.from(shop.map((x) => x.toJson())),
  };
}

class Shop {
  String? intShopId;
  String? shopName;
  String? customerName;
  String? phoneNumber;
  String? strEmail;
  String? addressLine1;
  String? addressLine2;
  String? pincode;
  String? strInstructions;
  DateTime? createdAt;
  DateTime? updatedAt;

  Shop({
    this.intShopId,
    this.shopName,
    this.customerName,
    this.phoneNumber,
    this.strEmail,
    this.addressLine1,
    this.addressLine2,
    this.pincode,
    this.strInstructions,
    this.createdAt,
    this.updatedAt,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    intShopId: json["int_shop_id"],
    shopName: json["shop_name"],
    customerName: json["customer_name"],
    phoneNumber: json["phone_number"],
    strEmail: json["str_email"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    pincode: json["pincode"],
    strInstructions: json["str_instructions"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "int_shop_id": intShopId,
    "shop_name": shopName,
    "customer_name": customerName,
    "phone_number": phoneNumber,
    "str_email": strEmail,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "pincode": pincode,
    "str_instructions": strInstructions,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
