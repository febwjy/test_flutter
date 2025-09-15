import 'package:test_flutter/core/data/model/login.dart';
import 'package:test_flutter/core/data/model/user.dart';
import 'package:test_flutter/core/domain/usecase/login_usecase.dart';
import 'package:test_flutter/core/utils/data_state.dart';

abstract class ApiRepository {
    Future<DataState<Login>> login(LoginParam params);
    Future<DataState<ListUser>> getUser();
}