import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_model.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository_impl.dart';
import 'package:get_it/get_it.dart';

class LoginViewModel with ChangeNotifier {
  String _userName = "";
  String get userName => _userName;

  final LoginRepository _repository;

  LoginViewModel(
    LoginRepository loginRepository,
  ) : _repository = loginRepository;

  setUserName(String nome) {
    _userName = nome;

    notifyListeners();
  }

  valideLogin() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      LoginModel response = await _repository.fetchLogin();

      setUserName(response.name);
    } catch (e) {
      setUserName("ERROR");
    }
  }
}
