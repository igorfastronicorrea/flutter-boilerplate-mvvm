import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_response_model.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(ApiService apiService) : _apiService = apiService;

  @override
  Future<LoginResponseModel> fetchLogin(LoginRequestModel request) async {
    var response = await _apiService.postAuthentication("auth", request);
    return response;
  }
}
