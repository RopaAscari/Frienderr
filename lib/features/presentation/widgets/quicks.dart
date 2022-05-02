import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:video_player/video_player.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/presentation/screens/camera.dart';
import 'package:frienderr/features/presentation/widgets/like_button.dart';
import 'package:frienderr/features/presentation/widgets/share_button.dart';
import 'package:frienderr/features/presentation/widgets/like_animation.dart';
import 'package:frienderr/features/presentation/widgets/comment_button.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

const placeholder =
    'https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/profilePic%2F1630100635730018?alt=media&token=7966756a-9095-4cbb-b981-6a9524f36c0a';

const caption = 'This is an exmaple of my quick caption...Neat huh!';

class Quicks extends StatefulWidget {
  final VideoPlayerController controller;
  const Quicks({Key? key, required this.controller}) : super(key: key);

  @override
  State<Quicks> createState() => _QuicksState();
}

class _QuicksState extends State<Quicks> {
  FlareControls flareControls = FlareControls();
  final AnimationBloc animationBloc = new AnimationBloc();
  @override
  void initState() {
    super.initState();
    if (widget.controller.value.isInitialized) {
      // NOTE TO INVESTIGATE FEASIBILITY OF EXECUTING SOME LOGIC TO FACILITATE THE IMPLEMNTATION OF A FUTURE BUILDER
    }
  }

  @override
  void dispose() {
    super.dispose();
    // widget.controller.dispose();
  }

  void _openComments() {
    _pauseVideo();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setPopupState) {
            return _commentPopup();
          });
        }).whenComplete(() {
      _playVideo();
    });
  }

  void _openCamera() {
    /*Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CameraScreen(
                mode: CameraSelectionMode.Post,
              )))*/
  }

  void _toggleVideoPlayerState() {
    if (widget.controller.value.isPlaying) {
      _pauseVideo();
    } else {
      _playVideo();
    }
  }

  void _playVideo() => widget.controller.play();

  void _pauseVideo() => widget.controller.pause();

  void _determineLikeAction() {
    flareControls.play("Like");
    Timer(Duration(milliseconds: 1200), () {
      flareControls.play("IdleUnlike");
    });
  }

  Future<void> _getControllerFuture() async {
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ConditionalRenderDelegate(
            condition: widget.controller.value.isInitialized,
            renderWidget: _quickPlayer(),
            fallbackWidget: Center(child: CircularProgressIndicator())));
  }

  Widget _quickPlayer() {
    return LikeAnimation(
        flareControls: flareControls,
        child: GestureDetector(
            onDoubleTap: () => _determineLikeAction(),
            onLongPress: () => _pauseVideo(),
            onTap: () => _toggleVideoPlayerState(),
            onLongPressEnd: (gestureDetails) => _playVideo(),
            child: Stack(children: [
              _videoPlayer(),
              _headerWidget(),
              _interactionHelper(),
              _userAvatar()
            ])));
  }

  Widget _videoPlayer() {
    return LayoutBuilder(
        builder: (context, constraints) => ConditionalRenderDelegate(
            condition: widget.controller.value.isInitialized,
            renderWidget: AspectRatio(
              aspectRatio: constraints.maxWidth / constraints.maxHeight,
              child: VideoPlayer(widget.controller),
            ),
            fallbackWidget: Container()));
  }

  Widget _commentPopup() {
    return Container(
        decoration: BoxDecoration(
            color: HexColor(
              '#141413',
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .5,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Comments', style: TextStyle(fontSize: 17))])));
  }

  Widget _userAvatar() {
    return Positioned(
        bottom: 30,
        left: 20,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(placeholder)),
                  title: Text('John Blake'),
                  subtitle: Text('Public'))),
          Text('\n$caption')
        ]));
  }

  Widget _headerWidget() {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () => _openCamera(),
              icon: Icon(CupertinoIcons.camera, color: Colors.white, size: 25)),
          Text('Quicks',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal))
        ]));
  }

  Widget _interactionHelper() {
    return Positioned(
        right: 15,
        bottom: MediaQuery.of(context).size.height * .30,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 19),
            child: AppLikeButton(
                size: 40,
                likeCount: 0,
                hideCount: false,
                color: Colors.grey[100]!,
                onLike: () => _determineLikeAction()),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 19),
              child: CommentButton(
                  size: 35,
                  commentCount: 0,
                  color: Colors.grey[100]!,
                  onComment: () => _openComments())),
          Padding(
              padding: const EdgeInsets.only(top: 19),
              child: ShareButton(
                size: 35,
                sharerCount: 0,
                color: Colors.grey[100]!,
                onShare: () => null,
              ))
        ]));
  }
}
