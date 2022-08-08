import 'dart:convert';

class UpdateProfile {
  final String email;
  final String status;
  final String username;
  UpdateProfile({
    required this.email,
    required this.status,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'status': status,
      'username': username,
    };
  }

  factory UpdateProfile.fromJson(Map<String, dynamic> map) {
    return UpdateProfile(
      email: map['email'] ?? '',
      status: map['status'] ?? '',
      username: map['username'] ?? '',
    );
  }
}
