import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response_data.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/data/models/login_model.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository_impl.dart';
import 'package:flutter_boilerplate_mvvm/status.dart';
import 'package:get_it/get_it.dart';

class LoginViewModel with ChangeNotifier {
  String userName = "";
  Status? status;

  final LoginRepository _repository;

  LoginViewModel(
    LoginRepository loginRepository,
  ) : _repository = loginRepository;

  setUserName(String nome) {
    userName = nome;
    status = Status.SUCCESS;

    notifyListeners();
  }

  valideLogin() async {
    try {
      await Future.delayed(const Duration(seconds: 4));

      LoginModel response = await _repository.fetchLogin();

      setUserName(response.name);
    } catch (e) {
      setUserName("ERROR");
    }
  }
}
