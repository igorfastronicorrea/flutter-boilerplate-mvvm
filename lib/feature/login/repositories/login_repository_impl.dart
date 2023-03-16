import 'dart:ffi';

import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_response_model.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final BaseService _apiService;

  LoginRepositoryImpl(BaseService baseService) : _apiService = baseService;

  @override
  Future<LoginResponseModel> fetchLogin(LoginRequestModel request) async {
    var response = await _apiService.postAuthentication("auth", request);
    return response;
  }
}
