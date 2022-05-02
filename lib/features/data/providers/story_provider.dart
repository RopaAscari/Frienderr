import 'dart:io';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../presentation/navigation/app_router.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';

@LazySingleton(as: IStoryDataRemoteProvider)
class StoryDataRemoteProvider implements IStoryDataRemoteProvider {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;

  StoryDataRemoteProvider(
      this.firestoreInstance, this.firebaseAuth, this.firebaseStorage);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId) {
    return FirebaseFirestore.instance
        .collection('stories')
        .where('id', isNotEqualTo: userId)
        .orderBy('id', descending: true)
        .snapshots();
  }

  @override
  Future<bool> createStory({required List<GalleryAsset> assets}) async {
    const _index = 0;
    String? _thumbnail;
    int _mapInterator = 0;
    Late<File?> _initialThumbnailFile = Late();
    Late<File?> _uploadProgressThumnail = Late();

    try {
      getIt<AppRouter>().popUntil((route) => route.isFirst);

      if (assets[_index].asset.type == AssetType.video) {
        final File? value = await assets[_index].asset.file;
        final File thumbnailFile = await VideoCompress.getFileThumbnail(
            value?.path as String,
            quality: 50,
            position: -1);

        _initialThumbnailFile.value = thumbnailFile;
        _uploadProgressThumnail.value = _initialThumbnailFile.value;
      } else {
        _uploadProgressThumnail.value = await assets[_index].asset.file;
      }

      getIt<AppRouter>().context.showToast(
            duration: Duration(days: 365),
            content:
                UploadProgress(file: _uploadProgressThumnail.value as File),
          );

      final List<StoryContentEntity> content =
          await Stream.fromIterable(assets).asyncMap((item) async {
        final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
        final Reference storageRef =
            FirebaseStorage.instance.ref().child('/stories/$timestamp');

        final Reference thumbnailRef =
            FirebaseStorage.instance.ref().child('/thumbnail/$timestamp');

        return item.asset.file.then((value) async {
          late File? _asset;
          if (item.asset.type == AssetType.video) {
            MediaInfo? mediaInfo = await VideoCompress.compressVideo(
              value?.path as String,
              deleteOrigin: false,
              quality: VideoQuality.LowQuality,
            );
            _asset = mediaInfo?.file;
          } else {
            _asset = value;
          }

          await storageRef.putFile(
            _asset as File,
            SettableMetadata(
              contentType:
                  item.type == AssetType.image ? 'image/jpg' : 'video/mp4',
            ),
          );
          final String url = await storageRef.getDownloadURL();

          if (item.type == AssetType.video) {
            File _thumbnailFile;
            if (_mapInterator == 0 && _initialThumbnailFile.isInitialized) {
              _thumbnailFile = _initialThumbnailFile.value as File;
            } else {
              final File thumbnailFile = await VideoCompress.getFileThumbnail(
                  value?.path as String,
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
          }

          _mapInterator++;

          return StoryContentEntity(
            views: [],
            likes: [],
            media: StoryMediaEntity(
              url: url,
              metadata: StoryMetadata(
                thumbnail: _thumbnail,
                duration: item.asset.duration,
              ),
              type: item.type == AssetType.image ? 'image' : 'video',
            ),
            id: Helpers().generateId(25),
            dateCreated: DateTime.now().microsecondsSinceEpoch,
          );
        });
      }).toList();

      final StoryEntity stories = StoryEntity(
        content: content,
        id: Helpers().generateId(25),
        user: PartialUser(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateUpdated: DateTime.now().microsecondsSinceEpoch,
      );

      await firestoreInstance
          .collection('stories')
          .doc(stories.id)
          .set(stories.toJson());

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  @override
  Future<bool> updateStory({required List<GalleryAsset> assets}) async {
    return false;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> fetchStories(String userId) {
    return FirebaseFirestore.instance.collection('stories').get();
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await firestoreInstance.collection('stories').doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}

abstract class IStoryDataRemoteProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> fetchStories(String userId);
  Future<bool> createStory({required List<GalleryAsset> assets});
  Future<bool> updateStory({required List<GalleryAsset> assets});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId);
}
