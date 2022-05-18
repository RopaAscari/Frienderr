import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';

class PreviewQuickScreen extends StatefulWidget {
  final File file;
  final QuickBloc quickBloc;
  const PreviewQuickScreen(
      {Key? key, required this.quickBloc, required this.file})
      : super(key: key);

  @override
  State<PreviewQuickScreen> createState() => _PreviewQuickScreenState();
}

class _PreviewQuickScreenState extends State<PreviewQuickScreen> {
  File get _file => widget.file;
  late VideoPlayerController _controller;
  QuickBloc get _quickBloc => widget.quickBloc;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  initState() {
    _controller = VideoPlayerController.file(_file);
    _initializeVideoPlayerFuture = _controller.initialize();
    //  _controller.play();
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToPostQuick() {
    getIt<AppRouter>().push(PostQuickRoute(file: _file, quickBloc: _quickBloc));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [_quickDisplay(), _headerOptions()],
                ))));
  }

  Widget _headerOptions() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            onPressed: () => getIt<AppRouter>().pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          MaterialButton(
              height: 30,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(color: Colors.white)),
              onPressed: () {
                _navigateToPostQuick();
              },
              child: const Text('Next', style: TextStyle(color: Colors.black))),
        ]));
  }

  Widget _quickDisplay() {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LayoutBuilder(
                builder: (context, constraints) => AspectRatio(
                      aspectRatio: constraints.maxWidth / constraints.maxHeight,
                      child: VideoPlayer(_controller),
                    ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
