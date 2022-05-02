import 'dart:convert';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';

class StoryEntity {
  final String id;
  final dynamic user;
  final int dateUpdated;
  final List<StoryContentEntity> content;
  StoryEntity({
    required this.id,
    required this.user,
    required this.content,
    required this.dateUpdated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'dateUpdated': dateUpdated,
      'content': content.map((x) => x.toJson()).toList(),
    };
  }

  factory StoryEntity.fromJson(Map<String, dynamic> map) {
    return StoryEntity(
      id: map['id'] ?? '',
      user: UserEntity.fromJson(map['user']),
      dateUpdated: map['dateUpdated']?.toInt() ?? 0,
      content: List<StoryContentEntity>.from(
          map['content']?.map((x) => StoryContentEntity.fromJson(x))),
    );
  }
}

class StoryContentEntity {
  final String id;
  final int dateCreated;
  final List<String> views;
  final List<String> likes;
  final StoryMediaEntity media;
  StoryContentEntity({
    required this.id,
    required this.views,
    required this.likes,
    required this.media,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'views': views,
      'likes': likes,
      'media': media.toJson(),
      'dateCreated': dateCreated,
    };
  }

  factory StoryContentEntity.fromJson(Map<String, dynamic> map) {
    return StoryContentEntity(
      id: map['id'] ?? '',
      views: List<String>.from(map['views'] ?? []),
      likes: List<String>.from(map['likes'] ?? []),
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      media: StoryMediaEntity.fromJson(map['media']),
    );
  }
}

class StoryMediaEntity {
  final String url;
  final String type;
  final StoryMetadata metadata;
  StoryMediaEntity({
    required this.url,
    required this.type,
    required this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
      'metadata': metadata.toJson(),
    };
  }

  factory StoryMediaEntity.fromJson(Map<String, dynamic> map) {
    return StoryMediaEntity(
      url: map['url'] ?? '',
      type: map['type'] ?? '',
      metadata: StoryMetadata.fromJson(map['metadata']),
    );
  }
}

class StoryMetadata {
  final int? duration;
  final String? thumbnail;
  StoryMetadata({
    this.duration,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'thumbnail': thumbnail,
    };
  }

  factory StoryMetadata.fromJson(Map<String, dynamic> map) {
    return StoryMetadata(
      duration: map['duration']?.toInt(),
      thumbnail: map['thumbnail'],
    );
  }
}

class UserStory {
  StoryModel? story;
  bool doesUserHaveStories;
  UserStory({
    required this.story,
    required this.doesUserHaveStories,
  });
}

class StoryResponse {
  UserStory userStory;
  List<StoryModel> stories;
  StoryResponse({
    required this.stories,
    required this.userStory,
  });
}
