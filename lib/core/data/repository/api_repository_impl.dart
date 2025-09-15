import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_flutter/core/data/model/login.dart';
import 'package:test_flutter/core/data/model/user.dart';
import 'package:test_flutter/core/dio.dart';
import 'package:test_flutter/core/domain/repository/api_repository.dart';
import 'package:test_flutter/core/domain/usecase/login_usecase.dart';
import 'package:test_flutter/core/utils/const.dart';
import 'package:test_flutter/core/utils/data_state.dart';
import 'package:test_flutter/core/utils/error_handler.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<DataState<ListUser>> getUser() async {
    try {
      Response response = await DioClient().getDio().get("$baseUrl/users");

      ListUser listUser = ListUser.fromJson(response.data);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          log("Response API ${jsonEncode(listUser)}");
        }
        return DataSuccess(listUser);
      } else {
        return const DataFailed("Error cannot access data");
      }
    } on DioException catch (e, stacktrace) {
      log("error not catch");
      log(e.toString());
      log(stacktrace.toString());
      return DataFailed(onErrorHandler(e));
    } catch (e, stacktrace) {
      log("error not catch");
      log(e.toString());
      log(stacktrace.toString());
      return const DataFailed("Error tidak dapat akses data");
    }
  }

  @override
  Future<DataState<Login>> login(LoginParam param) async {
    try {
      Response response = await DioClient().getDio().post(
        "$baseUrl/login",
        data: {"email": param.email, "password": param.password},
      );

      Login login = Login.fromJson(response.data);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          log("Response API ${jsonEncode(login)}");
        }
        return DataSuccess(login);
      } else {
        return const DataFailed("Error cannot access data");
      }
    } on DioException catch (e, stacktrace) {
      log("error not catch");
      log(e.toString());
      log(stacktrace.toString());
      return DataFailed(onErrorHandler(e));
    } catch (e, stacktrace) {
      log("error not catch");
      log(e.toString());
      log(stacktrace.toString());
      return const DataFailed("Error tidak dapat akses data");
    }
  }
}
