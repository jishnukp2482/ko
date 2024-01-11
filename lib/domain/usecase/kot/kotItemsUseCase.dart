
import 'package:ko/core/usecase.dart';
import 'package:ko/data/repository/app_repository.dart';

import '../../../data/remote/modals/response/kotItemsResponseModal.dart';

class KotItemsUseCase extends UseCase<KotItemsResponseModal, NoParams> {
  final AppRepository appRepository;

  KotItemsUseCase(this.appRepository);

  @override
  Future<KotItemsResponseModal> call(NoParams params) {
    return appRepository.kotItems();
  }
}
