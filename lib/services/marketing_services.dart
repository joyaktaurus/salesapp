import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import '../app.dart';
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../models/shop_list.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';


abstract class MarketingServices {
  static Future<ApiResp> fetchMarketing({
    required int shopid,
    required String visitdate,
    required String visitpurpose ,
    required String marketingnotes,
    required String longitude,
    required String latitude,
  }) async {
    dynamic resp;
    await errMAsync(
          () async {
            resp = await MyDio().markPost(
              ApiPaths.marketing,
              queryParameters: {
                'shopid': shopid,
                'visitdate': visitdate,
                'visitpurpose': visitpurpose,
                'marketingnotes': marketingnotes,
                'longitude': longitude,
                'latitude': latitude,
              },
        );
      },
    //  title: 'Marketing Failed',
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

