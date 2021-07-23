import 'package:frienderr/util/helpers.dart';
import 'package:frienderr/errors/errors.dart';
import 'package:frienderr/models/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/user/user_model.dart';

class AuthRepository {
  final Helpers helpers = new Helpers();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<AuthResponse> createUserAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = userCredential.user!.uid;

      final UserModel user = UserModel(
        id: id,
        chats: [],
        status: '',
        stories: [],
        username: '',
        following: [],
        followers: [],
        presence: true,
        isLocationEnabled: false,
        location: {'latitude': 0, 'longitude': 0},
        profilePic: '${Constants.defaultProfilePic}',
        coverPhoto: '${Constants.defaultCoverPhoto}',
        bitmapImage: '${Constants.defaultBitmapImage}',
      );

      await users.doc(id).set(user.toJson());
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
      final authUser = authenticatedUser.docs.toList()[0];

      final user = new UserModel(
          id: authUser['id'],
          chats: authUser['chats'],
          status: authUser['status'],
          stories: authUser['stories'],
          presence: authUser['presence'],
          username: authUser['username'],
          location: authUser['location'],
          following: authUser['following'],
          followers: authUser['followers'],
          profilePic: authUser['profilePic'],
          coverPhoto: authUser['coverPhoto'],
          bitmapImage: authUser['bitmapImage'],
          isLocationEnabled: authUser['isLocationEnabled']);

      return AuthResponse(user: user, hasError: false, error: null);
    } on FirebaseAuthException catch (e) {
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

  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<dynamic> isAuthenticated() async {
    if (auth.currentUser?.uid == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isUsernameSelected() async {
    final user = await users.doc(auth.currentUser?.uid).get();
    if (user['username'] != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getUserId() async {
    return auth.currentUser?.uid as String;
  }
}
