import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio _dio = Dio();

  @override
  Future getGetApiResponse({String? url}) async {
    dynamic responseJson;

    try {
      _dio.interceptors.add(PrettyDioLogger());
      _dio.options.headers['content-Type'] = 'application/json';

      _dio.options.connectTimeout = const Duration(seconds: 40);
      Response response = await _dio.get(url ?? "");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        print("Timeout");
        throw FetchDataException("Request Timeout");
      } else {
        throw FetchDataException(e.message);
      }
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse({String? url, dynamic data}) async {
    dynamic responseJson;

    try {
      _dio.interceptors.add(PrettyDioLogger());
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.connectTimeout = const Duration(seconds: 40);
      Response response = await _dio.post(url ?? "", data: data);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        print("Timeout");
        throw FetchDataException("Request Timeout");
      } else {
        throw FetchDataException(e.message);
      }
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data is String ? response : response;

        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.data.toString());
      default:
        throw FetchDataException(
            "Error occured while communication with server${response.data}");
    }
  }
}
