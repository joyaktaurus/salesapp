
import 'dart:developer';

import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class ImageUploadServices {
  static Future<ApiResp> uploadProcess(
      XFile file, BuildContext buildContext) async {
    dynamic resp;
    await errMAsync(() async {
      resp = await MyDio().customMultipart(
        ApiPaths.uploadimage,
        file: file,
        buildContext: buildContext,

      );
    }, title: 'Failed', dialogDismiss: true);
    // ignore: prefer_interpolation_to_compose_strings
    log('LL' + resp.toString());
    // if (resp.toString().isNotEmpty) {
    //     var a = jsonDecode(resp);
    //   }
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
