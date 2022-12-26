import 'dart:ffi';

import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_model.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel> fetchLogin() async {
    ApiService apiService = ApiService();
    var response = await apiService.getAuthentication("login");
    return response;
  }
}
