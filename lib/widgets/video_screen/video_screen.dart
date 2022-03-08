import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String video;
  VideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.video);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ///_controller.play();
    });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //_controller.play();
            return Stack(fit: StackFit.loose, children: [
              GestureDetector(
                  child: VideoPlayer(_controller),
                  onTap: () => setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      })),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
