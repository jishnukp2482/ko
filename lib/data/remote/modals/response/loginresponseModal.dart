// To parse this JSON data, do
//
//     final loginResponseModal = loginResponseModalFromJson(jsonString);

import 'dart:convert';

LoginResponseModal loginResponseModalFromJson(String str) =>
    LoginResponseModal.fromJson(json.decode(str));

String loginResponseModalToJson(LoginResponseModal data) =>
    json.encode(data.toJson());

class LoginResponseModal {
  int status;
  String message;
  List<Datum> data;

  LoginResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModal.fromJson(Map<String, dynamic> json) =>
      LoginResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String userName;

  Datum({
    required this.userName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
      };
}
