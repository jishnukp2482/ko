
import 'package:ko/core/usecase.dart';
import 'package:ko/data/remote/modals/response/locateCounterResponseModal.dart';
import 'package:ko/data/repository/app_repository.dart';

class LocateCounterUseCase
    extends UseCase<LocateCounterResponseModal, NoParams> {
  final AppRepository appRepository;

  LocateCounterUseCase(this.appRepository);

  @override
  Future<LocateCounterResponseModal> call(NoParams params) {
    final data = appRepository.counter();
    print("locate counter usecase==$data");
    return data;
  }
}
