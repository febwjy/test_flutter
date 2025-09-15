import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  final String? token;

  Login({
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
