
import 'package:ko/data/remote/data_source/app_Data_Source.dart';
import 'package:ko/data/remote/modals/request/loginRequestModal.dart';
import 'package:ko/data/remote/modals/request/validateMemberRequestModal.dart';
import 'package:ko/data/remote/modals/response/kotItemsResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateCounterResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateWaitersResponseModal.dart';
import 'package:ko/data/remote/modals/response/loginresponseModal.dart';
import 'package:ko/data/remote/modals/response/validateMemberResponseModal.dart';
import 'package:ko/data/repository/app_repository.dart';

import '../../data/remote/modals/request/cartsaveRequestModal.dart';
import '../../data/remote/modals/response/cartSaveResponseModal.dart';

class AppRepositoryImpl extends AppRepository {
  final AppDataSource appDataSource;

  AppRepositoryImpl(this.appDataSource);

  @override
  Future<LoginResponseModal> login(LoginRequestModal requestModal) {
    return appDataSource.login(requestModal);
  }

  @override
  Future<LocateCounterResponseModal> counter() {
    return appDataSource.counter();
  }

  @override
  Future<LocateWaitersResponseModal> waiters() {
    return appDataSource.waiters();
  }

  @override
  Future<ValidateMemberResponseModal> validateMember(
      ValidateMemberRequestModal requestModal) {
    return appDataSource.validateMember(requestModal);
  }

  @override
  Future<KotItemsResponseModal> kotItems() {
    return appDataSource.kotItems();
  }

  @override
  Future<CartSaveResponseModal> cartSave(CartSaveRequestModal requestModal) {
    return appDataSource.cartSave(requestModal);
  }
}
