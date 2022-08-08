import 'package:frienderr/features/data/models/user/user_model.dart';

class StoryViewDTO {
  String userId;
  int dateCreated;
  String contentId;

  StoryViewDTO({
    required this.userId,
    required this.contentId,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'contentId': contentId,
      'dateCreated': dateCreated,
    };
  }

  factory StoryViewDTO.fromJson(Map<String, dynamic> map) {
    return StoryViewDTO(
      userId: map['userId'] ?? '',
      contentId: map['contentId'] ?? '',
      dateCreated: map['dateCreated'] ?? 0,
    );
  }
}

class StoryViewResponse {
  final List<UserModel> users;
  final int previousStoryViewerTimestamp;
  StoryViewResponse({
    required this.users,
    required this.previousStoryViewerTimestamp,
  });
}
