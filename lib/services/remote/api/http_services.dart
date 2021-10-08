import 'dart:convert';
import 'dart:io';
import 'package:do_it_flutter_v2/objects/user/user.dart';
import 'package:do_it_flutter_v2/services/remote/api/base_response.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:do_it_flutter_v2/widgets/custom_snack_bar.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  HttpServices._();

  static final HttpServices singleton = HttpServices._();

  final String _baseUrl = "http://192.168.1.6:1337/";

  Map<String, String> get defaultHeader {
    Map<String, String> map = {"Authorization": "Bearer ${User.jwt}"};
    return map;
  }

  Future<void> _request<T>(
      {required Future<http.Response> futureResponse,
      required String requestName,
      required BaseResponse responseModel,
      Function(T data)? onSuccess,
      Function(int errorCode)? onError,
      Function()? onConnectionError}) async {
    try {
      http.Response response = await futureResponse;
      if (response.statusCode == 200) {
        Log.httpSuccess(requestName: requestName, response: response);
        responseModel.fromJson(response.body);
        if (onSuccess != null) onSuccess(responseModel as T);
      } else {
        Log.httpError(requestName: requestName, response: response);
        if (onError != null) onError(response.statusCode);
      }
    } on SocketException catch (e) {
      Log.error("connection error : $e");
      if (onConnectionError != null) {
        onConnectionError();
      } else {
        // toast("check your internet connection");
        customSnackBar(text: "fhdal");
      }
    }
  }

  Future<void> get<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      Map<String, String>? headers,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);

    if (headers == null) {
      headers = defaultHeader;
    }

    await _request<T>(
        futureResponse: http.get(url, headers: headers),
        responseModel: responseModel,
        requestName: requestName,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError);
  }

  Future<void> post<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);
    

    await _request<T>(
        futureResponse:
            http.post(url, headers: headers, body: body, encoding: encoding),
        responseModel: responseModel,
        requestName: requestName,
        onError: onError,
        onConnectionError: onConnectionError,
        onSuccess: onSuccess);
  }

  Future<void> put<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);

    if (headers == null) {
      headers = defaultHeader;
    }

    await _request<T>(
        futureResponse:
            http.put(url, headers: headers, body: body, encoding: encoding),
        requestName: requestName,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError,
        responseModel: responseModel);
  }

  Future<void> delete<T>(
      {required String endpoint,
        required String requestName,
        required BaseResponse responseModel,
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
        Function(T data)? onSuccess,
        Function(int)? onError,
        Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);

    if (headers == null) {
      headers = defaultHeader;
    }

    await _request<T>(
        futureResponse:
        http.delete(url, headers: headers, body: body, encoding: encoding),
        requestName: requestName,
        onSuccess: onSuccess,
        onConnectionError: onConnectionError,
        onError: onError,
        responseModel: responseModel);
  }
}
