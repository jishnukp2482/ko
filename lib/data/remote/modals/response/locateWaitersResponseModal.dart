// To parse this JSON data, do
//
//     final locateWaitersResponseModal = locateWaitersResponseModalFromJson(jsonString);

import 'dart:convert';

LocateWaitersResponseModal locateWaitersResponseModalFromJson(String str) =>
    LocateWaitersResponseModal.fromJson(json.decode(str));

String locateWaitersResponseModalToJson(LocateWaitersResponseModal data) =>
    json.encode(data.toJson());

class LocateWaitersResponseModal {
  int status;
  String message;
  List<WaitersDatum> data;

  LocateWaitersResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LocateWaitersResponseModal.fromJson(Map<String, dynamic> json) =>
      LocateWaitersResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<WaitersDatum>.from(
            json["data"].map((x) => WaitersDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaitersDatum {
  String waiterCode;
  String waiterName;

  WaitersDatum({
    required this.waiterCode,
    required this.waiterName,
  });

  factory WaitersDatum.fromJson(Map<String, dynamic> json) => WaitersDatum(
        waiterCode: json["WaiterCode"],
        waiterName: json["WaiterName"],
      );

  Map<String, dynamic> toJson() => {
        "WaiterCode": waiterCode,
        "WaiterName": waiterName,
      };
}
