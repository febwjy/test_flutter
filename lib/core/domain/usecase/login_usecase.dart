import 'dart:convert';

import 'package:test_flutter/core/data/model/login.dart';
import 'package:test_flutter/core/domain/repository/api_repository.dart';
import 'package:test_flutter/core/utils/data_state.dart';
import 'package:test_flutter/core/utils/usecase.dart';

class LoginUseCase
    implements
        UseCase<DataState<Login>, LoginParam> {
  final ApiRepository apiRepository;

  LoginUseCase(this.apiRepository);

  @override
  Future<DataState<Login>> call(
      {LoginParam? params}) {
    return apiRepository.login(params!);
  }
}

class LoginParam {
  String? email;
  String? password;

  LoginParam({
    this.email = "",
    this.password = "",
  });

  factory LoginParam.fromRawJson(String str) =>
      LoginParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginParam.fromJson(Map<String, dynamic> json) =>
      LoginParam(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
