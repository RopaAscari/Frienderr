import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AssetVideoFullscreen extends StatefulWidget {
  final Future<File?> file;
  const AssetVideoFullscreen({Key? key, required this.file}) : super(key: key);

  @override
  State<AssetVideoFullscreen> createState() => _AssetVideoFullscreenState();
}

class _AssetVideoFullscreenState extends State<AssetVideoFullscreen> {
  late VideoPlayerController _controller;

  @override
  initState() {
    _initializeVideoPlayer();
    super.initState();
  }

  Future<void> _initializeVideoPlayer() async {
    final File? file = await widget.file;
    _controller = VideoPlayerController.file(file as File)
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
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy > 0) {
            Navigator.pop(context);
          }
        },
        child: ConditionalRenderDelegate(
            condition: _controller.value.isInitialized,
            renderWidget: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child:
                  Stack(children: [VideoPlayer(_controller), _headerWidget()]),
            ),
            fallbackWidget: Center(child: CircularProgressIndicator())));
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
      child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 25)),
    );
  }
}
