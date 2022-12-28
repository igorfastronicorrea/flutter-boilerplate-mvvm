import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_page.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_viewmodel.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';
import 'package:flutter_boilerplate_mvvm/setup_injection.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
  init();
}

init() {
  setupInjection();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boilerplate',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(),
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
    );
  }
}
