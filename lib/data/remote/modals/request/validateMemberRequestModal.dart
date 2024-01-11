// To parse this JSON data, do
//
//     final validateMemberRequestModal = validateMemberRequestModalFromJson(jsonString);

import 'dart:convert';

ValidateMemberRequestModal validateMemberRequestModalFromJson(String str) =>
    ValidateMemberRequestModal.fromJson(json.decode(str));

String validateMemberRequestModalToJson(ValidateMemberRequestModal data) =>
    json.encode(data.toJson());

class ValidateMemberRequestModal {
  String memberType;
  String no;

  ValidateMemberRequestModal({
    required this.memberType,
    required this.no,
  });

  factory ValidateMemberRequestModal.fromJson(Map<String, dynamic> json) =>
      ValidateMemberRequestModal(
        memberType: json["MemberType"],
        no: json["No"],
      );

  Map<String, dynamic> toJson() => {
        "MemberType": memberType,
        "No": no,
      };
}
