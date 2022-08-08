import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/blocs/comment/comment_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';

class StoryViewerList extends StatefulWidget {
  const StoryViewerList(
      {Key? key, required this.userId, required this.contentId})
      : super(key: key);

  final String userId;
  final String contentId;

  @override
  State<StoryViewerList> createState() => _StoryViewerListState();
}

class _StoryViewerListState extends State<StoryViewerList> {
  String get _userId => widget.userId;
  String get _contentId => widget.contentId;
  final StoryBloc _storyBloc = getService<StoryBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _storyBloc.add(
        StoryEvent.fetchStoryViewers(userId: _userId, contentId: _contentId));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!_storyBloc.state.storyViewsReachedMaximumThreshold) {
        _storyBloc.add(StoryEvent.fetchPaginatedStoryViewers(
            userId: _userId, contentId: _contentId));
      }
    }
  }

  void _listener(BuildContext context, StoryState state) {
    /* if (state.action == CommentListenableAction.created) {
      widget.onComment(); 
    } else if (state.action == CommentListenableAction.deleted) {
      widget.onDelete();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(clipBehavior: Clip.none, children: [
      CustomScrollView(slivers: [
        _buildAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SmartRefresher(
                enablePullUp: false,
                enablePullDown: true,
                controller: _refreshController,
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  _refreshController.refreshCompleted();
                },
                header: CustomHeader(
                    builder: (BuildContext context, RefreshStatus? mode) {
                  if (mode == RefreshStatus.refreshing) {
                    return const Center(
                        child: LoadingIndicator(size: Size(40, 40)));
                  }

                  return const Center();
                }),
                child: BlocConsumer<StoryBloc, StoryState>(
                    bloc: _storyBloc,
                    listener: _listener,
                    listenWhen: (StoryState prevState, StoryState currState) {
                      return true;
                    },
                    builder: (BuildContext context, StoryState state) {
                      return PagedListView<int, UserModel>(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        pagingController:
                            _storyBloc.state.storyViewsPaginationController,
                        builderDelegate: PagedChildBuilderDelegate<UserModel>(
                          animateTransitions: true,
                          noItemsFoundIndicatorBuilder: (ctx) {
                            return Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(ctx).size.height * .2),
                                child: Text(
                                  'No viewers',
                                  style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.6)),
                                ),
                              ),
                            );
                          },
                          firstPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          newPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                          itemBuilder: (context, user, index) {
                            return _buildUserList(user: user);
                          },
                        ),
                      );
                    })),
          )
        ])),
      ]),
    ]));
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        floating: true,
        leading: const Center(),
        title: null,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
        expandedHeight: 55,
        flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.1),
                title: const Text(
                  'Views',
                  style: TextStyle(fontSize: 15),
                ))));
  }

  Widget _buildUserList({required UserModel user}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(user.profilePic!),
      ),
      title: Text(
        user.username,
        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.6)),
      ),
      onTap: () {},
    );
  }
}
