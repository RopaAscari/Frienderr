import 'package:frienderr/util/helpers.dart';
import 'package:frienderr/errors/errors.dart';
import 'package:frienderr/models/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/user/user_model.dart';

class AuthRepository {
  final Helpers helpers = new Helpers();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<AuthResponse> recoverPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return AuthResponse(user: null, hasError: false, error: null);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(user: null, hasError: true, error: Errors.generic);
    }
  }

  Future<AuthResponse> createUserAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String id = userCredential.user!.uid;

      final UserModel user = UserModel(
        id: id,
        username: '',
      );

      await users.doc(id).set(user.toMap());
      return AuthResponse(user: user, hasError: false, error: null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return AuthResponse(
              user: null, hasError: true, error: Errors.signUpPassword);
        case 'email-already-in-use':
          return AuthResponse(
              user: null, hasError: true, error: Errors.signUpEmail);
        default:
          return AuthResponse(
              user: null, hasError: true, error: Errors.generic);
      }
    }
  }

  Future<AuthResponse> authenticateUser({
    required String password,
    required String email,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      final QuerySnapshot authenticatedUser = await users
          .where('id', isEqualTo: userCredential.user?.uid)
          .limit(1)
          .get();

      final QueryDocumentSnapshot<Object?> authUser =
          authenticatedUser.docs.toList()[0];

      final UserModel user =
          UserModel.fromMap(authUser.data() as Map<String, dynamic>);

      return AuthResponse(user: user, hasError: false, error: null);
    } on FirebaseAuthException catch (e) {
      print(e);
      return AuthResponse(user: null, hasError: true, error: Errors.login);
    }
  }

  Future<bool> verfyAndUpdateUsername(String userId, String username) async {
    try {
      final QuerySnapshot data =
          await users.where('username', isEqualTo: username).limit(1).get();

      if (!(data.docs.toList().length > 0)) {
        await users.doc(userId).update({'username': username});
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut(
      {required Function onComplete, required Function onFailure}) async {
    try {
      onComplete(await auth.signOut());
    } on FirebaseAuthException catch (e) {
      onFailure(e);
    }
  }

  Future<dynamic> isAuthenticated() async {
    return auth.currentUser?.uid != null;
  }

  Future<bool> isUsernameSelected() async {
    final DocumentSnapshot<Object?> user =
        await users.doc(auth.currentUser?.uid).get();
    return user['username'] != '';
  }

  Future<String> getUserId() async {
    return auth.currentUser?.uid as String;
  }
}
