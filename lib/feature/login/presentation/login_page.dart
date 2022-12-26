import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    LoginViewModel viewModel =
        Provider.of<LoginViewModel>(context, listen: false);
    viewModel.valideLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: viewModel.userName.isNotEmpty
          ? Container(
              child: _ui(viewModel),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _ui(usersViewModel) {
    return Text(usersViewModel.userName);
  }
}
