part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final Login? data;
  final String? error;
  const LoginState({this.data, this.error});

  @override
  List<Object> get props => [data!, error!];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess({required Login login}) : super(data: login);
}

class LoginError extends LoginState {
  const LoginError({required String error}) : super(error: error);
}
