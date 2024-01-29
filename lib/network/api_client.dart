import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:innovation/cache/app_storage.dart';
import 'package:innovation/routes/route_helper.dart';
import 'package:innovation/utils/constants/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late Map<String, String> _formHeader;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json",
    };
    log("token : ${AppStorage().getToken(Constant().newToken)}");
    String mytoken = 'Bearer ${AppStorage().getToken(Constant().newToken)}';

    _formHeader = {
      'Authorization': 'Bearer $mytoken',
      "Accept": "application/json"
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postDataWithToken(
    String uri,
    dynamic body,
    String token,
  ) async {
    Map<String, String> specialHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      Response response = await post(uri, body, headers: specialHeader);
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFormData(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response =
          await post(uri, body, headers: {"Accept": "application/json"});
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postFormDataWithHeader(
    String uri,
    dynamic body,
  ) async {
    try {
      Response response = await post(uri, body, headers: _formHeader);
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(
    String uri,
  ) async {
    try {
      Response response = await delete(uri, headers: _mainHeaders);
      errorHandler(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<void> updateToken(String token) async {
    _mainHeaders['Authorization'] = 'Bearer $token';
    _formHeader['Authorization'] = 'Bearer $token';
  }
}

class $ {}

void errorHandler(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    Fluttertoast.showToast(
        msg: response.body["message"] ?? "success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  if (response.statusCode == 401) {
    Fluttertoast.showToast(
        msg: response.body["message"] ??
            response.body["error"] ??
            "session expired",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0);
    AppStorage().setToken(Constant().newToken, '');
    Get.offNamed(RouteHelper.login);
  }
}
