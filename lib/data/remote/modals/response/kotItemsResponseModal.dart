// To parse this JSON data, do
//
//     final kotItemsResponseModal = kotItemsResponseModalFromJson(jsonString);

import 'dart:convert';

KotItemsResponseModal kotItemsResponseModalFromJson(String str) =>
    KotItemsResponseModal.fromJson(json.decode(str));

String kotItemsResponseModalToJson(KotItemsResponseModal data) =>
    json.encode(data.toJson());

class KotItemsResponseModal {
  int status;
  String message;
  List<ItemsDatum> data;

  KotItemsResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory KotItemsResponseModal.fromJson(Map<String, dynamic> json) =>
      KotItemsResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<ItemsDatum>.from(
            json["data"].map((x) => ItemsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ItemsDatum {
  MainGroup mainGroup;
  SubGroup subGroup;
  String catgCode;
  String itemCode;
  String itemName;
  double itemRate;
  OrderType orderType;
  bool rateEditable;

  ItemsDatum({
    required this.mainGroup,
    required this.subGroup,
    required this.catgCode,
    required this.itemCode,
    required this.itemName,
    required this.itemRate,
    required this.orderType,
    required this.rateEditable,
  });

  factory ItemsDatum.fromJson(Map<String, dynamic> json) => ItemsDatum(
        mainGroup: mainGroupValues.map[json["MainGroup"]]!,
        subGroup: subGroupValues.map[json["SubGroup"]]!,
        catgCode: json["CatgCode"],
        itemCode: json["ItemCode"],
        itemName: json["ItemName"],
        itemRate: json["ItemRate"]?.toDouble(),
        orderType: orderTypeValues.map[json["OrderType"]]!,
        rateEditable: json["RateEditable"],
      );

  Map<String, dynamic> toJson() => {
        "MainGroup": mainGroupValues.reverse[mainGroup],
        "SubGroup": subGroupValues.reverse[subGroup],
        "CatgCode": catgCode,
        "ItemCode": itemCode,
        "ItemName": itemName,
        "ItemRate": itemRate,
        "OrderType": orderTypeValues.reverse[orderType],
        "RateEditable": rateEditable,
      };
}

enum MainGroup { FOOD, LIQUOR }

final mainGroupValues =
    EnumValues({"FOOD": MainGroup.FOOD, "LIQUOR": MainGroup.LIQUOR});

enum OrderType { FULL }

final orderTypeValues = EnumValues({"Full": OrderType.FULL});

enum SubGroup {
  BEER,
  BRANDY,
  CIGARATE,
  CORKAGE,
  FOOD_SALES,
  GIN,
  GUEST_FEE,
  MINARAL_WATER,
  PURCHASE,
  RUM,
  SODA,
  SOFTDRINK,
  TEQUILA,
  VODKA,
  WHISKY,
  WINE
}

final subGroupValues = EnumValues({
  "BEER": SubGroup.BEER,
  "BRANDY": SubGroup.BRANDY,
  "CIGARATE": SubGroup.CIGARATE,
  "CORKAGE": SubGroup.CORKAGE,
  "FOOD SALES": SubGroup.FOOD_SALES,
  "GIN": SubGroup.GIN,
  "GUEST FEE": SubGroup.GUEST_FEE,
  "MINARAL WATER": SubGroup.MINARAL_WATER,
  "PURCHASE": SubGroup.PURCHASE,
  "RUM": SubGroup.RUM,
  "SODA": SubGroup.SODA,
  "SOFTDRINK": SubGroup.SOFTDRINK,
  "TEQUILA": SubGroup.TEQUILA,
  "VODKA": SubGroup.VODKA,
  "WHISKY": SubGroup.WHISKY,
  "WINE": SubGroup.WINE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
