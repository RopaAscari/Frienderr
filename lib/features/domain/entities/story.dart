import 'dart:convert';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';

class StoryDTO {
  String id;
  UserDTO user;
  int dateUpdated;
  bool isPersitent;
  List<StoryContentDTO> content;
  StoryDTO({
    required this.id,
    required this.user,
    required this.content,
    required this.isPersitent,
    required this.dateUpdated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'isPersitent': isPersitent,
      'dateUpdated': dateUpdated,
      'content': content.map((x) => x.toJson()).toList(),
    };
  }

  factory StoryDTO.fromJson(Map<String, dynamic> map) {
    return StoryDTO(
      id: map['id'] ?? '',
      user: UserDTO.fromJson(map['user']),
      isPersitent: map['isPersitent'] ?? false,
      dateUpdated: map['dateUpdated']?.toInt() ?? 0,
      content: List<StoryContentDTO>.from(
          map['content']?.map((x) => StoryContentDTO.fromJson(x))),
    );
  }
}

class StoryContentDTO {
  String id;
  int views;
  int reactions;
  bool? isViewed;
  int dateCreated;
  StoryMediaDTO media;
  StoryContentDTO({
    this.isViewed,
    required this.id,
    required this.views,
    required this.media,
    required this.reactions,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'views': views,
      'reactions': reactions,
      'media': media.toJson(),
      'dateCreated': dateCreated,
    };
  }

  factory StoryContentDTO.fromJson(Map<String, dynamic> map) {
    return StoryContentDTO(
      id: map['id'] ?? '',
      views: map['views'] ?? 0,
      reactions: map['likes'] ?? 0,
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      media: StoryMediaDTO.fromJson(map['media']),
    );
  }
}

class StoryMediaDTO {
  final String url;
  final String type;
  final StoryMetadataDTO metadata;
  StoryMediaDTO({
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

  factory StoryMediaDTO.fromJson(Map<String, dynamic> map) {
    return StoryMediaDTO(
      url: map['url'] ?? '',
      type: map['type'] ?? '',
      metadata: StoryMetadataDTO.fromJson(map['metadata']),
    );
  }
}

class StoryMetadataDTO {
  final int? duration;
  final String? thumbnail;
  StoryMetadataDTO({
    this.duration,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'thumbnail': thumbnail,
    };
  }

  factory StoryMetadataDTO.fromJson(Map<String, dynamic> map) {
    return StoryMetadataDTO(
      duration: map['duration']?.toInt(),
      thumbnail: map['thumbnail'],
    );
  }
}

class UserStory {
  Story? story;
  bool doesUserHaveStories;
  UserStory({
    required this.story,
    required this.doesUserHaveStories,
  });
}

class StoryResponse {
  UserStory userStory;
  List<Story> stories;
  StoryResponse({
    required this.stories,
    required this.userStory,
  });
}
