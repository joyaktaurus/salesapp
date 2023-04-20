import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../app.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';

ApiResp respNew = ApiResp(
  ok: false,
  rdata: null,
  msgs: [],
);

class MyDio {
  static String baseUrl = ApiPaths.baseUrl;

  late Dio _dio;

  MyDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      // connectTimeout: 60 * 500,
      // // 30 seconds
      // receiveTimeout: 60 * 1000,
      // 60 seconds

      responseType: ResponseType.plain,
      headers: {
        Headers.contentTypeHeader: "application/json",
        if (App.token.isNotEmpty) "Authorization": "Token ${App.user.token}",
        if (App.subOrgs.isNotEmpty) "Suborg": App.selectedSuborg.id,
      },
    );

    _dio = Dio(options);

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }



  Future<dynamic> customPost(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    try {
      // Dio dio = Dio();
      // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      //   return null;
      // };

      Response resp = await _dio.post(baseUrl + path,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
            // headers: {
            //   Headers.contentTypeHeader: "application/json",
            //   "Authorization": "Token ${App.user.token}"
            // }
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${resp.requestOptions.data}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioError catch (ex) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${ex.requestOptions.data}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      // if (ex.type == DioErrorType.connectTimeout) {
      //   throw Exception(ex.message);
      // } else {
      //   return ex;
      // }
    }
  }

  Future<dynamic> customPatch(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    try {
      Response resp = await _dio.patch(baseUrl + path,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${resp.requestOptions.data}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioError catch (ex) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${ex.requestOptions.data}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      // if (ex.type == DioErrorType.connectTimeout) {
      //   throw Exception(ex.message);
      // } else {
      //   return ex;
      // }
    }
  }

  Future<dynamic> post(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    try {
      Response resp = await _dio.post(baseUrl + path,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
            //  headers:
            // {
            //   Headers.contentTypeHeader: "application/json",
            //   if(App.token.isNotEmpty)
            //   "Authorization": "Token ${App.user.token}"
            // }
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${resp.requestOptions.data}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioError catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${e.requestOptions.data}");
      }
      debugPrint("************** Error End ************************");
      // if (e.type == DioErrorType.response) {
      //   throw Exception('No proper response from server');
      // }
      // if (e.type == DioErrorType.connectTimeout) {
      //   throw Exception('Connection timed-out. Check internet connection.');
      // }
      // if (e.type == DioErrorType.receiveTimeout) {
      //   throw Exception('Unable to connect to the server');
      // }
      // if (e.type == DioErrorType.other) {
      //   throw Exception('Something went wrong with server communication');
      // }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> customMultipart(
      String path, {
        data,
        BuildContext? buildContext,
        XFile? file,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    String fileName = file!.path.split('/').last;
    print(fileName);
    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,

      ),
    });
    print(data);
    Dio dio = Dio();

    Response resp = await dio.post(path, data: data);

    debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    debugPrint(
        "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
    debugPrint("ResMethodType : [${resp.requestOptions.method}]");
    resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

    debugPrint("QueryParameters:");
    resp.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint(resp.requestOptions.queryParameters.toString());

    if (resp.requestOptions.data != null) {
      debugPrint("Body: ${resp.requestOptions.data}");
    }
    log('resp >>>${resp.data}');
    debugPrint("************** Response End ************************");
    dynamic apiResp = resp.data;
    log(apiResp.toString());
    return apiResp;

  }


  Future<dynamic> get(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    try {
      Response resp = await _dio.get(baseUrl + path,
          options: Options(
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${resp.requestOptions.data}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioError catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${e.requestOptions.data}");
      }
      debugPrint("************** Error End ************************");
      // if (e.type == DioErrorType.response) {
      //   print("pathhhhhhhhhhh");
      //   print(path);
      //   throw Exception('No proper response from server');
      // }
      // if (e.type == DioErrorType.connectTimeout) {
      //   throw Exception('Connection timed-out. Check internet connection.');
      // }
      // if (e.type == DioErrorType.receiveTimeout) {
      //   throw Exception('Unable to connect to the server');
      // }
      // if (e.type == DioErrorType.other) {
      //   throw Exception('Something went wrong with server communication');
      // }
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
