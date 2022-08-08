import 'dart:developer';
import 'dart:io';
import 'package:automap/automap.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';

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
        .collection(Collections.stories)
        .where(StoryQueryFields.id.name, isNotEqualTo: userId)
        .orderBy(StoryOrderFields.id.name, descending: true)
        .snapshots();
  }

  @override
  Future<DocumentSnapshot<StoryDTO>> fetchUserStory(String userId) {
    return FirebaseFirestore.instance
        .collection(Collections.stories)
        .doc(userId)
        .withConverter<StoryDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => StoryDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<StoryViewDTO?>> fetchUserStoryViews(
      {required List<String> latestContentIds, required String userId}) {
    return FirebaseFirestore.instance
        .collectionGroup("views")
        .where("userId", isEqualTo: userId)
        .where("contentId", whereIn: latestContentIds)
        .withConverter<StoryViewDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              StoryViewDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<StoryDTO>> fetchStories(String userId) {
    return FirebaseFirestore.instance
        .collection(Collections.stories)
        .orderBy("dateUpdated", descending: false)
        //  .where('id', isNotEqualTo: userId)
        .limit(Constants.pageSize)
        .withConverter<StoryDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => StoryDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<StoryDTO>> fetchPaginatedStories(
      String userId, Story previousStory) {
    return FirebaseFirestore.instance
        .collection(Collections.stories)
        .orderBy("dateUpdated", descending: false)
        .limit(Constants.pageSize)
        .startAfter([previousStory.dateUpdated])
        .withConverter<StoryDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => StoryDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await firestoreInstance
          .collection(Collections.stories)
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
      final List<StoryContentDTO> content =
          await generateStoryContent(assets: assets);

      final StoryDTO stories = StoryDTO(
        content: content,
        isPersitent: false,
        id: firebaseAuth.currentUser?.uid as String,
        user: UserDTO(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateUpdated: DateTime.now().microsecondsSinceEpoch,
      );

      await firestoreInstance
          .collection(Collections.stories)
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
      final List<StoryContentDTO> content =
          await generateStoryContent(assets: assets);

      await firestoreInstance
          .collection(Collections.stories)
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
      required String contentId,
      required List<StoryContent> stories}) async {
    try {
      Late<StoryViewDTO> storyView = Late();
      final batch = firestoreInstance.batch();

      final _stories =
          AutoMapper.I.map<List<StoryContent>, List<StoryContentDTO>>(
        stories,
      );

      final _content = _stories.map((content) {
        if (contentId == content.id) {
          content.views++;
          storyView.value = StoryViewDTO(
              userId: userId,
              contentId: content.id,
              dateCreated: DateTime.now().millisecondsSinceEpoch);
        }
        return content;
      }).toList();

      final updateRef =
          firestoreInstance.collection(Collections.stories).doc(storyId);

      batch.update(updateRef, {
        StoryQueryFields.content.name: _content.map((e) => e.toJson()).toList()
      });

      final _docId = "${storyId}_$userId";

      if (storyView.isInitialized) {
        final createRef = firestoreInstance
            .collection(Collections.stories)
            .doc(storyId)
            .collection("views")
            .doc(_docId);

        batch.set(createRef, storyView.value.toJson());
      }
      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContentDTO>? content}) async {
    try {
      if (isLast) {
        await firestoreInstance
            .collection(Collections.stories)
            .doc(userId)
            .delete();
      } else {
        log('exe 1');
        final List<Map<String, dynamic>>? storyContent =
            content?.map((x) => x.toJson()).toList();

        log('exe 2 $storyContent');
        await firestoreInstance
            .collection(Collections.stories)
            .doc(userId)
            .update({StoryQueryFields.content.name: storyContent});
      }

      return true;
    } catch (err) {
      log(err.toString());
      return false;
    }
  }

  Future<List<StoryContentDTO>> generateStoryContent(
      {required List<GalleryAsset> assets}) async {
    const _index = 0;
    String? _thumbnail;
    int _mapInterator = 0;
    Late<File?> _initialThumbnailFile = Late();
    Late<File?> _uploadProgressThumnail = Late();

    try {
      getService<AppRouter>().popUntil((route) => route.isFirst);

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

      getService<AppRouter>().context.showToast(
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

        return StoryContentDTO(
          views: 0,
          reactions: 0,
          media: StoryMediaDTO(
            url: url,
            metadata: StoryMetadataDTO(
              thumbnail: _thumbnail,
              duration: item.duration,
            ),
            type: item.type == AssetType.image ? 'image' : 'video',
          ),
          id: Helpers.generateId(25),
          dateCreated: DateTime.now().millisecondsSinceEpoch,
        );
      }).toList();
    } catch (error) {
      return [];
    }
  }

  @override
  Future<QuerySnapshot<StoryViewDTO?>> getPaginatedStoryViewers(
      {required String userId,
      required String contentId,
      required int previousStoryViewerTimestamp}) async {
    return FirebaseFirestore.instance
        .collection(Collections.stories)
        .doc(userId)
        .collection("views")
        .where("contentId", isEqualTo: contentId)
        .limit(Constants.pageSize)
        .orderBy("contentId")
        .startAfter([previousStoryViewerTimestamp])
        .withConverter<StoryViewDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              StoryViewDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<StoryViewDTO?>> getStoryViewers({
    required String userId,
    required String contentId,
  }) async {
    return FirebaseFirestore.instance
        .collection(Collections.stories)
        .doc(userId)
        .collection("views")
        .where("contentId", isEqualTo: contentId)
        .limit(Constants.pageSize)
        .withConverter<StoryViewDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              StoryViewDTO.fromJson(snapshot.data()!),
        )
        .get();
  }
}

abstract class IStoryDataRemoteProvider {
  Future<bool> createStory({required List<GalleryAsset> assets});
  Future<QuerySnapshot<StoryDTO>> fetchStories(String userId);
  Future<DocumentSnapshot<StoryDTO>> fetchUserStory(String userId);

  Future<QuerySnapshot<StoryViewDTO?>> fetchUserStoryViews(
      {required List<String> latestContentIds, required String userId});
  Future<QuerySnapshot<StoryDTO>> fetchPaginatedStories(
      String userId, Story previousStory);
  Future<bool> updateStory(
      {required String userId, required List<GalleryAsset> assets});
  Future<bool> viewStory(
      {required String userId,
      required String storyId,
      required String contentId,
      required List<StoryContent> stories});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId);
  Future<bool> deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContentDTO>? content});

  Future<QuerySnapshot<StoryViewDTO?>> getPaginatedStoryViewers(
      {required String userId,
      required String contentId,
      required int previousStoryViewerTimestamp});

  Future<QuerySnapshot<StoryViewDTO?>> getStoryViewers({
    required String userId,
    required String contentId,
  });
}
