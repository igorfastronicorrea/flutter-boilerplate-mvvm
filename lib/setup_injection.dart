import 'package:flutter_boilerplate_mvvm/data/api/api_service.dart';
import 'package:flutter_boilerplate_mvvm/data/api/base_service.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/presentation/login_viewmodel.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository.dart';
import 'package:flutter_boilerplate_mvvm/feature/login/repositories/login_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupInjection() {
  viewModel();
  repository();
}

repository() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
}

viewModel() {
  getIt.registerFactory(() => LoginViewModel(getIt()));
}
