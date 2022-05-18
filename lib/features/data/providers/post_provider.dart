import 'dart:io';
import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';

@LazySingleton(as: IPostRemoteDataProvider)
class PostRemoteDataProvider implements IPostRemoteDataProvider {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;

  PostRemoteDataProvider(
      this.firestoreInstance, this.firebaseStorage, this.firebaseAuth);

  @override
  Future<bool> createPost({
    required String caption,
    required List<GalleryAsset> assets,
  }) async {
    try {
      const _index = 0;
      String? _thumbnail;
      int _mapInterator = 0;
      Late<File?> _initialThumbnailFile = Late();
      Late<File?> _uploadProgressThumnail = Late();

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
            duration: Duration(days: 365),
            content:
                UploadProgress(file: _uploadProgressThumnail.value as File),
          );

      final List<Content> content =
          await Stream.fromIterable(assets).asyncMap((item) async {
        final String timestamp =
            DateTime.now().microsecondsSinceEpoch.toString();

        final Reference storageRef =
            FirebaseStorage.instance.ref().child('/posts/$timestamp');

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
        // .snapshotEvents
        //   .listen((taskSnapshot) {
        // final _progress = taskSnapshot.bytesTransferred.toDouble() /
        //       taskSnapshot.totalBytes.toDouble();
        //    print(_progress);
        //    });

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

        return Content(
          media: url,
          metadata: PostMetadata(thumbnail: _thumbnail),
          type: item.type == AssetType.image ? 'image' : 'video',
        );
      }).toList();

      final PostEntity posts = PostEntity(
        likes: [],
        shares: [],
        commentCount: 0,
        content: content,
        caption: caption,
        id: Helpers().generateId(25),
        user: PartialUser(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateCreated: DateTime.now().microsecondsSinceEpoch,
      );

      await firestoreInstance
          .collection('posts')
          .doc(posts.id)
          .set(posts.toJson());

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream() {
    return firestoreInstance
        .collection('posts')
        .snapshots(includeMetadataChanges: true);
  }

  @override
  Future<QuerySnapshot<Object?>> getPosts() async {
    return await firestoreInstance
        .collection('posts')
        .orderBy('dateCreated', descending: true)
        .limit(10)
        .get();
  }

  @override
  Future<QuerySnapshot<Object?>> getPaginatedPosts(
      List<Map<String, dynamic>> posts) async {
    return await firestoreInstance
        .collection('posts')
        .orderBy('dateCreated', descending: true)
        .startAfter([posts[posts.length - 1]['dateCreated']])
        .limit(10)
        .get();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>>
      fetchTimelinelinePostCount() async {
    return await FirebaseFirestore.instance
        .collection('postCount')
        .doc('count')
        .get();
  }

  @override
  Future<bool> likePost(PostEntity post, UserEntity user) async {
    final String userId = user.id;
    final String postId = post.id;

    try {
      await firestoreInstance.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([userId])
      });

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> unLikePost(String postId, String userId) async {
    try {
      await firestoreInstance.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([userId])
      });
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deletePost(String postId) async {
    try {
      await firestoreInstance.collection('posts').doc(postId).delete();
      return true;
    } catch (error) {
      return false;
    }
  }
}

abstract class IPostRemoteDataProvider {
  Future<bool> createPost(
      {required String caption, required List<GalleryAsset> assets});

  Future<bool> deletePost(String postId);

  Future<QuerySnapshot<Object?>> getPosts();

  Future<bool> likePost(PostEntity post, UserEntity user);

  Future<bool> unLikePost(String postId, String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream();

  Future<QuerySnapshot<Object?>> getPaginatedPosts(
      List<Map<String, dynamic>> posts);

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchTimelinelinePostCount();
}
