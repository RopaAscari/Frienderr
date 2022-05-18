import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class CreateQuickUseCase extends UseCase<bool, CreateQuicksParams> {
  CreateQuickUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, bool>> call(CreateQuicksParams params) {
    return repository.createQuick(caption: params.caption, file: params.file);
  }
}

class CreateQuicksParams {
  final String caption;
  final File file;

  CreateQuicksParams(this.file, this.caption);
}
