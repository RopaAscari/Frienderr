import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';

class Account {
  final UserModel user;
  final List<String> followers;
  final List<String> following;
  final List<PostEntity> posts;
  final List<QuickEntity> snaps;
  Account({
    required this.user,
    required this.followers,
    required this.following,
    required this.posts,
    required this.snaps,
  });
}
