import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/entities/user.dart';

abstract class IFollowersRepository {
  Future<Either<Failure, List<String>>> getFollowers(String userId);
}
