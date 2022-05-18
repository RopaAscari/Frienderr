import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/widgets/asset_image_fullscreen.dart';
import 'package:frienderr/features/presentation/widgets/asset_video_fullscreen.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AssetThumbnail extends StatefulWidget {
  const AssetThumbnail(
      {Key? key,
      required this.asset,
      required this.index,
      required this.cameraMode,
      required this.isMutliSelecting,
      required this.fetchSelectedAssets,
      required this.currentSelectedIndex,
      required this.removeSelectedAssets})
      : super(key: key);

  final int index;
  final AssetEntity asset;
  final bool isMutliSelecting;
  final int currentSelectedIndex;
  final CameraSelectionMode cameraMode;
  final ValueSetter<GalleryAsset> fetchSelectedAssets;
  final ValueSetter<GalleryAsset> removeSelectedAssets;

  @override
  AssetThumbnailState createState() => AssetThumbnailState();
}

class AssetThumbnailState extends State<AssetThumbnail> {
  dynamic selectedAsset;
  int get index => widget.index;
  List<dynamic> selectedAssets = [];
  AssetEntity get asset => widget.asset;
  bool get isMutliSelecting => widget.isMutliSelecting;
  CameraSelectionMode get _cameraMode => widget.cameraMode;
  int get currentSelectedIndex => widget.currentSelectedIndex;
  ValueSetter<GalleryAsset> get fetchSelectedAssets =>
      widget.fetchSelectedAssets;
  ValueSetter<GalleryAsset> get removeSelectedAssets =>
      widget.removeSelectedAssets;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _selectAsset() async {
    final _asset = await asset.file as File;
    final _thumbnail = await asset.thumbnailData as Uint8List;
    if (isMutliSelecting) {
      if (selectedAsset != index) {
        setState(() {
          selectedAsset = index;
          fetchSelectedAssets(GalleryAsset(
            id: index,
            asset: _asset,
            type: asset.type,
            thumbnail: _thumbnail,
            duration: asset.duration,
          ));
        });
      } else {
        setState(() {
          selectedAsset = null;
          removeSelectedAssets(GalleryAsset(
            id: index,
            asset: _asset,
            type: asset.type,
            thumbnail: _thumbnail,
            duration: asset.duration,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              final Future<File?> _file = asset.file;
              if (asset.type == AssetType.image) {
                return AssetImageFullscreen(file: _file);
              } else {
                return AssetVideoFullscreen(file: _file);
              }
            },
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return _thumbnailDisplay();
            }));
  }

  Widget _videoDisplay() {
    if (asset.type == AssetType.video) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Center();
    }
  }

  Widget _selectButton() {
    if (isMutliSelecting) {
      return Positioned(
          top: 0,
          right: 0,
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                  onTap: () => _selectAsset(),
                  child: ConditionalRenderDelegate(
                    condition: selectedAsset != index,
                    renderWidget: Icon(
                      Icons.circle,
                      size: 30,
                      color: Colors.grey[350],
                    ),
                    fallbackWidget: Container(
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(
                          '', //  '$currentSelectedIndex',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100))),
                  ))));
    } else {
      return Center();
    }
  }

  Widget _thumbnailDisplay() {
    return Opacity(
        opacity: isMutliSelecting ? .8 : 1,
        child: Stack(children: [
          AssetEntityImage(
            asset,
            width: 200,
            height: 200,
            isOriginal: true,
            fit: BoxFit.cover,
            thumbnailFormat: ThumbnailFormat.jpeg, // Defaults to `jpeg`.
          ),
          _selectButton(),
          _videoDisplay()
        ]));
  }
}
