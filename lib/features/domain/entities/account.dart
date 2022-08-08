import 'dart:convert';

import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/user.dart';

class Account {
  final UserDTO user;
  final List<String> followers;
  final List<String> following;
  final List<PostDTO> posts;
  final List<SnapDTO> snaps;
  Account({
    required this.user,
    required this.followers,
    required this.following,
    required this.posts,
    required this.snaps,
  });

  Account copyWith({
    UserDTO? user,
    List<String>? followers,
    List<String>? following,
    List<PostDTO>? posts,
    List<SnapDTO>? snaps,
  }) {
    return Account(
      user: user ?? this.user,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      posts: posts ?? this.posts,
      snaps: snaps ?? this.snaps,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'followers': followers,
      'following': following,
      'posts': posts.map((x) => x.toJson()).toList(),
      'snaps': snaps.map((x) => x.toJson()).toList(),
    };
  }

  factory Account.fromJson(Map<String, dynamic> map) {
    return Account(
      user: UserDTO.fromJson(map['user']),
      followers: List<String>.from(map['followers']),
      following: List<String>.from(map['following']),
      posts: List<PostDTO>.from(map['posts']?.map((x) => PostDTO.fromJson(x))),
      snaps: List<SnapDTO>.from(map['snaps']?.map((x) => SnapDTO.fromJson(x))),
    );
  }
}
