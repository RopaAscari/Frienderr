import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';

class TimelinePosts extends StatefulWidget {
  final PostBloc postBloc;
  final ScrollController scrollController;
  const TimelinePosts(
      {Key? key, required this.postBloc, required this.scrollController})
      : super(key: key);

  @override
  State<TimelinePosts> createState() => _TimelinePostsState();
}

class _TimelinePostsState extends State<TimelinePosts> {
  bool isUserCaughtUp = false;
  PostBloc get _postBloc => widget.postBloc;
  FlareControls flareControls = FlareControls();
  User? user = FirebaseAuth.instance.currentUser;
  ScrollController get _scrollController => widget.scrollController;

  @override
  void initState() {
    super.initState();
    listenToTimelineUpdates();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (isUserCaughtUp == false) {
        fetchPaginatedPosts();
      }
    }
  }

  void fetchPaginatedPosts() async {
    if (isUserCaughtUp == true) {
      return;
    }
    _postBloc.add(const PostEvent.fetchPaginatedTimelinePosts());
  }

  void listenToTimelineUpdates() => _postBloc.timeline.listen((event) {
        setState(() {});
      });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
        bloc: _postBloc,
        listener: (
          BuildContext context,
          PostState state,
        ) {
          if (state.currentState == PostStatus.loaded) {
            setState(() {
              isUserCaughtUp = state.timelinePosts.userCaughtUp;
            });
          }
          if (state.action == PostListenableAction.created) {
            _postBloc
                .add(const PostEvent.fetchTimelinePosts(shouldLoad: false));
            getIt<AppRouter>().context.dismissToast();
          }

          if (state.action == PostListenableAction.failure) {
            getIt<AppRouter>().context.showToast(
                content: const Text('Post failed',
                    style: TextStyle(color: Colors.white)),
                type: SnackBarType.error);
          }
        },
        builder: (
          BuildContext context,
          PostState state,
        ) {
          switch (state.currentState) {
            case PostStatus.loading:
              return _timelineLoading();
            case PostStatus.error:
              return _timelineError(state.error);
            case PostStatus.loaded:
              return _timelinePostList(state.timelinePosts);
            default:
              return const Center();
          }
        });
  }

  Widget _timelineError(String error) {
    return ErrorDisplay(error: error);
  }

  Widget _timelineLoading() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80,
        child: const Center(
            child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }

  Widget _timelinePostList(TimelineResponse timelineResponse) {
    if (timelineResponse.posts.isEmpty) {
      return _emptyTimeline();
    }

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: timelineResponse.posts.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return const Center();
      },
      itemBuilder: (BuildContext context, int index) {
        final postUserId = timelineResponse.posts[index].user.id;

        if (index == timelineResponse.posts.length - 1) {
          return _trailingPost(timelineResponse);
        }
        return RenderPost(
          postBloc: _postBloc,
          post: timelineResponse.posts[index],
          isPostOwner: postUserId == user?.uid,
        );
      },
    );
  }

  Widget _trailingPost(TimelineResponse timeline) {
    return Flex(direction: Axis.vertical, children: [
      RenderPost(
        postBloc: _postBloc,
        post: timeline.posts[0],
        isPostOwner: timeline.posts[0].user.id == user?.uid,
      ),
      _userCaughtUp(timeline)
    ]);
  }

  Widget _userCaughtUp(TimelineResponse timeline) {
    Key key = const Key('user-caught-up');
    return SizedBox(
        height: 400,
        key: key,
        child: Center(
            child: VisibilityDetector(
                key: key,
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;

                  if (visiblePercentage == 100) {
                    flareControls.play('Animations');
                  }
                },
                child: Column(children: [
                  SizedBox(
                      width: 200,
                      height: 300,
                      child: FlareActor(
                        Constants.caughtUpAnimation,
                        controller: flareControls,
                      )),
                  Text('You are at the end of your journey',
                      style: TextStyle(
                          fontSize: const AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  GestureDetector(
                      onTap: () {
                        _scrollController.animateTo(0.0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        fetchPaginatedPosts();
                      },
                      child: Text('\nReturn to top',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              fontSize: const AdaptiveTextSize()
                                  .getAdaptiveTextSize(context, 10))))
                ]))));
  }

  Widget _emptyTimeline() {
    return SizedBox(
      child: const Center(
        child: Text(
          "No new posts on your feed",
          style: TextStyle(fontSize: 13),
        ),
      ),
      height: MediaQuery.of(context).size.height * .60,
    );
  }
}
