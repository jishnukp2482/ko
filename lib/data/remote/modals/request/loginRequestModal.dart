// To parse this JSON data, do
//
//     final loginRequestModal = loginRequestModalFromJson(jsonString);

import 'dart:convert';

LoginRequestModal loginRequestModalFromJson(String str) =>
    LoginRequestModal.fromJson(json.decode(str));

String loginRequestModalToJson(LoginRequestModal data) =>
    json.encode(data.toJson());

class LoginRequestModal {
  String userName;
  String password;

  LoginRequestModal({
    required this.userName,
    required this.password,
  });

  factory LoginRequestModal.fromJson(Map<String, dynamic> json) =>
      LoginRequestModal(
        userName: json["UserName"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
      };
}
