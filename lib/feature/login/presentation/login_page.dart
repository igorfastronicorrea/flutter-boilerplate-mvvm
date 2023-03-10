import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_viewmodel.dart';
import 'package:flutter_boilerplate_mvvm/setup_injection.dart';
import 'package:flutter_boilerplate_mvvm/status.dart';
import 'package:flutter_boilerplate_mvvm/utils/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = getIt<LoginViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<LoginViewModel>(
        builder: ((context, viewModel, child) {
          return getUi(context, viewModel);
        }),
      ),
    );
  }

  Widget getUi(BuildContext context, LoginViewModel viewModel) {
    switch (viewModel.status) {
      case Status.SUCCESS:
        Future.delayed(Duration.zero, () async {
          Get.toNamed("/homepage");
        });

        return loginWidget();
      case Status.ERROR:
        Future.delayed(Duration.zero, () async {
          await DialogUtils.alertInformation(
                  context, "", "Usuário ou senha inválidos!")
              .then((value) {
            if (value ?? false) {
              print("ok");
            } else {
              print("cancel");
            }
          });
        });
        return loginWidget();
      default:
        return loginWidget();
      //ERROR
    }
    // return loginWidget();
  }

  Widget loginWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'username'),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'password'),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              onPressed: () {
                viewModel.valideLogin();
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
