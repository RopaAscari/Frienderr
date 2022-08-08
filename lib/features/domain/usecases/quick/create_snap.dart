import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class CreateSnapUseCase extends UseCase<bool, CreateSnapsParams> {
  CreateSnapUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, bool>> call(CreateSnapsParams params) {
    return repository.createSnap(caption: params.caption, file: params.file);
  }
}

class CreateSnapsParams {
  final String caption;
  final File file;

  CreateSnapsParams(this.file, this.caption);
}
