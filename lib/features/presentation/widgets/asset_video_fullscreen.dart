import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AssetVideoFullscreen extends StatefulWidget {
  final File file;
  final Function(List<GalleryAsset>) onSelected;
  const AssetVideoFullscreen(
      {Key? key, required this.file, required this.onSelected})
      : super(key: key);

  @override
  State<AssetVideoFullscreen> createState() => _AssetVideoFullscreenState();
}

class _AssetVideoFullscreenState extends State<AssetVideoFullscreen> {
  late CachedVideoPlayerController _controller;

  @override
  initState() {
    _initializeVideoPlayer();
    super.initState();
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = CachedVideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    ;
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy > 0) {
                Navigator.pop(context);
              }
            },
            child: ConditionalRenderDelegate(
                condition: _controller.value.isInitialized,
                renderWidget: LayoutBuilder(
                    builder: (context, constraints) => AspectRatio(
                          aspectRatio:
                              constraints.maxWidth / constraints.maxHeight,
                          child: Stack(children: [
                            CachedVideoPlayer(_controller),
                            _headerWidget()
                          ]),
                        )),
                fallbackWidget:
                    const Center(child: CircularProgressIndicator()))),
      ),
    );
  }

  Widget _buildNextButton() {
    return MaterialButton(
        height: 31,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: Colors.white)),
        onPressed: () {
          widget.onSelected([
            GalleryAsset(
              id: '0',
              asset: widget.file,
              type: AssetType.video,
            )
          ]);
        },
        child: Text('Next',
            style: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.45))));
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.white, size: 25)),
          _buildNextButton()
        ],
      ),
    );
  }
}
