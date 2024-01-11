// To parse this JSON data, do
//
//     final validateMemberResponseModal = validateMemberResponseModalFromJson(jsonString);

import 'dart:convert';

ValidateMemberResponseModal validateMemberResponseModalFromJson(String str) =>
    ValidateMemberResponseModal.fromJson(json.decode(str));

String validateMemberResponseModalToJson(ValidateMemberResponseModal data) =>
    json.encode(data.toJson());

class ValidateMemberResponseModal {
  int status;
  String message;
  List<validateMemberDatum> data;

  ValidateMemberResponseModal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ValidateMemberResponseModal.fromJson(Map<String, dynamic> json) =>
      ValidateMemberResponseModal(
        status: json["status"],
        message: json["message"],
        data: List<validateMemberDatum>.from(
            json["data"].map((x) => validateMemberDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class validateMemberDatum {
  String memberType;
  String bioCardNo;
  String memberNo;
  String memberName;
  int memberBalance;

  validateMemberDatum({
    required this.memberType,
    required this.bioCardNo,
    required this.memberNo,
    required this.memberName,
    required this.memberBalance,
  });

  factory validateMemberDatum.fromJson(Map<String, dynamic> json) =>
      validateMemberDatum(
        memberType: json["MemberType"],
        bioCardNo: json["BioCardNo"],
        memberNo: json["MemberNo"],
        memberName: json["MemberName"],
        memberBalance: json["MemberBalance"],
      );

  Map<String, dynamic> toJson() => {
        "MemberType": memberType,
        "BioCardNo": bioCardNo,
        "MemberNo": memberNo,
        "MemberName": memberName,
        "MemberBalance": memberBalance,
      };
}
