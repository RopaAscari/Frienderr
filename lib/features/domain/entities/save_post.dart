import 'dart:convert';

import 'package:frienderr/core/enums/enums.dart';

class SavedPostDTO {
  PostType type;
  String postId;
  String userId;
  SavedPostDTO({
    required this.type,
    required this.postId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'type': serializeEnumType(type),
    };
  }

  factory SavedPostDTO.fromJson(Map<String, dynamic> map) {
    return SavedPostDTO(
      postId: map['postId'] ?? '',
      userId: map['userId'] ?? '',
      type: parseEnumType(map['type']),
    );
  }
}

PostType parseEnumType(String type) {
  switch (type) {
    case 'post':
      return PostType.post;

    case 'story':
      return PostType.story;

    case 'quick':
      return PostType.quick;
    default:
      throw Error();
  }
}

String serializeEnumType(PostType type) {
  switch (type) {
    case PostType.post:
      return PostType.post.name;

    case PostType.story:
      return PostType.story.name;

    case PostType.quick:
      return PostType.quick.name;
    default:
      throw Error();
  }
}
