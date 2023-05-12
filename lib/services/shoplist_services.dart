import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import '../app.dart';
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class ShopListServices {
  static Future<ApiResp> getList() async {
    dynamic resp;
    await errMAsync(() async {
      resp = await MyDio().get(ApiPaths.shoplist);
    });
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
    return respNew;
  }

  static Map getAllCustomersListPayload() {
    try {
      //  Map<String, dynamic> bodyParams = {};
      Map body = {};
      body = {
        "sort": [
          {
            "colname": "tenant_customer_name",
            "direction": "asc",
          },
        ],
        "filters": null
      };
      return body;
    } catch (e) {
      try {
        return {};
      } catch (e2) {
        return {};
      }
    }
  }

}
