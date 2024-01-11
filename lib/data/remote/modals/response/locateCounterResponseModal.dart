// To parse this JSON data, do
//
//     final locateCounterResponseModal = locateCounterResponseModalFromJson(jsonString);

import 'dart:convert';

LocateCounterResponseModal locateCounterResponseModalFromJson(String str) =>
    LocateCounterResponseModal.fromJson(json.decode(str));

String locateCounterResponseModalToJson(LocateCounterResponseModal data) =>
    json.encode(data.toJson());

class LocateCounterResponseModal {
  int status;
  String message;
  List<CounterDatum> data;

  LocateCounterResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LocateCounterResponseModal.fromJson(Map<String, dynamic> json) =>
      LocateCounterResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<CounterDatum>.from(
            json["data"].map((x) => CounterDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CounterDatum {
  String counterCode;
  String counterName;

  CounterDatum({
    required this.counterCode,
    required this.counterName,
  });

  factory CounterDatum.fromJson(Map<String, dynamic> json) => CounterDatum(
        counterCode: json["CounterCode"],
        counterName: json["CounterName"],
      );

  Map<String, dynamic> toJson() => {
        "CounterCode": counterCode,
        "CounterName": counterName,
      };
}
