import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/feature/home/presentation/home_page.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_page.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_viewmodel.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository_impl.dart';
import 'package:flutter_boilerplate_mvvm/setup_injection.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';

void main() {
  // init();
  GetIt.I.registerSingleton<ApiService>(ApiService());
  // GetIt.I.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(getIt()));
  // GetIt.I.registerFactory(() => LoginViewModel(getIt()));
  runApp(const MyApp());
}

init() {
  setupInjection();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boilerplate',
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );

    // return GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Boilerplate',
    //     theme: ThemeData(
    //       appBarTheme: const AppBarTheme(),
    //       primarySwatch: Colors.purple,
    //     ),
    //     initialRoute: '/',
    //     getPages: [
    //       GetPage(name: '/', page: () => const LoginPage(), children: [
    //         GetPage(
    //             name: '/homepage',
    //             page: () => HomePage(),
    //             transition: Transition.rightToLeft),
    //       ]),
    //     ]);
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  refreshListenable: GetIt.instance<ApiService>(),
  redirect: (context, state) {
    var auth = GetIt.instance<ApiService>();
    // var isAuthenticated = false;

    if (!auth.isAuthenticated) {
      return '/login';
    } else {
      return '/';
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);
