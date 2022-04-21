import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';

class TimelinePosts extends StatefulWidget {
  final TimelineBloc timelineBloc;
  final ScrollController scrollController;
  const TimelinePosts(
      {Key? key, required this.timelineBloc, required this.scrollController})
      : super(key: key);

  @override
  State<TimelinePosts> createState() => _TimelinePostsState();
}

class _TimelinePostsState extends State<TimelinePosts> {
  bool isUserCaughtUp = false;
  User? user = FirebaseAuth.instance.currentUser;
  TimelineBloc get _timelineBloc => widget.timelineBloc;
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
        //   fetchPaginatedPosts(_timelineBloc.state.timelinePosts);
      }
    }
  }

  void fetchPaginatedPosts(TimelineResponse timeline) async {
    if (timeline.userCaughtUp == true) {
      return;
    }
    //_timelineBloc
    //   .add(TimelineEvent.fetchPaginatedTimelinePosts(posts: timeline.posts));
  }

  void listenToTimelineUpdates() => _timelineBloc.timeline.listen((event) {
        this.setState(() => null);
      });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimelineBloc, TimelineState>(
        bloc: _timelineBloc,
        listener: (
          BuildContext context,
          TimelineState state,
        ) {},
        builder: (
          BuildContext context,
          TimelineState state,
        ) {
          switch (state.status) {
            case TimelineStatus.Loading:
              return _timelineLoading();
            case TimelineStatus.Error:
              return _timelineError(state.error);
            case TimelineStatus.Loaded:
              return _timelinePostList(state.timelinePosts);
            default:
              return Center();
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
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }

  Widget _timelinePostList(TimelineResponse timelineResponse) {
    if (timelineResponse.posts.length == 0) {
      return _emptyTimeline();
    }

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: timelineResponse.posts.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final postUserId = timelineResponse.posts[index].user.id;

        if (index == timelineResponse.posts.length - 1) {
          _trailingPost(timelineResponse);
        }
        return RenderPost(
          post: timelineResponse.posts[index],
          isPostOwner: postUserId == user?.uid,
        );
      },
    );
  }

  Widget _trailingPost(TimelineResponse timeline) {
    return Flex(direction: Axis.vertical, children: [
      RenderPost(
        post: timeline.posts[0],
        isPostOwner: timeline.posts[0].user.id == user?.uid,
      ),
      _userCaughtUp(timeline)
    ]);
  }

  Widget _userCaughtUp(TimelineResponse timeline) {
    return Container(
        height: 200,
        child: Center(
            child: Column(children: [
          Text('\n\nYou are at the end of your journey',
              style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
          GestureDetector(
              onTap: () {
                _scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);
                fetchPaginatedPosts(timeline);
              },
              child: Text('\nReturn to top',
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 10))))
        ])));
  }

  Widget _emptyTimeline() {
    return Center(
      child: Text(
        "No new posts on your feed",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
