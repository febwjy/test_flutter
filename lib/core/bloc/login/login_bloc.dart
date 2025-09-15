import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/core/data/model/login.dart';
import 'package:test_flutter/core/domain/usecase/login_usecase.dart';
import 'package:test_flutter/core/utils/data_state.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginInitial()) {
    on<GetLogin>(onGetLogin);
  }

  Future<void> onGetLogin(GetLogin event, Emitter<LoginState> emit) async {
    emit(const LoginLoading());
    final dataState = await loginUseCase(params: event.param);
    if (dataState is DataSuccess) {
      emit(LoginSuccess(login: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(LoginError(error: dataState.error!));
    }
  }
}
