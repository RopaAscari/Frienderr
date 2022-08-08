import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/video_service.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';
import 'package:frienderr/features/presentation/widgets/image_loading_indicator.dart';

class VideoScreen extends StatefulWidget {
  final String video;
  final Function(VideoPlayerController videoPlayerController) onInitialized;
  const VideoScreen(
      {Key? key, required this.video, required this.onInitialized})
      : super(key: key);

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  final Late<VideoPlayerController> _videoPlayerController = Late();
  @override
  void initState() {
    _initializeController();
    super.initState();
  }

  void _initializeController() async {
    _videoPlayerController.value = await getService<VideoControllerService>()
        .getControllerForVideo(widget.video);

    await _videoPlayerController.value.initialize();

    //_videoPlayerController.value.setVolume(0.0);

    widget.onInitialized(_videoPlayerController.value);

    _videoPlayerController.value.play();
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.value.pause().then((value) {
      _videoPlayerController.value.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Key key = Key('video');
    return Scaffold(
        body: Stack(fit: StackFit.loose, children: [
      VisibilityDetector(
          key: key,
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;

            if (_videoPlayerController.value.value.isInitialized) {
              if (visiblePercentage > 50) {
                setState(() {
                  _videoPlayerController.value.play();
                });
              } else {
                setState(() {
                  _videoPlayerController.value.pause();
                });
              }
            }
          },
          child: _videoPlayerController.isInitialized
              ? Stack(
                  alignment: _videoPlayerController.value.value.isPlaying
                      ? AlignmentDirectional.bottomStart
                      : AlignmentDirectional.center,
                  children: <Widget>[
                    Center(
                      child: AspectRatio(
                        aspectRatio:
                            _videoPlayerController.value.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController.value),
                      ),
                    ),
                    IconButton(
                      iconSize: _videoPlayerController.value.value.isPlaying
                          ? 20
                          : 50,
                      onPressed: () {
                        setState(() {
                          _videoPlayerController.value.value.isPlaying
                              ? _videoPlayerController.value.pause()
                              : _videoPlayerController.value.play();
                        });
                      },
                      icon: Icon(
                        _videoPlayerController.value.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        // size: 60,
                      ),
                    ),
                  ],
                )
              : const Center(child: ImageLoadingIndicator())),
    ]));
  }
}
