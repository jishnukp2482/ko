// To parse this JSON data, do
//
//     final cartSaveRequestModal = cartSaveRequestModalFromJson(jsonString);

import 'dart:convert';

CartSaveRequestModal cartSaveRequestModalFromJson(String str) =>
    CartSaveRequestModal.fromJson(json.decode(str));

String cartSaveRequestModalToJson(CartSaveRequestModal data) =>
    json.encode(data.toJson());

class CartSaveRequestModal {
  String counterCode;
  String memberType;
  String bioCardNo;
  String memberNo;
  String groupName;
  String waiterCode;
  String rateType;
  String remarks;
  String itemsJson;
  String makerId;
  String tableNo;
  String makingTime;

  CartSaveRequestModal({
    required this.counterCode,
    required this.memberType,
    required this.bioCardNo,
    required this.memberNo,
    required this.groupName,
    required this.waiterCode,
    required this.rateType,
    required this.remarks,
    required this.itemsJson,
    required this.makerId,
    required this.tableNo,
    required this.makingTime,
  });

  factory CartSaveRequestModal.fromJson(Map<String, dynamic> json) =>
      CartSaveRequestModal(
        counterCode: json["CounterCode"],
        memberType: json["MemberType"],
        bioCardNo: json["BioCardNo"],
        memberNo: json["MemberNo"],
        groupName: json["GroupName"],
        waiterCode: json["WaiterCode"],
        rateType: json["RateType"],
        remarks: json["Remarks"],
        itemsJson: json["ItemsJSON"],
        makerId: json["MakerID"],
        tableNo: json["TableNo"],
        makingTime: json["MakingTime"],
      );

  Map<String, dynamic> toJson() => {
        "CounterCode": counterCode,
        "MemberType": memberType,
        "BioCardNo": bioCardNo,
        "MemberNo": memberNo,
        "GroupName": groupName,
        "WaiterCode": waiterCode,
        "RateType": rateType,
        "Remarks": remarks,
        "ItemsJSON": itemsJson,
        "MakerID": makerId,
        "TableNo": tableNo,
        "MakingTime": makingTime,
      };
}
