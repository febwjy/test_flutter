import 'package:get_it/get_it.dart';
import 'package:test_flutter/core/bloc/login/login_bloc.dart';
import 'package:test_flutter/core/bloc/user/user_bloc.dart';
import 'package:test_flutter/core/data/repository/api_repository_impl.dart';
import 'package:test_flutter/core/domain/repository/api_repository.dart';
import 'package:test_flutter/core/domain/usecase/login_usecase.dart';
import 'package:test_flutter/core/domain/usecase/user_usecase.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  sl.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl());

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => UserUseCase(sl()));

  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => UserBloc(sl()));
}
