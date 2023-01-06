import 'dart:ffi';

import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_model.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final BaseService _apiService;

  LoginRepositoryImpl(BaseService baseService) : _apiService = baseService;

  @override
  Future<LoginModel> fetchLogin() async {
    var response = await _apiService.getAuthentication("logina");
    return response;
  }
}
