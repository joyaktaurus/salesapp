// To parse this JSON data, do
//
//     final shopList = shopListFromJson(jsonString);

import 'dart:convert';

MarketList shopListFromJson(String str) => MarketList.fromJson(json.decode(str));

String shopListToJson(MarketList data) => json.encode(data.toJson());

class MarketList {
  String message;

  MarketList({
    required this.message,
  });

  factory MarketList.fromJson(Map<String, dynamic> json) => MarketList(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
