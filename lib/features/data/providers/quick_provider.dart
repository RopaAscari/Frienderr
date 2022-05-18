import 'dart:io';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_compress/video_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';

@LazySingleton(as: IQuickRemoteDataProvider)
class QuickRemoteDataProvider implements IQuickRemoteDataProvider {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;

  QuickRemoteDataProvider(
      this.firestoreInstance, this.firebaseAuth, this.firebaseStorage);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getQuicks() async {
    return await firestoreInstance.collection('quicks').get();
  }

  @override
  Future<bool> createQuick(
      {required String caption, required File file}) async {
    try {
      String? _thumbnail;
      int _mapInterator = 0;
      Late<File?> _initialThumbnailFile = Late();
      Late<File?> _uploadProgressThumnail = Late();

      getIt<AppRouter>().popUntil((route) => route.isFirst);

      final File thumbnailFile = await VideoCompress.getFileThumbnail(file.path,
          quality: 50, position: -1);

      _initialThumbnailFile.value = thumbnailFile;
      _uploadProgressThumnail.value = _initialThumbnailFile.value;

      getIt<AppRouter>().context.showToast(
            duration: const Duration(days: 365),
            content:
                UploadProgress(file: _uploadProgressThumnail.value as File),
          );

      final String timestamp = DateTime.now().microsecondsSinceEpoch.toString();

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/posts/$timestamp');

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

      final quick = QuickEntity(
        url: url,
        audio: '',
        likes: [],
        shares: [],
        caption: caption,
        commentCount: 0,
        thumbnail: _thumbnail,
        id: Helpers().generateId(25),
        dateCreated: DateTime.now().microsecondsSinceEpoch,
        user: PartialUser(id: FirebaseAuth.instance.currentUser!.uid),
      );

      await firestoreInstance
          .collection('quicks')
          .doc(quick.id)
          .set(quick.toJson());

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  @override
  Future<bool> likeQuick({
    required String userId,
    required String quickId,
  }) async {
    try {
      await firestoreInstance.collection('quicks').doc(quickId).update({
        'likes': FieldValue.arrayUnion([userId])
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> unLikeQuick({
    required String userId,
    required String quickId,
  }) async {
    try {
      await firestoreInstance.collection('quicks').doc(quickId).update({
        'likes': FieldValue.arrayRemove([userId])
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteQuick({
    required String quickId,
  }) async {
    try {
      await firestoreInstance.collection('quicks').doc(quickId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class IQuickRemoteDataProvider {
  Future<bool> createQuick({required String caption, required File file});
  Future<QuerySnapshot<Map<String, dynamic>>> getQuicks();
  Future<bool> deleteQuick({
    required String quickId,
  });
  Future<bool> likeQuick({
    required String userId,
    required String quickId,
  });

  Future<bool> unLikeQuick({
    required String userId,
    required String quickId,
  });
}
