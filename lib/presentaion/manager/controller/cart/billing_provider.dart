import 'package:flutter/material.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/domain/entities/bill/billingModal.dart';

import '../../../../data/remote/modals/request/validateMemberRequestModal.dart';
import '../../../../data/remote/modals/response/validateMemberResponseModal.dart';
import '../../../../domain/usecase/memberOrGuest/validateMemberUseCase.dart';

class BillingProvider extends ChangeNotifier {
  final ValidateMemberUseCase validateMemberUseCase;
  BillingProvider(this.validateMemberUseCase);
  String memeberOrGuestcontroller = "";
  String nameCntlr = "";
  bool isMemberSelected = false;
  bool isGuestSelected = false;
  final biocardNoTexteditingCntlr = TextEditingController();
  final memberNoTextedTexteditingCntlr = TextEditingController();

  memberSelected() {
    if (memeberOrGuestcontroller == "Member") {
      isMemberSelected = true;
      isGuestSelected = false;
    } else if (memeberOrGuestcontroller == "Guest") {
      isGuestSelected = true;
      isMemberSelected = false;
    }
    notifyListeners();
  }

  List<BillingItemModal> billingitemlist = [
    BillingItemModal("1", "item1", "10"),
    BillingItemModal("2", "item2", "100"),
    BillingItemModal("3", "item3", "150"),
    BillingItemModal("4", "item4", "250"),
  ];

  ResponseClassify<ValidateMemberResponseModal> validateMemberState =
      ResponseClassify<ValidateMemberResponseModal>.error("");
  ResponseClassify<ValidateMemberResponseModal>
      get validateMemberStateResponse => validateMemberState;
  final validateMemberList = <validateMemberDatum>[];
  getValidateMember() async {
    validateMemberState = ResponseClassify.loading();
    notifyListeners();
    try {
      validateMemberState = ResponseClassify.completed(
          await validateMemberUseCase.call(ValidateMemberRequestModal(
              memberType: memeberOrGuestcontroller,
              no: isMemberSelected
                  ? memberNoTextedTexteditingCntlr.text
                  : biocardNoTexteditingCntlr.text)));
      validateMemberList.clear();
      validateMemberList.addAll(validateMemberState.data!.data);
      memberNoTextedTexteditingCntlr.text = validateMemberList.first.memberNo;
      biocardNoTexteditingCntlr.text = validateMemberList.first.bioCardNo;
      // balanceCntlr = validateMemberList.first.memberBalance.toString();
      nameCntlr = validateMemberList.first.memberName;

      debugPrint("member List==${validateMemberList.length}");
      debugPrint("getvalidatemember ==${validateMemberState.data!.data.first}");
      notifyListeners();
    } catch (e) {
      validateMemberState = ResponseClassify.error("$e");
      notifyListeners();
    }
    notifyListeners();
  }
}
