import 'dart:io';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/enums/collections/snaps/query_fields.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/like_snap.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_compress/video_compress.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';

@LazySingleton(as: ISnapRemoteDataProvider)
class SnapRemoteDataProvider implements ISnapRemoteDataProvider {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;

  SnapRemoteDataProvider(
      this.firestoreInstance, this.firebaseAuth, this.firebaseStorage);

  @override
  Future<QuerySnapshot<SnapDTO>> getSnaps() async {
    return await firestoreInstance
        .collection(Collections.snaps)
        .withConverter<SnapDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => SnapDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<QuerySnapshot<SnapDTO>> getPaginatedSnaps(
      {required Snap prevSnap}) async {
    return await firestoreInstance
        .collection(Collections.snaps)
        .orderBy("dateCreated", descending: true)
        .startAfter([prevSnap.dateCreated])
        .withConverter<SnapDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => SnapDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<QuerySnapshot<SnapDTO>> getUserSnaps({required String uid}) async {
    return await firestoreInstance
        .collection(Collections.snaps)
        .where('user.id', isEqualTo: uid)
        .withConverter<SnapDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => SnapDTO.fromJson(snapshot.data()!),
        )
        .limit(5)
        .get();
  }

  @override
  Future<QuerySnapshot<SnapLikeDTO>> getUserSnapLikes(
      {required List<String> snapIds, required String userId}) async {
    return await firestoreInstance
        .collectionGroup("likes")
        .where("snapId", whereIn: snapIds)
        .where("userId", isEqualTo: userId)
        .withConverter<SnapLikeDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              SnapLikeDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<bool> createSnap({required String caption, required File file}) async {
    try {
      String? _thumbnail;
      int _mapInterator = 0;
      Late<File?> _initialThumbnailFile = Late();
      Late<File?> _uploadProgressThumnail = Late();

      getService<AppRouter>().popUntil((route) => route.isFirst);

      final File thumbnailFile = await VideoCompress.getFileThumbnail(file.path,
          quality: 50, position: -1);

      _initialThumbnailFile.value = thumbnailFile;
      _uploadProgressThumnail.value = _initialThumbnailFile.value;

      getService<AppRouter>().context.showToast(
            duration: const Duration(days: 365),
            content:
                UploadProgress(file: _uploadProgressThumnail.value as File),
          );

      final String timestamp = DateTime.now().microsecondsSinceEpoch.toString();

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/snaps/$timestamp');

      final Reference thumbnailRef =
          FirebaseStorage.instance.ref().child('/thumbnail/$timestamp');

      late File? _asset;

      MediaInfo? mediaInfo = await VideoCompress.compressVideo(
        file.path,
        deleteOrigin: false,
        quality: VideoQuality.LowQuality,
      );
      _asset = mediaInfo?.file;

      await storageRef.putFile(
        _asset as File,
        SettableMetadata(
          contentType: 'video/mp4',
        ),
      );

      final String url = await storageRef.getDownloadURL();

      File _thumbnailFile;
      if (_mapInterator == 0 && _initialThumbnailFile.isInitialized) {
        _thumbnailFile = _initialThumbnailFile.value as File;
      } else {
        final File thumbnailFile = await VideoCompress.getFileThumbnail(
            file.path,
            quality: 50,
            position: -1);

        _thumbnailFile = thumbnailFile;
      }

      await thumbnailRef.putFile(
        _thumbnailFile,
        SettableMetadata(
          contentType: 'image/jpg',
        ),
      );
      _thumbnail = await thumbnailRef.getDownloadURL();

      final quick = SnapDTO(
        url: url,
        audio: '',
        saves: 0,
        likes: 0,
        shares: 0,
        comments: 0,
        caption: caption,
        thumbnail: _thumbnail,
        id: Helpers.generateId(25),
        dateCreated: DateTime.now().microsecondsSinceEpoch,
        user: UserDTO(id: FirebaseAuth.instance.currentUser!.uid),
      );

      await firestoreInstance
          .collection(Collections.snaps)
          .doc(quick.id)
          .set(quick.toJson());

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> likeSnap({
    required String userId,
    required String snapId,
  }) async {
    try {
      final batch = firestoreInstance.batch();

      final snapRef =
          firestoreInstance.collection(Collections.snaps).doc(snapId);

      batch.update(
          snapRef, {SnapQueryFields.likes.name: FieldValue.increment(1)});

      final snaplikeRef = firestoreInstance
          .collection(Collections.snaps)
          .doc(snapId)
          .collection(Collections.likes)
          .doc(userId);

      batch.set(
          snaplikeRef, SnapLikeDTO(userId: userId, snapId: snapId).toJson());

      await batch.commit();

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> unLikeSnap({
    required String userId,
    required String snapId,
  }) async {
    try {
      final batch = firestoreInstance.batch();

      final snapRef =
          firestoreInstance.collection(Collections.snaps).doc(snapId);

      batch.update(
          snapRef, {SnapQueryFields.likes.name: FieldValue.increment(-1)});

      final snaplikeRef = firestoreInstance
          .collection(Collections.snaps)
          .doc(snapId)
          .collection(Collections.likes)
          .doc(userId);

      batch.delete(
        snaplikeRef,
      );

      await batch.commit();

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteSnap({
    required String snapId,
  }) async {
    try {
      await firestoreInstance
          .collection(Collections.snaps)
          .doc(snapId)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class ISnapRemoteDataProvider {
  Future<bool> createSnap({required String caption, required File file});
  Future<QuerySnapshot<SnapDTO>> getSnaps();
  Future<QuerySnapshot<SnapDTO>> getPaginatedSnaps({required Snap prevSnap});
  Future<bool> deleteSnap({
    required String snapId,
  });
  Future<bool> likeSnap({
    required String userId,
    required String snapId,
  });

  Future<bool> unLikeSnap({
    required String userId,
    required String snapId,
  });
  Future<QuerySnapshot<SnapLikeDTO>> getUserSnapLikes(
      {required List<String> snapIds, required String userId});
  Future<QuerySnapshot<SnapDTO>> getUserSnaps({
    required String uid,
  });
}
