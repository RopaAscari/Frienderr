import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuickEntity {
  final String id;
  final String url;
  final String audio;
  final dynamic user;
  final String caption;
  final int dateCreated;
  final int commentCount;
  final String thumbnail;
  final List<String> likes;
  final List<String> shares;
  QuickEntity({
    required this.id,
    required this.url,
    required this.audio,
    required this.user,
    required this.caption,
    required this.dateCreated,
    required this.commentCount,
    required this.thumbnail,
    required this.likes,
    required this.shares,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'audio': audio,
      'likes': likes,
      'shares': shares,
      'caption': caption,
      'user': user.toJson(),
      'thumbnail': thumbnail,
      'dateCreated': dateCreated,
      'commentCount': commentCount,
    };
  }

  factory QuickEntity.fromJson(Map<String, dynamic> map) {
    return QuickEntity(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      audio: map['audio'] ?? '',
      user: map['user'] ?? null,
      caption: map['caption'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      commentCount: map['commentCount']?.toInt() ?? 0,
      likes: List<String>.from(map['likes'] ?? []),
      shares: List<String>.from(map['shares'] ?? []),
    );
  }

  QuickEntity copyWith({
    String? id,
    String? url,
    String? audio,
    dynamic? user,
    String? caption,
    int? dateCreated,
    int? commentCount,
    String? thumbnail,
    List<String>? likes,
    List<String>? shares,
  }) {
    return QuickEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      audio: audio ?? this.audio,
      user: user ?? this.user,
      caption: caption ?? this.caption,
      dateCreated: dateCreated ?? this.dateCreated,
      commentCount: commentCount ?? this.commentCount,
      thumbnail: thumbnail ?? this.thumbnail,
      likes: likes ?? this.likes,
      shares: shares ?? this.shares,
    );
  }
}
