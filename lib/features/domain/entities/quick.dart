import 'package:frienderr/features/domain/entities/user.dart';

class SnapDTO {
  int saves;
  String id;
  int likes;
  String url;
  int shares;
  String audio;
  UserDTO user;
  int comments;
  bool? isLiked;
  String caption;
  int dateCreated;
  String thumbnail;
  SnapDTO({
    this.isLiked,
    required this.id,
    required this.url,
    required this.audio,
    required this.user,
    required this.saves,
    required this.likes,
    required this.shares,
    required this.caption,
    required this.comments,
    required this.thumbnail,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'audio': audio,
      'saves': saves,
      'likes': likes,
      'shares': shares,
      'isLiked': isLiked,
      'caption': caption,
      'user': user.toJson(),
      'comments': comments,
      'thumbnail': thumbnail,
      'dateCreated': dateCreated,
    };
  }

  factory SnapDTO.fromJson(Map<String, dynamic> map) {
    return SnapDTO(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      audio: map['audio'] ?? '',
      caption: map['caption'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      thumbnail: map['thumbnail'] ?? '',
      saves: map['saves']?.toInt() ?? 0,
      shares: map['shares']?.toInt() ?? 0,
      user: UserDTO.fromJson(map['user']),
      comments: map['comments']?.toInt() ?? 0,
      dateCreated: map['dateCreated']?.toInt() ?? 0,
    );
  }
}
