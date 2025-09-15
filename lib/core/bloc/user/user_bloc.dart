import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/core/data/model/user.dart';
import 'package:test_flutter/core/domain/usecase/user_usecase.dart';
import 'package:test_flutter/core/utils/data_state.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc(this.userUseCase) : super(const UserInitial()) {
    on<GetUser>(onGetUser);
  }

  Future<void> onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    final dataState = await userUseCase();
    if (dataState is DataSuccess) {
      emit(UserSuccess(user: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(UserError(error: dataState.error!));
    }
  }
}
