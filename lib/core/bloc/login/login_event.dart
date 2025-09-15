part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  final LoginParam? param;

  const LoginEvent({this.param});

  @override
  List<Object?> get props => [param];
}

class GetLogin extends LoginEvent {
  const GetLogin({LoginParam? loginParam}) : super(param: loginParam);
}
