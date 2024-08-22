import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../utils/utils.dart';
import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);
    dio = Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }
  Options options = Options();
  Future<Response> getRequest(
      {required String path, bool isTokenRequired = false}) async {
    try {
      if (isTokenRequired) {
        var token = await Utils.getToken();
        options.headers = baseOptions.headers
          ..addAll({"Authorization": "Bearer $token"});
      }
      var response = await dio.get(path, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> postRequest(
      {required String path,
      dynamic body,
      bool isTokenRequired = false}) async {
    if (isTokenRequired) {
      var token = await Utils.getToken();
      options.headers = baseOptions.headers
        ..addAll({"Authorization": "Bearer $token"});
    }
    try {
      var response = await dio.post(path, data: body, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
