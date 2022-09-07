import 'package:frienderr/features/presentation/widgets/empy_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/post/post.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/screens/timeline/item.dart';

class TimelinePosts extends StatefulWidget {
  final BlocGroup blocGroup;
  final ScrollController scrollController;
  const TimelinePosts(
      {Key? key, required this.blocGroup, required this.scrollController})
      : super(key: key);

  @override
  State<TimelinePosts> createState() => _TimelinePostsState();
}

class _TimelinePostsState extends State<TimelinePosts>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  User? user = FirebaseAuth.instance.currentUser;
  PostBloc get _postBloc => widget.blocGroup.postBloc;
  ScrollController get _scrollController => widget.scrollController;

  @override
  void initState() {
    super.initState();
    _listenToTimelineUpdates();
    _scrollController.addListener(_scrollListener);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _postBloc.paginationController.addPageRequestListener((pageKey) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!_postBloc.state.reachedMaximumThreshold) {
        _postBloc.add(const PostEvent.fetchPaginatedTimelinePosts());
      }
    }
  }

  void _listenToTimelineUpdates() {
    _postBloc.timeline.listen((event) {
      setState(() {});
    });
  }

  void _listener(BuildContext context, PostState state) {
    if (state.action == PostListenableAction.created) {
      _scrollController.jumpTo(45);
      _postBloc.add(const PostEvent.fetchTimelinePosts(shouldLoad: false));
      getService<AppRouter>().context.dismissToast();
    }

    if (state.action == PostListenableAction.failure) {
      getService<AppRouter>().context.showToast(
          content:
              const Text('Post failed', style: TextStyle(color: Colors.white)),
          type: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
        bloc: _postBloc,
        listener: _listener,
        listenWhen: (PostState prevState, PostState currState) {
          return true;
        },
        builder: (BuildContext context, PostState state) {
          return PagedListView<int, dynamic>(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            pagingController: _postBloc.paginationController,
            builderDelegate: PagedChildBuilderDelegate<dynamic>(
              animateTransitions: true,
              noItemsFoundIndicatorBuilder: (ctx) {
                return const EmptyBuilder(message: "No posts on timeline");
              },
              firstPageProgressIndicatorBuilder: (ctx) {
                return const LoadingIndicator(size: Size(40, 40));
              },
              newPageProgressIndicatorBuilder: (ctx) {
                return const LoadingIndicator(size: Size(40, 40));
              },
              transitionDuration: const Duration(milliseconds: 500),
              itemBuilder: (context, item, index) {
                if (_postBloc.paginationController.itemList != null) {
                  final cursor =
                      _postBloc.paginationController.itemList!.length;
                  if (index == cursor - 1 &&
                      _postBloc.state.reachedMaximumThreshold) {
                    return _trailingPost(item);
                  }
                }

                return PostItem(
                  post: item,
                  blocGroup: widget.blocGroup,
                );
              },
            ),
          );
        });
  }

  Widget _trailingPost(Post post) {
    return Flex(direction: Axis.vertical, children: [
      PostItem(
        post: post,
        blocGroup: widget.blocGroup,
      ),
      _userCaughtUp()
    ]);
  }

  Widget _userCaughtUp() {
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
                    _animationController.forward();
                  }
                },
                child: Column(children: [
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset(
                        Assets.lottie.caughtUp,
                        width: 150,
                        height: 150,
                        controller: _animationController,
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
