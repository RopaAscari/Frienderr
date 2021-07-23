class AuthResponse {
  final dynamic user;
  final dynamic error;
  final bool hasError;

  AuthResponse(
      {required this.error, required this.hasError, required this.user});
}
