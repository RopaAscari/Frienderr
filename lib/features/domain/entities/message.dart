import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';

class MultimediaMessage {
  ChatMessage message;
  GalleryAsset asset;
  MultimediaMessage({
    required this.message,
    required this.asset,
  });
}
