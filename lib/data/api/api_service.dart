import 'dart:convert';
import 'dart:io';
import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'app_exception.dart';

class ApiService extends BaseService {
  @override
  Future<LoginModel> getAuthentication(String endpoint) async {
    dynamic responseJson;

    try {
      var response = await http.get(Uri.parse(BASE_URL + endpoint));
      responseJson = returnResponse(response);
      return LoginModel.fromJson(responseJson);
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
}
