
import 'package:flutter/material.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/core/usecase.dart';
import 'package:ko/data/remote/modals/request/validateMemberRequestModal.dart';
import 'package:ko/data/remote/modals/response/locateCounterResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateWaitersResponseModal.dart';
import 'package:ko/data/remote/modals/response/validateMemberResponseModal.dart';
import 'package:ko/domain/usecase/memberOrGuest/locateCounterUseCase.dart';
import 'package:ko/domain/usecase/memberOrGuest/locateWaitersUseCase.dart';
import 'package:ko/domain/usecase/memberOrGuest/validateMemberUseCase.dart';

class MemberGuestProvider extends ChangeNotifier {
  final LocateCounterUseCase locateCounterUseCase;
  final LocateWaiterUseCase locateWaiterUseCase;
  final ValidateMemberUseCase validateMemberUseCase;
  MemberGuestProvider(this.locateCounterUseCase, this.locateWaiterUseCase,
      this.validateMemberUseCase);
  String counterNocontroller = "";
  String memeberOrGuestcontroller = "";
  String groupcontroller = "";
  String ratecontroller = "";
  String nameCntlr = "";
  String balanceCntlr = "";
  String waiterController = "";
  String get waitercontroller => waiterController;
  final tablecontroller = TextEditingController();
  bool isMemberSelected = false;
  bool isGuestSelected = false;
//  bool get guestSelected => isGuestSelected;
  final biocardNoTexteditingCntlr = TextEditingController();

  final memberNoTextedTexteditingCntlr = TextEditingController();
  final remarkcontroller = TextEditingController();
  String waiterNameController = "";

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

  final counterList = <CounterDatum>[];
  ResponseClassify<LocateCounterResponseModal> locateCounterState =
      ResponseClassify<LocateCounterResponseModal>.error("");
  ResponseClassify<LocateCounterResponseModal> get locateCounterStateResponse =>
      locateCounterState;
  getCounters() async {
    locateCounterState = ResponseClassify.loading();
    notifyListeners();
    try {
      locateCounterState = ResponseClassify.completed(
          await locateCounterUseCase.call(NoParams()));
      counterList.clear();
      counterList.addAll(locateCounterState.data!.data);
      debugPrint("Counter List==${counterList.length}");
      debugPrint("getcounters ==${locateCounterState.data!.data.first}");
      notifyListeners();
    } catch (e) {
      locateCounterState = ResponseClassify.error("$e");
      notifyListeners();
    }
    notifyListeners();
  }

  final waiterList = <WaitersDatum>[];
  ResponseClassify<LocateWaitersResponseModal> locateWaiterState =
      ResponseClassify<LocateWaitersResponseModal>.error("");
  ResponseClassify<LocateWaitersResponseModal> get locateWaiterStateResponse =>
      locateWaiterState;
  getWaiters() async {
    locateWaiterState = ResponseClassify.loading();
    notifyListeners();
    try {
      locateWaiterState = ResponseClassify.completed(
          await locateWaiterUseCase.call(NoParams()));
      waiterList.clear();
      waiterList.addAll(locateWaiterState.data!.data);
      debugPrint("waiter List==${waiterList.length}");
      debugPrint("getwaiters ==${locateWaiterState.data!.data.first}");
      notifyListeners();
    } catch (e) {
      locateWaiterState = ResponseClassify.error("$e");
      notifyListeners();
    }
    notifyListeners();
  }

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
      balanceCntlr = validateMemberList.first.memberBalance.toString();
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
