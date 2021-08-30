import 'dart:convert';
import 'dart:io';
import 'package:do_it_flutter_v2/services/remote/api/base_response.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  final String _baseUrl = "http://192.168.1.6:1337/";

  _message({required BuildContext context, required String message}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
  }

  Future<void> _request<T>(
      {required Future<http.Response> futureResponse,
      required String requestName,
      required BaseResponse responseModel,
      required BuildContext context,
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
      Log.error("connection error");
      if (onConnectionError != null){
        onConnectionError();
      }else{
        _message(context: context, message: "check your internet connection");
      }
    }
  }

  Future<void> get<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      required BuildContext context,
      Map<String, String>? headers,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);

    if(headers == null){
      headers = {"Authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjMwMjU4OTYzLCJleHAiOjE2MzI4NTA5NjN9.0FDqSRmUBVOuWSF3Vvmv07PTDjzP_EsSIZAjPBZ3Jdg"};
    }else{
      headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjMwMjU4OTYzLCJleHAiOjE2MzI4NTA5NjN9.0FDqSRmUBVOuWSF3Vvmv07PTDjzP_EsSIZAjPBZ3Jdg";
    }

    await _request<T>(
        futureResponse: http.get(url, headers: headers),responseModel: responseModel,
        context: context,
        requestName: requestName,onSuccess: onSuccess,onConnectionError: onConnectionError,onError: onError);
  }

  Future<void> post<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      required BuildContext context,
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
            context: context,
        requestName: requestName,onError: onError, onConnectionError: onConnectionError, onSuccess: onSuccess);
  }

  Future<void> put<T>(
      {required String endpoint,
      required String requestName,
      required BaseResponse responseModel,
      required BuildContext context,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      Function(T data)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Uri url = Uri.parse(_baseUrl + endpoint);

    if(headers == null){
      headers = {"Authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjMwMjU4OTYzLCJleHAiOjE2MzI4NTA5NjN9.0FDqSRmUBVOuWSF3Vvmv07PTDjzP_EsSIZAjPBZ3Jdg"};
    }else{
      headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjMwMjU4OTYzLCJleHAiOjE2MzI4NTA5NjN9.0FDqSRmUBVOuWSF3Vvmv07PTDjzP_EsSIZAjPBZ3Jdg";
    }

    await _request<T>(
        futureResponse: http.put(url, headers: headers,body: body, encoding: encoding),
        context: context,
        requestName: requestName,onSuccess: onSuccess,onConnectionError: onConnectionError,onError: onError,responseModel: responseModel);
  }
}
