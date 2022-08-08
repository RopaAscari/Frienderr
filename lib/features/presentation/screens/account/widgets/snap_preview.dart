import 'package:flutter/material.dart';

import 'package:visibility_detector/visibility_detector.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class SnapPreview extends StatefulWidget {
  const SnapPreview({Key? key, required this.snap, required this.index})
      : super(key: key);

  final int index;
  final Snap snap;
  @override
  State<SnapPreview> createState() => _SnapPreviewState();
}

class _SnapPreviewState extends State<SnapPreview> {
  late final CachedVideoPlayerController _controller;

  @override
  void initState() {
    _initializeController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeController() async {
    _controller = CachedVideoPlayerController.network(widget.snap.url);
    await _controller.initialize();

    setState(() {});

    _controller.setVolume(0.0);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key('${widget.index}'),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;

          if (_controller.value.isInitialized) {
            if (visiblePercentage > 50) {
              _controller.play();
            } else {
              _controller.pause();
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: 170,
              height: 270,
              child: LayoutBuilder(
                  builder: (context, constraints) => ConditionalRenderDelegate(
                      condition: _controller.value.isInitialized,
                      renderWidget: AspectRatio(
                        aspectRatio:
                            constraints.maxWidth / constraints.maxHeight,
                        child: CachedVideoPlayer(_controller),
                      ),
                      fallbackWidget: Container())),
            ),
          ),
        ));
  }
}
