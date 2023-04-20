// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

User loginResponseFromJson(String str) => User.fromJson(json.decode(str));

String loginResponseToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.firstname,
    this.lastname,
    this.userid,
    this.emailVerified,
    this.twoFactorRequired,
    this.token,
    this.rolename,
    this.roleid,
    this.custid,
    this.custname,
    this.root,
    this.username,
    this.authSecret,
    this.twoFactorDefault,
    this.twoFactorMethods,
  });

  String? firstname;
  String? lastname;
  int? userid;
  bool? emailVerified;
  bool? twoFactorRequired;
  String? token;
  String? rolename;
  int? roleid;
  int? custid;
  String? custname;
  bool? root;
  String? username;
  String? authSecret;
  int? twoFactorDefault;
  List<int>? twoFactorMethods;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        userid: json["userid"],
        emailVerified: json["email_verified"],
        twoFactorRequired: json["two_factor_required"],
        token: json["token"] ?? '',
        rolename: json["rolename"] ?? '',
        roleid: json["roleid"] ?? -1,
        custid: json["custid"] ?? -1,
        custname: json["custname"] ?? '',
        root: json["root"] ?? false,
        authSecret: json["auth_secret"],
        twoFactorDefault: json["two_factor_default"],
        twoFactorMethods:
            List<int>.from(json["two_factor_methods"] ?? [0].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "userid": userid,
        "email_verified": emailVerified,
        "two_factor_required": twoFactorRequired,
        "token": token,
        "rolename": rolename,
        "roleid": roleid,
        "custid": custid,
        "custname": custname,
        "root": root,
        "auth_secret": authSecret,
        "two_factor_default": twoFactorDefault,
        "two_factor_methods":
            List<dynamic>.from(twoFactorMethods!.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final twoFactorVerifyResponse = twoFactorVerifyResponseFromJson(jsonString);

TwoFactorVerifyResponse twoFactorVerifyResponseFromJson(String str) =>
    TwoFactorVerifyResponse.fromJson(json.decode(str));

String twoFactorVerifyResponseToJson(TwoFactorVerifyResponse data) =>
    json.encode(data.toJson());

class TwoFactorVerifyResponse {
  TwoFactorVerifyResponse({
    this.valid,
    this.auth,
  });

  bool? valid;
  Auth? auth;

  factory TwoFactorVerifyResponse.fromJson(Map<String, dynamic> json) =>
      TwoFactorVerifyResponse(
        valid: json["valid"],
        auth: json["auth"] == null ? Auth() : Auth.fromJson(json["auth"]),
      );

  Map<String, dynamic> toJson() => {
        "valid": valid,
        "auth": auth?.toJson(),
      };
}

class Auth {
  Auth({
    this.firstname,
    this.lastname,
    this.userid,
    this.email,
    this.token,
    this.rolename,
    this.roleid,
    this.custid,
    this.custname,
    this.root,
  });

  String? firstname;
  String? lastname;
  int? userid;
  String? email;
  String? token;
  String? rolename;
  int? roleid;
  int? custid;
  String? custname;
  bool? root;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        firstname: json["firstname"],
        lastname: json["lastname"],
        userid: json["userid"],
        email: json["email"],
        token: json["token"],
        rolename: json["rolename"],
        roleid: json["roleid"],
        custid: json["custid"],
        custname: json["custname"],
        root: json["root"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "userid": userid,
        "email": email,
        "token": token,
        "rolename": rolename,
        "roleid": roleid,
        "custid": custid,
        "custname": custname,
        "root": root,
      };
}
