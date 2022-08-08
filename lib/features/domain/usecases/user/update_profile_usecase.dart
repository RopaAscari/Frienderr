import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/update_profile.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@lazySingleton
class UpdateProfileUseCase extends UseCase<bool, UpdateProfileParams> {
  UpdateProfileUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, bool>> call(UpdateProfileParams params) {
    return repository.updateProfile(
      uid: params.uid,
      profile: params.profile,
    );
  }
}

class UpdateProfileParams {
  final String uid;
  final UpdateProfile profile;

  UpdateProfileParams({
    required this.uid,
    required this.profile,
  });
}
