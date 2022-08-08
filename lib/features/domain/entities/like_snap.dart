import 'dart:convert';

class SnapLikeDTO {
  String userId;
  String snapId;
  SnapLikeDTO({
    required this.userId,
    required this.snapId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'snapId': snapId,
    };
  }

  factory SnapLikeDTO.fromJson(Map<String, dynamic> map) {
    return SnapLikeDTO(
      userId: map['userId'] ?? '',
      snapId: map['snapId'] ?? '',
    );
  }
}
