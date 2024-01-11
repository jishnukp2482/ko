// To parse this JSON data, do
//
//     final cartSaveResponseModal = cartSaveResponseModalFromJson(jsonString);

import 'dart:convert';

CartSaveResponseModal cartSaveResponseModalFromJson(String str) =>
    CartSaveResponseModal.fromJson(json.decode(str));

String cartSaveResponseModalToJson(CartSaveResponseModal data) =>
    json.encode(data.toJson());

class CartSaveResponseModal {
  int status;
  String message;
  List<Datum> data;

  CartSaveResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartSaveResponseModal.fromJson(Map<String, dynamic> json) =>
      CartSaveResponseModal(
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
  int kotId;

  Datum({
    required this.kotId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kotId: json["KotID"],
      );

  Map<String, dynamic> toJson() => {
        "KotID": kotId,
      };
}
