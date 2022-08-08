import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@lazySingleton
class UpdateProfilePhotoUseCase
    extends UseCase<String, UpdateProfilePhotoParams> {
  UpdateProfilePhotoUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, String>> call(UpdateProfilePhotoParams params) {
    return repository.updateProfilePhoto(file: params.file, uid: params.uid);
  }
}

class UpdateProfilePhotoParams {
  final File file;
  final String uid;
  UpdateProfilePhotoParams({
    required this.file,
    required this.uid,
  });
}
