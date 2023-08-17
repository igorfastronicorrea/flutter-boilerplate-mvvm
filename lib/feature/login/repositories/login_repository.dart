import 'package:flutter_boilerplate_mvvm/data/models/login_request_model.dart';

abstract class LoginRepository1 {
  Future<dynamic> fetchLogin(LoginRequestModel request);
}
