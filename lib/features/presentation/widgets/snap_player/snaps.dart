import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/presentation/widgets/user_avatar.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/like_button.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/option_button.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/share_button.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/comment/comment_button.dart';

class Snaps extends StatefulWidget {
  final Snap snap;
  final BlocGroup blocGroup;
  final VideoPlayerController controller;
  final PageController? pageController;
  const Snaps({
    Key? key,
    required this.snap,
    required this.blocGroup,
    required this.controller,
    this.pageController,
  }) : super(key: key);

  @override
  State<Snaps> createState() => _SnapsState();
}

class _SnapsState extends State<Snaps> with TickerProviderStateMixin {
  Snap get _snap => widget.snap;
  late AnimationController _animationController;
  BlocGroup get _blocGroup => widget.blocGroup;

  final AnimationBloc animationBloc = AnimationBloc();
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    widget.controller.addListener(_checkIfVideoIsFinishedPlaying);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _checkIfVideoIsFinishedPlaying() async {
    // Implement your calls inside these conditions' bodies :
    if (widget.controller.value.isInitialized) {
      if (widget.controller.value.position ==
          widget.controller.value.duration) {
        if (widget.pageController != null) {
          //  await widget.carouselController?.nextPage();
        }
      }
    }
  }

  void _viewPostComments() {
    _pauseVideo();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Padding(
                padding: MediaQuery.of(ctx).viewInsets, child: Center()),
          );
        }).whenComplete(() {
      _playVideo();
    });
    ;
  }

  void _openCamera() {}

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
    /* flareControls.play("Like");
    Timer(const Duration(milliseconds: 1200), () {
      flareControls.play("IdleUnlike");
    });*/
  }

  Future<void> _getControllerFuture() async {
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _quickPlayer(),
    );
  }

  Widget _quickPlayer() {
    return Stack(children: [
      _videoPlayer(),
      _interactionHelper(),
      Positioned(
          child: SnapOptionButton(blocGroup: _blocGroup, snap: _snap),
          bottom: 50,
          right: 10),
      _userAvatar(),
    ]);
  }

  Widget _videoPlayer() {
    return GestureDetector(
        onDoubleTap: () => _determineLikeAction(),
        onLongPress: () => _pauseVideo(),
        onTap: () => _toggleVideoPlayerState(),
        onLongPressEnd: (gestureDetails) => _playVideo(),
        child: LayoutBuilder(
          builder: (context, constraints) => AspectRatio(
            aspectRatio: constraints.maxWidth / constraints.maxHeight,
            child: VideoPlayer(widget.controller),
          ),
        ));
  }

  Widget _userAvatar() {
    _snap.user.username;
    return Positioned(
        bottom: 30,
        left: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                  leading: UserAvatar(
                    blocGroup: _blocGroup,
                    avatarUserId: _snap.user.id,
                    profilePic: _snap.user.profilePic ?? "",
                  ),
                  title: Text(_snap.user.username,
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(1.4))),
                  subtitle: Text('Public',
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(1.4))))),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(_snap.caption,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
          )
        ]));
  }

  Widget _interactionHelper() {
    return Positioned(
        right: 15,
        bottom: MediaQuery.of(context).size.height * .20,
        child: Column(children: [
          SnapLikeButton(
              snap: _snap,
              blocGroup: _blocGroup,
              animationController: _animationController),
          SnapCommentButton(
            snap: _snap,
            blocGroup: _blocGroup,
            controller: widget.controller,
          ),
          SnapShareButton(
            snap: _snap,
            blocGroup: _blocGroup,
          ),
        ]));
  }
}
