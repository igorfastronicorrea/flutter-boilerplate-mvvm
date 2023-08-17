import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';

abstract class BaseService extends ChangeNotifier {
  final String BASE_URL = "http://192.168.1.6:3333/api";

  Future<dynamic> postAuthentication(String endpoint, LoginRequestModel request);
}
