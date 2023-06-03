import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class SearchListServices {
  static Future<ApiResp> fetchSearchList(String shopname) async {
    dynamic resp;
    await errMAsync(() async {
      resp = await MyDio().get(ApiPaths.search,
        queryParameters: {'shopname': shopname},
      ); });
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
}