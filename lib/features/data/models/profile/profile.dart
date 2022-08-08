import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required UserModel user,
    @Default(0) int following,
    @Default(0) int followers,
    @Default(0) int reactions,
    @Default([]) List<Post> posts,
    @Default([]) List<Snap> snaps,
    @Default(false) bool isFollowing,
    @Default([]) List<UserModel> followersList,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
