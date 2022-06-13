import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';
import 'package:dash_chat_2/dash_chat_2.dart' as chat;
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/features/domain/entities/message.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';

@LazySingleton(as: IMessageRemoteDataProvider)
class MessageRemoteDataProvider implements IMessageRemoteDataProvider {
  final SmartReply smartReply;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firestoreInstance;

  const MessageRemoteDataProvider(this.smartReply, this.firestoreInstance,
      this.firebaseAuth, this.firebaseStorage);
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateMessageStream(
      {required String chatId}) {
    return firestoreInstance
        .collection(Collections.chats.name)
        .doc(chatId)
        .collection(Collections.messages.name)
        .snapshots();
  }

  @override
  Future<chat.ChatMessage?> sendMessage(
      {required String chatId, required chat.ChatMessage message}) async {
    try {
      message.customProperties = {};
      message.id = Helpers.generateId(25);
      message.status = chat.MessageStatus.received;

      smartReply.addMessageToConversationFromRemoteUser(
          message.text,
          DateTime.now().millisecondsSinceEpoch - (60 * 60 * 1000),
          message.user.id);

      final SmartReplySuggestionResult response =
          await smartReply.suggestReplies();

      message.quickReplies = response.suggestions
          .map((suggestion) => chat.QuickReply(
              title: suggestion, value: suggestion, customProperties: {}))
          .toList();

      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .collection(Collections.messages.name)
          .doc(message.id)
          .set(message.toJson());
      return message;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<chat.ChatMessage?> sendMultimediaMessages({
    required String chatId,
    required List<MultimediaMessage> messages,
  }) async {
    chat.ChatMessage? _lastMessage;

    try {
      for (final item in messages) {
        String _id = Helpers.generateId(25);

        item.message.id = _id;
        item.message.medias = [];
        item.message.customProperties = {};
        item.message.user.customProperties = {};
        item.message.status = chat.MessageStatus.received;

        final String timestamp =
            DateTime.now().microsecondsSinceEpoch.toString();

        final Reference storageRef =
            FirebaseStorage.instance.ref().child('/chats/images/$timestamp');

        final Reference thumbnailRef = FirebaseStorage.instance
            .ref()
            .child('/chats/videos/thumbnails$timestamp');

        late File? _asset;

        if (item.asset.type == AssetType.video) {
          MediaInfo? mediaInfo = await VideoCompress.compressVideo(
            item.asset.asset.path,
            deleteOrigin: false,
            quality: VideoQuality.LowQuality,
          );
          _asset = mediaInfo?.file;
        } else {
          _asset = item.asset.asset;
        }

        await storageRef.putFile(
          _asset as File,
          SettableMetadata(
            contentType:
                item.asset.type == AssetType.image ? 'image/jpg' : 'video/mp4',
          ),
        );

        final String mediaUrl = await storageRef.getDownloadURL();

        if (item.asset.type == AssetType.video) {
          item.message.medias?.add(chat.ChatMedia(
            url: mediaUrl,
            type: chat.MediaType.video,
            fileName: item.asset.id.toString(),
          ));
        } else {
          item.message.medias?.add(chat.ChatMedia(
            url: mediaUrl,
            type: chat.MediaType.image,
            fileName: item.asset.id.toString(),
          ));
        }

        item.message.medias?.first.customProperties = {};

        if (item.asset.type == AssetType.video) {
          File _thumbnailFile = await VideoCompress.getFileThumbnail(
              item.asset.asset.path,
              quality: 50,
              position: -1);

          await thumbnailRef.putFile(
            _thumbnailFile,
            SettableMetadata(
              contentType: 'image/jpg',
            ),
          );
          final thumbnailUrl = await thumbnailRef.getDownloadURL();

          item.message.medias?.first.metadata =
              chat.Metadata(thumbnail: thumbnailUrl);
        }

        Map<String, dynamic> _message = item.message.toJson();

        await firestoreInstance
            .collection(Collections.chats.name)
            .doc(chatId)
            .collection(Collections.messages.name)
            .doc(_id)
            .set(_message);
        _lastMessage = chat.ChatMessage.fromJson(_message);
      }

      return _lastMessage;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<chat.ChatMessage?> sendAudioMessage({
    required File file,
    required String chatId,
    required chat.ChatMessage message,
  }) async {
    try {
      chat.ChatMessage? _lastMessage;

      String _id = Helpers.generateId(25);

      message.id = _id;
      message.medias = [];
      message.customProperties = {};
      message.user.customProperties = {};
      message.status = chat.MessageStatus.received;

      final String timestamp = DateTime.now().microsecondsSinceEpoch.toString();

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/chats/audio/$timestamp');

      await storageRef.putFile(
        file,
        SettableMetadata(
          contentType: 'video/mp4',
        ),
      );

      final String mediaUrl = await storageRef.getDownloadURL();

      final media = chat.ChatMedia(
        url: mediaUrl,
        fileName: timestamp,
        type: chat.MediaType.audio,
      );

      message.medias?.add(media);

      message.medias?.first.customProperties = {};
      message.medias?.first.metadata = chat.Metadata();
      Map<String, dynamic> _message = message.toJson();

      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .collection(Collections.messages.name)
          .doc(_id)
          .set(_message);

      _lastMessage = chat.ChatMessage.fromJson(_message);

      return _lastMessage;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> seenMessage(
      {required String chatId, required String messageId}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .collection(Collections.messages.name)
          .doc(messageId)
          .update({'status': 'read'});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateLastMessage(
      {required String chatId, required previousId}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .collection(Collections.messages.name)
          .doc(previousId)
          .update({'customProperties.isLast': false});

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteMessage(
      {required String chatId, required String messageId}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .collection(Collections.messages.name)
          .doc(messageId)
          .delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class IMessageRemoteDataProvider {
  Future<bool> seenMessage({required String chatId, required String messageId});
  Future<chat.ChatMessage?> sendMessage(
      {required String chatId, required chat.ChatMessage message});
  Future<chat.ChatMessage?> sendMultimediaMessages({
    required String chatId,
    required List<MultimediaMessage> messages,
  });
  Future<chat.ChatMessage?> sendAudioMessage({
    required File file,
    required String chatId,
    required chat.ChatMessage message,
  });
  Future<bool> updateLastMessage({required String chatId, required previousId});
  Future<bool> deleteMessage(
      {required String chatId, required String messageId});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateMessageStream(
      {required String chatId});
}
