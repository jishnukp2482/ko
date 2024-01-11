import 'package:ko/data/remote/modals/request/loginRequestModal.dart';
import 'package:ko/data/remote/modals/response/cartSaveResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateCounterResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateWaitersResponseModal.dart';
import 'package:ko/data/remote/modals/response/loginresponseModal.dart';

import '../remote/modals/request/cartsaveRequestModal.dart';
import '../remote/modals/request/validateMemberRequestModal.dart';
import '../remote/modals/response/kotItemsResponseModal.dart';
import '../remote/modals/response/validateMemberResponseModal.dart';

abstract class AppRepository {
  Future<LoginResponseModal> login(LoginRequestModal requestModal);
  Future<LocateCounterResponseModal> counter();
  Future<LocateWaitersResponseModal> waiters();
  Future<ValidateMemberResponseModal> validateMember(
      ValidateMemberRequestModal requestModal);
  Future<KotItemsResponseModal> kotItems();
  Future<CartSaveResponseModal> cartSave(CartSaveRequestModal requestModal);
}
