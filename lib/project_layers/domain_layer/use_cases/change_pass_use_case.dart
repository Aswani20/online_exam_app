
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../entities/change_pass_response_entity.dart';
import '../repositories/profile_repo.dart';

@injectable
class ChangePassUseCase{
  ProfileRepo _repo;
  ChangePassUseCase(this._repo);

  Future<Either<Failures, ChangePassResponseEntity>> invoke({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    return await _repo.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        rePassword: rePassword
    );
  }
}