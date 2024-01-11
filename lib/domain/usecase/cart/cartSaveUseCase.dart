
import 'package:ko/core/usecase.dart';
import 'package:ko/data/remote/modals/request/cartsaveRequestModal.dart';
import 'package:ko/data/remote/modals/response/cartSaveResponseModal.dart';
import 'package:ko/data/repository/app_repository.dart';

class CartSaveUseCase
    extends UseCase<CartSaveResponseModal, CartSaveRequestModal> {
  final AppRepository appRepository;

  CartSaveUseCase(this.appRepository);

  @override
  Future<CartSaveResponseModal> call(CartSaveRequestModal params) {
    return appRepository.cartSave(params);
  }
}
