import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'app_exception.dart';

class ApiService extends ChangeNotifier {
  final String BASE_URL = "http://192.168.1.6:3333/api";
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  // @override
  Future<LoginResponseModel> postAuthentication(
    String endpoint,
    LoginRequestModel request,
  ) async {
    Response responseJson;

    try {
      var dio = Dio();
      dio.options.baseUrl = BASE_URL;
      responseJson = (await dio.post("/auth", data: request));

      LoginResponseModel response = LoginResponseModel.fromJson(responseJson.data);
      return response;
    } catch (e) {
      throw BadRequestException("error mapping");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 300:
        throw BadRequestException("error");
      case 401:
        throw BadRequestException("error");
      case 403:
        throw BadRequestException("error");
      case 500:
      default:
        throw BadRequestException("error");
    }
  }

  void authenticat(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
