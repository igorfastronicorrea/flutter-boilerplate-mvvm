import 'dart:ffi';

import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<dynamic> fetchLogin(LoginRequestModel request);
}
