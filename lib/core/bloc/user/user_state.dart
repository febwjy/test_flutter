part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final ListUser? data;
  final String? error;
  const UserState({this.data, this.error});

  @override
  List<Object> get props => [data!, error!];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserSuccess extends UserState {
  const UserSuccess({required ListUser user}) : super(data: user);
}

class UserError extends UserState {
  const UserError({required String error}) : super(error: error);
}
