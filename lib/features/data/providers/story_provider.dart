import 'dart:io';
import '../models/story/story_content.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../presentation/navigation/app_router.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/core/enums/collections/story/query_fields.dart';
import 'package:frienderr/core/enums/collections/story/order_fields.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';

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
        .collection(Collections.stories.name)
        .where(StoryQueryFields.id.name, isNotEqualTo: userId)
        .orderBy(StoryOrderFields.id.name, descending: true)
        .snapshots();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> fetchStories(String userId) {
    return FirebaseFirestore.instance
        .collection(Collections.stories.name)
        .get();
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await firestoreInstance
          .collection(Collections.stories.name)
          .doc(docId)
          .get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> createStory({required List<GalleryAsset> assets}) async {
    try {
      final List<StoryContentEntity> content =
          await generateStoryContent(assets: assets);

      final StoryEntity stories = StoryEntity(
        content: content,
        id: firebaseAuth.currentUser?.uid as String,
        user: PartialUser(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateUpdated: DateTime.now().microsecondsSinceEpoch,
      );

      await firestoreInstance
          .collection(Collections.stories.name)
          .doc(stories.id)
          .set(stories.toJson());

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> updateStory(
      {required String userId, required List<GalleryAsset> assets}) async {
    try {
      final List<StoryContentEntity> content =
          await generateStoryContent(assets: assets);

      await firestoreInstance
          .collection(Collections.stories.name)
          .doc(userId)
          .update({
        StoryQueryFields.content.name:
            FieldValue.arrayUnion(content.map((x) => x.toJson()).toList())
      });

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> viewStory(
      {required String userId,
      required String storyId,
      required List<StoryContent> stories}) async {
    try {
      final storyMap = stories.map((story) {
        List<String> views = story.views;

        if (userId == story.id) {
          views.add(userId);
        }

        return {
          'id': story.id,
          'views': views,
          'likes': story.likes,
          'media': {
            'url': story.media.url,
            'type': story.media.type,
            'metadata': {
              'duration': story.media.metadata.duration,
              'thumbnail': story.media.metadata.thumbnail,
            },
          },
          'dateCreated': story.dateCreated,
        };
      }).toList();

      await firestoreInstance
          .collection(Collections.stories.name)
          .doc(userId)
          .update(
              {StoryQueryFields.content.name: FieldValue.arrayUnion(storyMap)});
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deleteStory(
      {required bool isLast,
      required String userId,
      required StoryContent story}) async {
    try {
      if (isLast) {
        await firestoreInstance
            .collection(Collections.stories.name)
            .doc(userId)
            .delete();
      } else {
        // final Map<String, dynamic> content = story.toJson();
        await firestoreInstance
            .collection(Collections.stories.name)
            .doc(userId)
            .update({
          StoryQueryFields.content.name: FieldValue.arrayRemove([
            {
              'id': story.id,
              'views': story.views,
              'likes': story.likes,
              'media': {
                'url': story.media.url,
                'type': story.media.type,
                'metadata': {
                  'duration': story.media.metadata.duration,
                  'thumbnail': story.media.metadata.thumbnail,
                },
              },
              'dateCreated': story.dateCreated,
            }
          ])
        });
      }

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<List<StoryContentEntity>> generateStoryContent(
      {required List<GalleryAsset> assets}) async {
    const _index = 0;
    String? _thumbnail;
    int _mapInterator = 0;
    Late<File?> _initialThumbnailFile = Late();
    Late<File?> _uploadProgressThumnail = Late();

    try {
      getIt<AppRouter>().popUntil((route) => route.isFirst);

      if (assets[_index].type == AssetType.video) {
        final File? value = assets[_index].asset;
        final File thumbnailFile = await VideoCompress.getFileThumbnail(
            value?.path as String,
            quality: 50,
            position: -1);

        _initialThumbnailFile.value = thumbnailFile;
        _uploadProgressThumnail.value = _initialThumbnailFile.value;
      } else {
        _uploadProgressThumnail.value = assets[_index].asset;
      }

      getIt<AppRouter>().context.showToast(
            duration: const Duration(days: 365),
            content:
                UploadProgress(file: _uploadProgressThumnail.value as File),
          );

      return await Stream.fromIterable(assets).asyncMap((item) async {
        final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
        final Reference storageRef =
            FirebaseStorage.instance.ref().child('/stories/$timestamp');

        final Reference thumbnailRef =
            FirebaseStorage.instance.ref().child('/thumbnail/$timestamp');

        late File? _asset;
        if (item.type == AssetType.video) {
          MediaInfo? mediaInfo = await VideoCompress.compressVideo(
            item.asset.path,
            deleteOrigin: false,
            quality: VideoQuality.LowQuality,
          );
          _asset = mediaInfo?.file;
        } else {
          _asset = item.asset;
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
                item.asset.path,
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
              duration: item.duration,
            ),
            type: item.type == AssetType.image ? 'image' : 'video',
          ),
          id: Helpers.generateId(25),
          dateCreated: DateTime.now().microsecondsSinceEpoch,
        );
      }).toList();
    } catch (error) {
      return [];
    }
  }
}

abstract class IStoryDataRemoteProvider {
  Future<bool> createStory({required List<GalleryAsset> assets});
  Future<QuerySnapshot<Map<String, dynamic>>> fetchStories(String userId);
  Future<bool> updateStory(
      {required String userId, required List<GalleryAsset> assets});
  Future<bool> viewStory(
      {required String userId,
      required String storyId,
      required List<StoryContent> stories});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId);
  Future<bool> deleteStory(
      {required bool isLast,
      required String userId,
      required StoryContent story});
}
