// To parse this JSON data, do
//
//     final imageUploadResp = imageUploadRespFromJson(jsonString);

import 'dart:convert';

ImageUploadResp imageUploadRespFromJson(String str) => ImageUploadResp.fromJson(json.decode(str));

String imageUploadRespToJson(ImageUploadResp data) => json.encode(data.toJson());

class ImageUploadResp {
  ImageUploadResp({
    this.status,
    this.code,
    this.data,
  });

  String? status;
  int? code;
  String? data;

  factory ImageUploadResp.fromJson(Map<String, dynamic> json) => ImageUploadResp(
    status: json["status"],
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data,
  };
}
