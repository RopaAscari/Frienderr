import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

abstract class IStoryRepository {
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateStoryStream(String userId);
}
