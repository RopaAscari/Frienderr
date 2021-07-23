import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:frienderr/util/helpers.dart';

class TokenHandler {
  final Helpers helpers = new Helpers();
  final String sharedSecret = 'yungd3v3loprs';

  Future<String> createToken(dynamic user) async {
    final claimSet = JwtClaim(
      jwtId: helpers.generateId(32),
      payload: user,
    );
    // Generate a JWT from the claim set
    final token = issueJwtHS256(claimSet, sharedSecret);

    return token;
  }

  Future<dynamic> decodeToken(String token) async {
    try {
      return verifyJwtHS256Signature(token, sharedSecret);
    } catch (err) {
      return {};
    }
  }
}
