import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/widgets/story.dart';

class ViewUserStory extends StatefulWidget {
  final int timeElasped;
  final bool isOwnerViewing;
  final UserStory userStory;
  ViewUserStory({
    Key? key,
    required this.userStory,
    required this.timeElasped,
    required this.isOwnerViewing,
  }) : super(key: key);

  ViewUserStoryState createState() => ViewUserStoryState();
}

class ViewUserStoryState extends State<ViewUserStory> {
  late AnimationController _controller;
  int get timeElasped => widget.timeElasped;
  UserStory get userStory => widget.userStory;
  bool get isOwnerViewing => widget.isOwnerViewing;
  PageController _pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        //  _pageController.jumpToPage(
        //    widget.currentPosition,
        //);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _storySlideUpAction() {
    _controller.stop();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return _storyViewerList();
      },
    ).whenComplete(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _storyDisplay(userStory.story),
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }

  AppBar _appBar() {
    return AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
                TimeElapsed.elapsedTimeDynamic(
                    new DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                        .toString()),
                style: TextStyle(fontSize: 15))),
        actions: <Widget>[
          IconButton(
              iconSize: 27,
              icon: Icon(CupertinoIcons.eye),
              onPressed: () => _storySlideUpAction())
        ]);
  }

  Widget _storyViewerList() {
    return Container(
      height: 300,
      child: Container(
          child: Column(children: [
        Text('\nViewers',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 20))
      ])),
    );
  }

  Widget _storyDisplay(StoryModel? story) {
    return Story(
      onInitialize: (controller) => _controller = controller,
      onFlashForward: () {
        Navigator.of(context).pop();
      },
      // onFlashBack: Navigator.of(context).pop,
      momentCount: story!.content.length,
      momentDurationGetter: (idx) => Duration(seconds: 3),
      momentBuilder: (context, idx) => CachedNetworkImage(
          imageUrl: story.content[idx].media.url,
          progressIndicatorBuilder:
              ((BuildContext ctx, String _, DownloadProgress __) {
            return SizedBox(
                width: 40,
                height: 40,
                child: Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        backgroundColor: Colors.grey[800],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.amber,
                        ))));
          })),
    );
  }
}
