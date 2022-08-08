import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/widgets/story.dart'
    as storyViewer;
import 'package:frienderr/features/presentation/widgets/story/story_viewer_list.dart';

class ViewUserStory extends StatefulWidget {
  final int timeElasped;
  final bool isOwnerViewing;
  final UserStory userStory;
  final StoryBloc storyBloc;
  const ViewUserStory({
    Key? key,
    required this.storyBloc,
    required this.userStory,
    required this.timeElasped,
    required this.isOwnerViewing,
  }) : super(key: key);

  ViewUserStoryState createState() => ViewUserStoryState();
}

class ViewUserStoryState extends State<ViewUserStory> {
  int _currentStoryIndex = 0;
  late AnimationController _controller;
  int get _timeElasped => widget.timeElasped;
  StoryBloc get _storyBloc => widget.storyBloc;
  UserStory get _userStory => widget.userStory;
  bool get _isOwnerViewing => widget.isOwnerViewing;
  final User? _user = FirebaseAuth.instance.currentUser;
  final PageController _pageController = PageController();
  final Late<VideoPlayerController> _videoPlayerController = Late();
  @override
  void initState() {
    print(_userStory);
    WidgetsBinding.instance.addPostFrameCallback((_) {
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

  void _deleteStory(BuildContext context, BuildContext ancestorCtx) {
    final _isLast = _storyBloc.state.userStory.story?.content.length == 1;
    final _story = _userStory.story?.content[_currentStoryIndex];
    List<StoryContent>? content =
        _userStory.story?.content.map((x) => x).toList();

    content?.removeWhere((x) => x.id == _story?.id);

    _storyBloc.add(StoryEvent.deleteStory(
      isLast: _isLast,
      content: content,
      userId: _user?.uid as String,
    ));

    for (var context in [context, ancestorCtx]) {
      Navigator.pop(context);
    }
  }

  void _storySlideUpAction() {
    _controller.stop();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext ctx) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
              padding: MediaQuery.of(ctx).viewInsets,
              child: StoryViewerList(
                userId: _user!.uid,
                contentId:
                    _userStory.story?.content[_currentStoryIndex].id as String,
              )),
        );
      },
    ).whenComplete(() {
      _controller.forward();
    });
  }

  void _showStoryOptions(BuildContext ancestorCtx) {
    _controller.stop();
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return _storyOptionSheet(context, ancestorCtx);
        }).whenComplete(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoryBloc, StoryState>(
        bloc: _storyBloc,
        listener: (
          BuildContext context,
          StoryState state,
        ) {
          if (state.action == StoryListenableAction.deteleFailure) {
            getService<AppRouter>().context.showToast(
                content: const Text("Unable to delete story",
                    style: TextStyle(color: Colors.white)),
                type: SnackBarType.error);
          }
        },
        child: Scaffold(
          appBar: _appBar(),
          body: Center(
            child: SizedBox(
              child: _storyDisplay(_userStory.story),
              height: MediaQuery.of(context).size.height,
            ),
          ),
          extendBodyBehindAppBar: true,
          floatingActionButton: _storyOptions(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }

  Widget _storyOptions(BuildContext ancestorCtx) {
    return Align(
      child: IconButton(
        icon: const Icon(Icons.more_horiz),
        onPressed: () => _showStoryOptions(ancestorCtx),
      ),
      alignment: Alignment.bottomRight,
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
                    DateTime.fromMicrosecondsSinceEpoch(_timeElasped)
                        .toString()),
                style: const TextStyle(fontSize: 15))),
        actions: <Widget>[
          GestureDetector(
              child: Lottie.asset(
                Assets.lottie.eyeIcon,
                width: 30.0,
                height: 30.0,
              ),
              onTap: () {
                _storySlideUpAction();
              })
        ]);
  }

  Widget _storyDisplay(Story? story) {
    return storyViewer.Story(
        onInitialize: (controller) {
          _controller = controller;
        },
        onFlashForward: () {
          setState(() {
            _currentStoryIndex++;
          });
          Navigator.of(context).pop();
        },
        onFlashBack: () {
          setState(() {
            _currentStoryIndex--;
          });
        },
        momentCount: story!.content.length,
        momentDurationGetter: (idx) {
          return const Duration(seconds: 15);
        },
        momentBuilder: (context, idx) {
          if (story.content[idx].media.type == 'video') {
            // log('stopped');
            // _controller.stop();
            return VideoScreen(
              onInitialized: (videoController) {
                //_controller.forward();
                // _videoPlayerController.value = videoController;
              },
              video: story.content[idx].media.url,
            );
          } else {
            // _controller.stop();
          }

          return CachedNetworkImage(
              imageUrl: story.content[idx].media.url,
              progressIndicatorBuilder: ((BuildContext ctx, String _,
                      DownloadProgress __) =>
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              backgroundColor: Colors.grey[800],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.amber,
                              ))))));
        });
  }

  Widget _storyOptionSheet(BuildContext context, BuildContext ancestorCtx) {
    return Wrap(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              tileColor: HexColor('#1B1B1B'),
              leading: const Text('   Delete', style: TextStyle(fontSize: 14)),
              onTap: () => _deleteStory(context, ancestorCtx)))
    ]);
  }
}
