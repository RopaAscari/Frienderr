import 'package:photo_manager/photo_manager.dart';

class GalleryAsset {
  final int id;
  final AssetType type;
  final AssetEntity asset;
  GalleryAsset({
    required this.id,
    required this.type,
    required this.asset,
  });
}
