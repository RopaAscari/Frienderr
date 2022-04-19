import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/widgets/story.dart';
import 'package:frienderr/features/presentation/widgets/like_button.dart';

class ViewUserStory extends StatefulWidget {
  final int timeElasped;
  final dynamic stories;
  final dynamic storyUser;
  final bool isOwnerViewing;
  final int currentPosition;
  ViewUserStory(
      {Key? key,
      required this.stories,
      required this.storyUser,
      required this.timeElasped,
      required this.isOwnerViewing,
      required this.currentPosition})
      : super(key: key);

  UserStoryState createState() => UserStoryState();
}

class UserStoryState extends State<ViewUserStory> {
  late AnimationController _controller;
  dynamic get stories => widget.stories;
  dynamic get storyUser => widget.storyUser;
  dynamic get timeElasped => widget.timeElasped;
  bool get isOwnerViewing => widget.isOwnerViewing;
  PageController _pageController = PageController();

  @override
  void initState() {
    print(widget.currentPosition);
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
          child: CubePageView.builder(
            itemCount: stories.length,
            controller: _pageController,
            itemBuilder: (cubeCtx, index, notifier) {
              final Matrix4 transform = Matrix4.identity();
              final t = (index - notifier).abs();
              final double? scale = lerpDouble(1.5, 0, t);

              transform.scale(scale, scale);

              return CubeWidget(
                  index: index,
                  pageNotifier: notifier,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dy < 0) {
                        _storySlideUpAction();
                      } else if (details.delta.dy > 0) {
                        Navigator.of(cubeCtx).pop();
                      }
                    },
                    child: Stack(
                      children: [
                        _storyDisplay(index, cubeCtx),
                        _storyTextField(),
                      ],
                    ),
                  ));
            },
          ),
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

  Widget _storyDisplay(int index, BuildContext cubeCtx) {
    final story = stories[index];
    return Story(
      onInitialize: (controller) => _controller = controller,
      onFlashForward: () {
        if (index == stories.length - 1) {
          Navigator.of(cubeCtx).pop();
        } else {
          _pageController.nextPage(
              duration: Duration(seconds: 1), curve: Curves.ease);
        }
      },
      // onFlashBack: Navigator.of(context).pop,
      momentCount: story['content'].length,
      momentDurationGetter: (idx) => Duration(seconds: 3),
      momentBuilder: (context, idx) => CachedNetworkImage(
          imageUrl: story['content'][idx]['media'],
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

  Widget _storyTextField() {
    return Positioned(
        bottom: 10,
        left: 20,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width * .80,
            child: TextField(
              onTap: () => _controller.stop(),
              decoration: new InputDecoration(
                filled: true, label: Text('Reply to story'),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey[600]!),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                fillColor: HexColor('#9C9C9C').withOpacity(0.1),
                //  contentPadding: const EdgeInsets.only(top: 40.0),
                errorStyle: TextStyle(height: 0.7, color: Colors.red),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              child: IconButton(
                  color: Colors.grey[500],
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Constants.sharePostIconOutline1,
                    width: 25,
                    height: 25,
                    color: Colors.grey[400],
                  )))
        ]));
  }
}
