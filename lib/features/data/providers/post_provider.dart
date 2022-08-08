import 'dart:io';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/core/enums/collections/posts/order_fields.dart';
import 'package:frienderr/core/enums/collections/posts/query_fields.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/upload_progress.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';

@LazySingleton(as: IPostRemoteDataProvider)
class PostRemoteDataProvider implements IPostRemoteDataProvider {
  FirebaseAuth firebaseAuth;
  FirebaseStorage firebaseStorage;
  FirebaseFirestore firestoreInstance;

  PostRemoteDataProvider(
    this.firebaseAuth,
    this.firebaseStorage,
    this.firestoreInstance,
  );

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream() {
    return firestoreInstance
        .collection(Collections.posts)
        .snapshots(includeMetadataChanges: true);
  }

  @override
  Future<QuerySnapshot<PostDTO>> getUserPosts({required String uid}) async {
    return await firestoreInstance
        .collection(Collections.posts)
        .orderBy(PostOrderFields.dateCreated.name, descending: true)
        .where('user.id', isEqualTo: uid)
        .where("type", isEqualTo: "post")
        .limit(5)
        .withConverter<PostDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => PostDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<DocumentSnapshot<PostDTO>> getPost({required String postId}) async {
    return await firestoreInstance
        .collection(Collections.posts)
        .doc(postId)
        .withConverter<PostDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => PostDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<PostDTO>> getPosts() async {
    return await firestoreInstance
        .collection(Collections.posts)
        .orderBy(PostOrderFields.dateCreated.name, descending: true)
        .limit(Constants.pageSize)
        .withConverter<PostDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => PostDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<QuerySnapshot<PostDTO>> getPaginatedPosts(Post post) async {
    // print("getting paginatd");
    return await firestoreInstance
        .collection(Collections.posts)
        .orderBy("dateCreated", descending: true)
        .startAfter([post.dateCreated])
        .withConverter<PostDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => PostDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<bool> savePost({required SavedPostDTO savedPost}) async {
    try {
      final userId = savedPost.userId;
      final postId = savedPost.postId;
      final batch = firestoreInstance.batch();

      final _docId = "${postId}_$userId";

      final docRef = firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .collection(Collections.saves)
          .doc(_docId);

      batch.set(docRef, savedPost.toJson());

      final postRef =
          firestoreInstance.collection(Collections.posts).doc(savedPost.postId);

      batch.update(postRef, {
        'saves': FieldValue.increment(1),
      });

      await batch.commit();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> unSavePost(
      {required String postId, required String userId}) async {
    try {
      final batch = firestoreInstance.batch();

      final _docId = "${postId}_$userId";

      final docRef = firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .collection(Collections.saves)
          .doc(_docId);

      batch.delete(
        docRef,
      );

      final postRef =
          firestoreInstance.collection(Collections.posts).doc(postId);

      batch.update(postRef, {
        'saves': FieldValue.increment(-1),
      });

      await batch.commit();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<QuerySnapshot<SavedPostDTO>> getUserSavedPosts(
      {required List<String> postIds, required String userId}) async {
    return await firestoreInstance
        .collectionGroup(Collections.saves)
        .where('userId', isEqualTo: userId)
        .where('postId', whereIn: postIds)
        .withConverter<SavedPostDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              SavedPostDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<bool> updatePostShares({
    required String postId,
  }) async {
    try {
      await firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .update({'shares': FieldValue.increment(1)});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<QuerySnapshot<PostReactionDTO>> getUserPostReactions(
      {required List<String> postIds, required String userId}) async {
    return await firestoreInstance
        .collectionGroup("reactions")
        .where('uid', isEqualTo: userId)
        .where('postId', whereIn: postIds)
        .withConverter<PostReactionDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              PostReactionDTO.fromJson(snapshot.data()!),
        )
        .get();
  }

  @override
  Future<bool> reactToPost({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) async {
    try {
      final userId = reaction.uid;
      final postId = reaction.postId;
      final batch = firestoreInstance.batch();

      final _docId = "${postId}_$userId";
      final ref = firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .collection("reactions")
          .doc(_docId);

      batch.set(ref, reaction.toJson());

      final postRef =
          firestoreInstance.collection(Collections.posts).doc(reaction.postId);

      batch.update(postRef, {
        'reactions': FieldValue.increment(1),
        'latestReactions': latestReactions.map((e) => e.toJson()).toList(),
      });

      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  unReactToPost({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) async {
    try {
      final userId = reaction.uid;
      final postId = reaction.postId;

      final batch = firestoreInstance.batch();

      final _docId = "${postId}_$userId";
      final ref = firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .collection("reactions")
          .doc(_docId);

      batch.delete(ref);

      final postRef =
          firestoreInstance.collection(Collections.posts).doc(reaction.postId);

      batch.update(postRef, {
        'reactions': FieldValue.increment(-1),
        'latestReactions': latestReactions.map((e) => e.toJson()).toList(),
      });

      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  updatePostReaction({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) async {
    try {
      final userId = reaction.uid;
      final postId = reaction.postId;

      final batch = firestoreInstance.batch();

      final _docId = "${postId}_$userId";
      final ref = firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .collection("reactions")
          .doc(_docId);

      batch.update(ref, reaction.toJson());

      final postRef =
          firestoreInstance.collection(Collections.posts).doc(reaction.postId);

      if (latestReactions.contains(reaction)) {
        latestReactions[latestReactions
            .indexWhere((element) => element.uid == reaction.uid)] = reaction;

        batch.update(postRef, {
          'reactions': FieldValue.increment(-1),
          'lastReactions': latestReactions.map((e) => e.toJson()).toList(),
        });
      }

      batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> unLikePost(String postId, String userId) async {
    try {
      await firestoreInstance.collection(Collections.posts).doc(postId).update({
        PostQueryFields.likes.name: FieldValue.arrayRemove([userId])
      });
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deletePost(String postId) async {
    try {
      await firestoreInstance
          .collection(Collections.posts)
          .doc(postId)
          .delete();
      return true;
    } catch (error) {
      return false;
    }
  }

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
            content: UploadProgress(
                leading: Image.file(
                  _uploadProgressThumnail.value ?? File(""),
                  width: 40,
                  height: 40,
                ),
                file: _uploadProgressThumnail.value as File),
          );

      final List<ContentDTO> content =
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

        return ContentDTO(
          media: url,
          metadata: PostMetadataDTO(thumbnail: _thumbnail),
          type: item.type == AssetType.image ? 'image' : 'video',
        );
      }).toList();

      final PostDTO posts = PostDTO(
        saves: 0,
        shares: 0,
        comments: 0,
        reactions: 0,
        content: content,
        caption: caption,
        latestReactions: [],
        type: TimelinePostType.post,
        id: Helpers.generateId(25),
        user: UserDTO(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateCreated: DateTime.now().millisecondsSinceEpoch,
      );

      await firestoreInstance
          .collection(Collections.posts)
          .doc(posts.id)
          .set(posts.toJson());

      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> createStatusPost({
    required String status,
  }) async {
    try {
      getService<AppRouter>().popUntil((route) => route.isFirst);

      getService<AppRouter>().context.showToast(
            duration: const Duration(days: 365),
            content: const UploadProgress(file: null),
          );

      final PostDTO posts = PostDTO(
        saves: 0,
        shares: 0,
        comments: 0,
        reactions: 0,
        content: [],
        caption: status,
        latestReactions: [],
        id: Helpers.generateId(25),
        type: TimelinePostType.status,
        user: UserDTO(
          id: firebaseAuth.currentUser?.uid as String,
        ),
        dateCreated: DateTime.now().millisecondsSinceEpoch,
      );

      await firestoreInstance
          .collection(Collections.posts)
          .doc(posts.id)
          .set(posts.toJson());

      return true;
    } catch (error) {
      return false;
    }
  }
}

abstract class IPostRemoteDataProvider {
  Future<bool> createPost(
      {required String caption, required List<GalleryAsset> assets});
  Future<bool> createStatusPost({required String status});
  Future<bool> deletePost(String postId);

  Future<QuerySnapshot<PostDTO>> getPosts();

  Future<DocumentSnapshot<PostDTO>> getPost({required String postId});

  Future<bool> reactToPost({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  });

  Future<bool> unReactToPost({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  });

  Future<bool> savePost({
    required SavedPostDTO savedPost,
  });

  Future<bool> updatePostShares({
    required String postId,
  });

  Future<bool> unSavePost({
    required String userId,
    required String postId,
  });

  Future<bool> updatePostReaction({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  });
  Future<bool> unLikePost(String postId, String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream();

  Future<QuerySnapshot<PostDTO>> getPaginatedPosts(Post post);

  Future<QuerySnapshot<PostDTO>> getUserPosts({required String uid});

  Future<QuerySnapshot<PostReactionDTO>> getUserPostReactions(
      {required List<String> postIds, required String userId});

  Future<QuerySnapshot<SavedPostDTO>> getUserSavedPosts(
      {required List<String> postIds, required String userId});
}
