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
  bool _isVisibleButton = true;

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
          return getUi(context, viewModel, _isVisibleButton);
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getUi(
      BuildContext context, LoginViewModel viewModel, bool _isVisible) {
    switch (viewModel.status) {
      case Status.SUCCESS:
        Future.delayed(Duration.zero, () async {
          Get.offAllNamed("/homepage");
        });
        _isVisibleButton = true;
        return loginWidget(_isVisible);
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
        _isVisibleButton = true;
        return loginWidget(_isVisible);
      default:
        return loginWidget(_isVisible);
      //ERROR
    }
    // return loginWidget();
  }

  Widget loginWidget(bool _visibility) {
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
            child: _isVisibleButton
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      viewModel.status = null;
                      viewModel.userName = "";
                      viewModel.valideLogin();

                      setState(() {
                        _isVisibleButton = false;
                      });
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : const SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
