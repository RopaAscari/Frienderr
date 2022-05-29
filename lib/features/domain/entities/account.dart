import 'dart:convert';

import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/user.dart';

class Account {
  final UserEntity user;
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

  Account copyWith({
    UserEntity? user,
    List<String>? followers,
    List<String>? following,
    List<PostEntity>? posts,
    List<QuickEntity>? snaps,
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
      user: UserEntity.fromJson(map['user']),
      followers: List<String>.from(map['followers']),
      following: List<String>.from(map['following']),
      posts: List<PostEntity>.from(
          map['posts']?.map((x) => PostEntity.fromJson(x))),
      snaps: List<QuickEntity>.from(
          map['snaps']?.map((x) => QuickEntity.fromJson(x))),
    );
  }
}
