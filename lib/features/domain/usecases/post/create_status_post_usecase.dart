import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class CreateStatusPostUseCase extends UseCase<bool, CreateStatusPostParams> {
  CreateStatusPostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(CreateStatusPostParams params) {
    return repository.createStatusPost(status: params.status);
  }
}

class CreateStatusPostParams {
  final String status;

  CreateStatusPostParams({
    required this.status,
  });
}
