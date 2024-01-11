
import 'package:ko/core/usecase.dart';
import 'package:ko/data/remote/modals/request/validateMemberRequestModal.dart';
import 'package:ko/data/remote/modals/response/validateMemberResponseModal.dart';
import 'package:ko/data/repository/app_repository.dart';

class ValidateMemberUseCase
    extends UseCase<ValidateMemberResponseModal, ValidateMemberRequestModal> {
  final AppRepository appRepository;

  ValidateMemberUseCase(this.appRepository);

  @override
  Future<ValidateMemberResponseModal> call(ValidateMemberRequestModal params) {
    return appRepository.validateMember(params);
  }
}
