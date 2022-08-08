import 'dart:io';
import 'dart:typed_data';
import 'package:photo_manager/photo_manager.dart';

class GalleryAsset {
  final String id;
  final File asset;
  final int? duration;
  final AssetType type;
  final Uint8List? thumbnail;

  GalleryAsset({
    this.duration,
    this.thumbnail,
    required this.id,
    required this.type,
    required this.asset,
  });
}
