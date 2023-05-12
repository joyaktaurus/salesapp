import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import '../app.dart';
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class ShopRegisterServices {
  static Future<ApiResp> fetchUser({
      required String shopname,
      required String customername,
      required String phonenumber,
      required String email,
      required String addressline1,
      required String addressline2,
      required String pincode,
      required String instructions}) async {
    dynamic resp;
    await errMAsync(
      () async {
        resp = await MyDio().customPost(
          ApiPaths.shopregister,
          data: {
            'shopname': shopname,
            'customername': customername,
            'phonenumber': phonenumber,
            'email': email,
            'addressline1': addressline1,
            'addressline2': addressline2,
            'pincode': pincode,
            'instructions': instructions
          },
        );
      },
      title: 'Shop Register Failed',
    );

    if (resp is DioError) {
      if (resp.response?.statusCode == 400) {
        log('400 >> ${resp.response}');
        showMsg("Invalid Details", "Registration Failed");
      }
      if (resp.type == DioErrorType.connectTimeout) {
        showMsg(
            'Connection timed-out. Check internet connection.', "Registration Failed");
      }
      if (resp.type == DioErrorType.receiveTimeout) {
        showMsg('Unable to connect to the server', "Registration Failed");
      }
      if (resp.type == DioErrorType.other) {
        showMsg(
            'Something went wrong with server communication', "Registration Failed");
      }
    } else {
      respNew = resp != null
          ? ApiResp(
              ok: true,
              rdata: resp,
              msgs: [
                ApiMsg(
                  msg: "",
                  msgType: "",
                  title: "Success",
                )
              ],
            )
          : ApiResp(
              ok: false,
              rdata: "",
              msgs: [
                ApiMsg(
                  msg: "Server response failed",
                  msgType: "0",
                  title: "Failed",
                )
              ],
            );
    }
    return respNew;
  }
}
