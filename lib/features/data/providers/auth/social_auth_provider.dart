import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:automap/automap.dart';
import '../../../../core/enums/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/exceptions/exceptions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

@LazySingleton(as: ISocialAuthRemoteDataProvider)
class SocialAuthRemoteDataProvider implements ISocialAuthRemoteDataProvider {
  final FirebaseAuth authInstance;
  final FirebaseMessaging messagingInstance;
  final FirebaseFirestore firestoreInstance;

  const SocialAuthRemoteDataProvider(
      this.authInstance, this.firestoreInstance, this.messagingInstance);

  @override
  Future<AuthResponse> googleProviderSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final result = await _handleSignInRequest(
      email: googleUser.email,
      id: userCredential.user?.uid,
    );

    return result;
  }

  @override
  Future<AuthResponse> googleProviderSignUp() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleUser == null) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final result = await _handleSignUpRequest(
      email: googleUser.email,
      id: userCredential.user?.uid,
    );

    return result;
  }

  @override
  Future<AuthResponse> facebookProviderSignIn() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.cancelled) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }
    print("LOGIN RESULT $loginResult");

    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final Map<String, dynamic> userData =
        await FacebookAuth.instance.getUserData();

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final result = await _handleSignInRequest(
      email: userData['email'],
      id: userCredential.user?.uid,
    );

    return result;
  }

  @override
  Future<AuthResponse> facebookProviderSignUp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.cancelled) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }
    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final Map<String, dynamic> userData =
        await FacebookAuth.instance.getUserData();

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final result = await _handleSignUpRequest(
      email: userData['email'],
      id: userCredential.user?.uid,
    );

    return result;
  }

  @override
  Future<AuthResponse> twitterProviderSignUp() async {
    final twitterLogin = TwitterLogin(
      apiKey: dotenv.get('TWITTER_API_KEY'),
      apiSecretKey: dotenv.get('TWITTER_SECRET_KEY'),
      redirectURI: dotenv.get('TWITTER_REDIRECT_URL'),
    );

    final authResult = await twitterLogin.login();

    if (authResult.status == TwitterLoginStatus.cancelledByUser) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }

    final credential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final result = await _handleSignUpRequest(
      email: authResult.user!.email,
      id: userCredential.user?.uid,
    );
    return result;
  }

  @override
  Future<AuthResponse> twitterProviderSignIn() async {
    final twitterLogin = TwitterLogin(
      apiKey: dotenv.get('TWITTER_API_KEY'),
      apiSecretKey: dotenv.get('TWITTER_SECRET_KEY'),
      redirectURI: dotenv.get('TWITTER_REDIRECT_URL'),
    );

    final authResult = await twitterLogin.login();

    if (authResult.status == TwitterLoginStatus.cancelledByUser) {
      return AuthResponse(
        user: null,
        hasError: true,
        error: Errors.socialCancelled,
      );
    }

    final credential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final result = await _handleSignInRequest(
      email: authResult.user!.email,
      id: userCredential.user?.uid,
    );
    return result;
  }

  Future<AuthResponse> _handleSignInRequest({
    required String? id,
    required String? email,
  }) async {
    final QuerySnapshot<UserDTO> snapshot = await firestoreInstance
        .collection(Collections.users)
        .where("email", isEqualTo: email?.trim())
        .limit(1)
        .withConverter<UserDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => UserDTO.fromJson(snapshot.data()!),
        )
        .get();

    if (snapshot.docs.isEmpty) {
      log('IS EMPTY');
      final UserModel user = UserModel(
          id: id!,
          email: email ?? '',
          username: email ?? '',
          deviceToken: await messagingInstance.getToken());

      await firestoreInstance
          .collection(Collections.users)
          .doc(id)
          .set(user.toJson());

      return AuthResponse(user: user, hasError: false, error: null);
    }

    UserModel _user = AutoMapper.I.map<UserDTO, UserModel>(
      snapshot.docs.first.data(),
    );

    return AuthResponse(user: _user, hasError: false, error: null);
  }

  Future<AuthResponse> _handleSignUpRequest({
    required String? id,
    required String? email,
  }) async {
    final QuerySnapshot<UserDTO> snapshot = await firestoreInstance
        .collection(Collections.users)
        .where("email", isEqualTo: email)
        .limit(1)
        .withConverter<UserDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => UserDTO.fromJson(snapshot.data()!),
        )
        .get();

    if (snapshot.docs.isNotEmpty) {
      return AuthResponse(
          user: null, hasError: true, error: Errors.signUpGoogle);
    }

    final UserModel user = UserModel(
        id: id!,
        email: email ?? '',
        username: email ?? '',
        deviceToken: await messagingInstance.getToken());

    await firestoreInstance
        .collection(Collections.users)
        .doc(id)
        .set(user.toJson());

    UserModel _user = AutoMapper.I.map<UserDTO, UserModel>(
      user,
    );

    return AuthResponse(user: _user, hasError: false, error: null);
  }
}

abstract class ISocialAuthRemoteDataProvider {
  Future<AuthResponse> googleProviderSignIn();
  Future<AuthResponse> googleProviderSignUp();

  Future<AuthResponse> twitterProviderSignUp();
  Future<AuthResponse> twitterProviderSignIn();

  Future<AuthResponse> facebookProviderSignIn();
  Future<AuthResponse> facebookProviderSignUp();
}
