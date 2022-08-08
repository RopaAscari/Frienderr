import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/video_service.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';

class StoryVideoDisplay extends StatefulWidget {
  const StoryVideoDisplay({Key? key, required this.story, required this.user})
      : super(key: key);

  final Story story;
  final UserModel user;

  @override
  State<StoryVideoDisplay> createState() => _StoryVideoDisplayState();
}

class _StoryVideoDisplayState extends State<StoryVideoDisplay> {
  String get username => widget.story.user.username;
  bool get isStoryOwner => widget.story.user.id == widget.user.id;
  String get profilePic => isStoryOwner
      ? widget.user.profilePic!
      : widget.story.user.profilePic ?? '';
  String get displayName => isStoryOwner ? 'You' : username;
  StoryMedia get media => widget.story.content.first.media;

  List<Color> get colors => isStoryOwner
      ? [Colors.grey.withOpacity(0.7), Colors.grey.withOpacity(0.7)]
      : [
          HexColor('#FA5B8E').withOpacity(0.7),
          HexColor('#FCA28E').withOpacity(0.7)
        ];

  bool get _isViewed =>
      widget.story.content[widget.story.content.length - 1].isViewed;
  double get _opacity => _isViewed ? 0.5 : 1;

  final Late<VideoPlayerController> _videoPlayerController = Late();

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() async {
    _videoPlayerController.value = await getService<VideoControllerService>()
        .getControllerForVideo(media.url);

    await _videoPlayerController.value.initialize();

    _videoPlayerController.value.setVolume(0.0);

    _videoPlayerController.value.play();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Opacity(
          opacity: 1,
          child: Material(
              elevation: 20,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 250,
                      width: 145,
                      child: _videoPlayerController.isInitialized
                          ? VideoPlayer(_videoPlayerController.value)
                          : const Center(),
                    ),
                  ),
                  _buildStoryAvatar()
                ],
              ))),
    );
  }

  Widget _buildStoryAvatar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: 75,
              height: 75,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: _isViewed
                          ? [
                              Colors.grey[300]!.withOpacity(0.3),
                              Colors.grey[300]!.withOpacity(0.3)
                            ]
                          : colors)),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: CachedNetworkImage(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 0, 0, 0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    imageUrl: profilePic,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ))),
          Padding(
            child: Text(' $displayName',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.4),
                    fontWeight: FontWeight.bold)),
            padding: const EdgeInsets.only(top: 3),
          )
        ],
      ),
    );
  }
}
