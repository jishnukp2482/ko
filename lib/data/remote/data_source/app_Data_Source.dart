
import 'package:ko/core/api_provider.dart';
import 'package:ko/data/remote/modals/request/cartsaveRequestModal.dart';
import 'package:ko/data/remote/modals/request/loginRequestModal.dart';
import 'package:ko/data/remote/modals/request/validateMemberRequestModal.dart';
import 'package:ko/data/remote/modals/response/cartSaveResponseModal.dart';
import 'package:ko/data/remote/modals/response/locateWaitersResponseModal.dart';

import '../modals/response/kotItemsResponseModal.dart';
import '../modals/response/locateCounterResponseModal.dart';
import '../modals/response/loginresponseModal.dart';
import '../modals/response/validateMemberResponseModal.dart';
import '../remote_routes/app_remote_routes.dart';

abstract class AppDataSource {
  Future<LoginResponseModal> login(LoginRequestModal requestModal);
  Future<LocateCounterResponseModal> counter();
  Future<LocateWaitersResponseModal> waiters();
  Future<ValidateMemberResponseModal> validateMember(
      ValidateMemberRequestModal requestModal);
  Future<KotItemsResponseModal> kotItems();
  Future<CartSaveResponseModal> cartSave(CartSaveRequestModal requestModal);
}

class AppDataSourceImpl extends AppDataSource {
  final ApiProvider apiProvider;

  AppDataSourceImpl(this.apiProvider);
//login
  @override
  Future<LoginResponseModal> login(LoginRequestModal requestModal) async {
    return LoginResponseModal.fromJson(
        await apiProvider.post(AppRemoteRoutes.login, requestModal));
  }

  //counter
  @override
  Future<LocateCounterResponseModal> counter() async {
    return LocateCounterResponseModal.fromJson(
        await apiProvider.get(AppRemoteRoutes.locateCounters));
  }

  @override
  Future<LocateWaitersResponseModal> waiters() async {
    return LocateWaitersResponseModal.fromJson(
        await apiProvider.get(AppRemoteRoutes.locatewaiters));
  }

  @override
  Future<ValidateMemberResponseModal> validateMember(
      ValidateMemberRequestModal requestModal) async {
    return ValidateMemberResponseModal.fromJson(
        await apiProvider.post(AppRemoteRoutes.validateMember, requestModal));
  }

  @override
  Future<KotItemsResponseModal> kotItems() async {
    return KotItemsResponseModal.fromJson(
        await apiProvider.get(AppRemoteRoutes.getItems));
  }

  @override
  Future<CartSaveResponseModal> cartSave(
      CartSaveRequestModal requestModal) async {
    return CartSaveResponseModal.fromJson(
        await apiProvider.post(AppRemoteRoutes.cartSave, requestModal));
  }
}
