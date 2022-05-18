import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/widgets/story.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';

class ViewUserStory extends StatefulWidget {
  final int timeElasped;
  final bool isOwnerViewing;
  final UserStory userStory;
  final StoryBloc storyBloc;
  ViewUserStory({
    Key? key,
    required this.storyBloc,
    required this.userStory,
    required this.timeElasped,
    required this.isOwnerViewing,
  }) : super(key: key);

  ViewUserStoryState createState() => ViewUserStoryState();
}

class ViewUserStoryState extends State<ViewUserStory> {
  int _currentStotyIndex = 0;
  late AnimationController _controller;
  int get _timeElasped => widget.timeElasped;
  StoryBloc get _storyBloc => widget.storyBloc;
  UserStory get _userStory => widget.userStory;
  User? _user = FirebaseAuth.instance.currentUser;
  bool get _isOwnerViewing => widget.isOwnerViewing;
  PageController _pageController = PageController();

  @override
  void initState() {
    print(_userStory);
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

  void _deleteStory(BuildContext context, BuildContext ancestorCtx) {
    final _isLast =
        _storyBloc.state.stories.userStory.story?.content.length == 1;

    final _story = _userStory.story?.content[_currentStotyIndex];

    _storyBloc.add(StoryEvent.deleteStory(
        isLast: _isLast,
        userId: _user?.uid as String,
        story: _story as StoryContent));

    Navigator.pop(context);
    Navigator.pop(ancestorCtx);
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
          if (state.action == StoryListenableAction.deleted) {
            getIt<AppRouter>().pop();
            _storyBloc
                .add(StoryEvent.loadStories(userId: _user?.uid as String));
          }

          if (state.action == StoryListenableAction.deteleFailure) {
            getIt<AppRouter>().context.showToast(
                content: Text("Unable to delete story",
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
        icon: Icon(Icons.more_horiz),
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
                    new DateTime.fromMicrosecondsSinceEpoch(_timeElasped)
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
          this.setState(() {
            _currentStotyIndex++;
          });
          Navigator.of(context).pop();
        },
        onFlashBack: () {
          this.setState(() {
            _currentStotyIndex--;
          });
        },
        momentCount: story!.content.length,
        momentDurationGetter: (idx) => Duration(seconds: 3),
        momentBuilder: (context, idx) => CachedNetworkImage(
            imageUrl: story.content[idx].media.url,
            progressIndicatorBuilder:
                ((BuildContext ctx, String _, DownloadProgress __) => SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            backgroundColor: Colors.grey[800],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.amber,
                            )))))));
  }

  Widget _storyOptionSheet(BuildContext context, BuildContext ancestorCtx) {
    return Wrap(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              tileColor: HexColor('#1B1B1B'),
              leading: Text('   Delete', style: TextStyle(fontSize: 17)),
              onTap: () => _deleteStory(context, ancestorCtx)))
    ]);
  }
}
