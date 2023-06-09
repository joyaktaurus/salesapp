import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import '../app.dart';
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class AddOrderServices {
  static Future<ApiResp> fetchOrder({
    required String longitude,
    required String visitpurpose,
    required String latitude,
    required String product_details,
    required int shopid,
    required String orderdate,
    required String instructions,
    // required List<Map<String, dynamic>> orderItems, // Add this parameter
  }) async {
    dynamic resp;
    await errMAsync(
          () async {
        resp = await MyDio().salesPost(
          ApiPaths.shopvisit,
          queryParameters: {
            'instructions': instructions,
            'longitude': longitude,
            'visitpurpose': visitpurpose,
            'latitude': latitude,
            'product_details': product_details,
            'shopid': shopid,
            'orderdate': orderdate,
            // 'orderItems': orderItems, // Include the order items in the request body
          },
        );
      },
      title: 'Shop Register Failed',
    );

    if (resp is DioError) {
      if (resp.response?.statusCode == 400) {
        log('400 >> ${resp.response}');
        showMsg("Invalid Details", "Marketing Failed");
      }
      if (resp.type == DioErrorType.connectTimeout) {
        showMsg(
            'Connection timed-out. Check internet connection.', "Marketing Failed");
      }
      if (resp.type == DioErrorType.receiveTimeout) {
        showMsg('Unable to connect to the server', "Marketing Failed");
      }
      if (resp.type == DioErrorType.other) {
        showMsg(
            'Something went wrong with server communication', "Marketing Failed");
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
