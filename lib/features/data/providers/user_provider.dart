import 'dart:io';

import 'package:frienderr/features/domain/entities/update_profile.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/user.dart';

@LazySingleton(as: IUserDataRemoteProvider)
class UserDataRemoteProvider implements IUserDataRemoteProvider {
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;
  UserDataRemoteProvider(this.firestoreInstance, this.firebaseStorage);

  @override
  Future<QuerySnapshot<UserDTO>> getPlatformUsers() async {
    return await FirebaseFirestore.instance
        .collection(Collections.users)
        .withConverter<UserDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => UserDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers2() async {
    return await FirebaseFirestore.instance.collection(Collections.users).get();
  }

  @override
  Future<bool> updateProfile(
      {required UpdateProfile profile, required String uid}) async {
    try {
      await FirebaseFirestore.instance
          .collection(Collections.users)
          .doc(uid)
          .update(profile.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> updateCoverPhoto(
      {required String uid, required File file}) async {
    final String timestamp = DateTime.now().microsecondsSinceEpoch.toString();

    final Reference coverPhotoRef =
        FirebaseStorage.instance.ref().child('/coverPhoto/$timestamp');

    await coverPhotoRef.putFile(
      file,
      SettableMetadata(
        contentType: 'image/jpg',
      ),
    );

    final String url = await coverPhotoRef.getDownloadURL();

    await firestoreInstance
        .collection(Collections.users)
        .doc(uid)
        .update({'coverPhoto': url});

    return url;
  }

  @override
  Future<String> updateProfilePhoto(
      {required String uid, required File file}) async {
    final String timestamp = DateTime.now().microsecondsSinceEpoch.toString();

    final Reference profilePhotoRef =
        FirebaseStorage.instance.ref().child('/profilePhoto/$timestamp');

    await profilePhotoRef.putFile(
      file,
      SettableMetadata(
        contentType: 'image/jpg',
      ),
    );

    final String url = await profilePhotoRef.getDownloadURL();

    await firestoreInstance
        .collection(Collections.users)
        .doc(uid)
        .update({'profilePic': url});

    return url;
  }

  @override
  Future<QuerySnapshot<UserDTO>> getUsersByIds(
      {required List<String> userIds}) async {
    return await FirebaseFirestore.instance
        .collection(Collections.users)
        .where('id', whereIn: userIds)
        .withConverter<UserDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => UserDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<DocumentSnapshot<UserDTO>> getUser({required String uid}) async {
    return await FirebaseFirestore.instance
        .collection(Collections.users)
        .doc(uid)
        .withConverter<UserDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => UserDTO.fromJson(snapshot.data()!),
        )
        .get();
  }
}

abstract class IUserDataRemoteProvider {
  Future<QuerySnapshot<UserDTO>> getPlatformUsers();
  Future<bool> updateProfile(
      {required UpdateProfile profile, required String uid});
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers2();
  Future<String> updateCoverPhoto({required String uid, required File file});
  Future<String> updateProfilePhoto({required String uid, required File file});
  Future<QuerySnapshot<UserDTO>> getUsersByIds({required List<String> userIds});
  Future<DocumentSnapshot<UserDTO>> getUser({required String uid});
}
