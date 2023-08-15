import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class CoreRequesterInterface {
  Future fetch(
      {required String url, body, required Function(dynamic p1) fromJson});
  Future post(
      {required String url, body, required Function(dynamic p1) fromJson});
}

class CoreRequester implements CoreRequesterInterface {
  static final CoreRequester _singleton = CoreRequester._internal();

  factory CoreRequester() {
    return _singleton;
  }

  CoreRequester._internal();

  Dio _setOptions(String url) {
    var dio = Dio();

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true,
        maxWidth: 90,
        compact: true,
      ));
    }

    dio.options.baseUrl = url;
    return dio;
  }

  @override
  Future fetch(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.get(url);
      },
    );
  }

  @override
  Future post(
      {required String url,
      body,
      required Function(dynamic p1) fromJson}) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      invokeDio: (dio) async {
        return await dio.post(url, data: body);
      },
    );
  }

  Future _invokeRequest({
    required String url,
    required Function(dynamic p1) fromJson,
    required Future<Response<dynamic>> Function(Dio) invokeDio,
  }) async {
    var dio = _setOptions(url);

    late Response<dynamic> response;
    try {
      response = await invokeDio(dio);
    } catch (e) {
      rethrow;
    }

    return fromJson(response.data);
  }
}
