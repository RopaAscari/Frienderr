import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@lazySingleton
class UpdateCoverPhotoUseCase extends UseCase<String, UpdateCoverPhotoParams> {
  UpdateCoverPhotoUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, String>> call(UpdateCoverPhotoParams params) {
    return repository.updateCoverPhoto(file: params.file, uid: params.uid);
  }
}

class UpdateCoverPhotoParams {
  final File file;
  final String uid;
  UpdateCoverPhotoParams({
    required this.file,
    required this.uid,
  });
}
