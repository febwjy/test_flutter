import 'package:test_flutter/core/data/model/user.dart';
import 'package:test_flutter/core/domain/repository/api_repository.dart';
import 'package:test_flutter/core/utils/data_state.dart';
import 'package:test_flutter/core/utils/usecase.dart';

class UserUseCase implements UseCase<DataState<ListUser>, void> {
  final ApiRepository apiRepository;

  UserUseCase(this.apiRepository);

  @override
  Future<DataState<ListUser>> call({void params}) {
    return apiRepository.getUser();
  }
}
