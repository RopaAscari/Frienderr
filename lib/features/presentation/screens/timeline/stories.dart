import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/widgets/view_user_story.dart';
import 'package:frienderr/features/presentation/screens/view_stories/view_stories.dart';
import 'package:frienderr/features/presentation/screens/timeline/story_image_display.dart';
import 'package:frienderr/features/presentation/screens/timeline/story_video_display.dart';

class Stories extends StatefulWidget {
  final BlocGroup blocGroup;
  const Stories({Key? key, required this.blocGroup}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  late ScrollController _scrollController;
  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => _blocGroup.userBloc.state.user;
  late UserState userState = context.read<UserBloc>().state;

  Future<Object?> _navigateToCamera() async {
    return await getService<AppRouter>().push(
        CameraRoute(mode: CameraSelectionMode.story, blocGroup: _blocGroup));
  }

  @override
  initState() {
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.addListener(_scrollListener);
      }
    });

    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!_blocGroup.storyBloc.state.reachedMaximumThreshold) {
        _blocGroup.storyBloc
            .add(StoryEvent.fetchPaginatedStories(userId: _user.id));
      }
    }
  }

  double _determineWidth(StoryState state) {
    if (state.paginationController.itemList?.length != null) {
      return (state.paginationController.itemList!.length * 145) + 40;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  void _handleListenable(
    BuildContext context,
    StoryState state,
  ) {
    if (state.action == StoryListenableAction.created ||
        state.action == StoryListenableAction.updated ||
        state.action == StoryListenableAction.deleted) {
      _blocGroup.storyBloc.add(StoryEvent.fetchStories(userId: _user.id));

      getService<AppRouter>().context.dismissToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildStoryDisplay();
  }

  Widget _buildStoryDisplay() {
    return BlocConsumer<StoryBloc, StoryState>(
        bloc: _blocGroup.storyBloc,
        listener: _handleListenable,
        builder: (BuildContext context, StoryState state) {
          return SizedBox(
              height: 250,
              // width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                  shrinkWrap: true,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 5),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                                height: 250,
                                child: _renderUserStory(state.userStory)),
                            state.paginationController.itemList == null
                                ? const Center()
                                : SizedBox(
                                    height: 250,
                                    width: _determineWidth(state),
                                    child: PagedListView<int, Story>(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      pagingController:
                                          state.paginationController,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<Story>(
                                        animateTransitions: true,
                                        noItemsFoundIndicatorBuilder: (ctx) {
                                          return const Center();
                                        },
                                        firstPageProgressIndicatorBuilder:
                                            (ctx) {
                                          return const LoadingIndicator(
                                              size: Size(40, 40));
                                        },
                                        newPageProgressIndicatorBuilder: (ctx) {
                                          return const LoadingIndicator(
                                              size: Size(40, 40));
                                        },
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        itemBuilder: (context, item, index) {
                                          return SizedBox(
                                              height: 200,
                                              child: _storyTemplate(
                                                  state.paginationController
                                                          .itemList ??
                                                      [],
                                                  index));
                                        },
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    )
                  ]));
        });
  }

  Widget _renderUserStory(UserStory userStory) {
    if (userStory.doesUserHaveStories) {
      return _userStoryTemplate(userStory);
    } else {
      return _renderAddUserStory();
    }
  }

  Widget _renderAddUserStory() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
          child: CameraScreen(
              mode: CameraSelectionMode.story, blocGroup: _blocGroup),
        ));
      },
      child: Container(
          height: 200,
          width: 130,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    _blocGroup.userBloc.state.user.profilePic as String),
                fit: BoxFit.cover,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(7)),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                      width: 75,
                      height: 75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.grey.withOpacity(0.6),
                                Colors.grey.withOpacity(0.6)
                              ])),
                      child: Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(2.5),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            Opacity(
                                opacity: 0.7,
                                child: CachedNetworkImage(
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(255, 0, 0, 0.5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100.0)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  imageUrl: userState.user.profilePic ?? '',
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.7)),
                              child: const Icon(CupertinoIcons.plus_app_fill,
                                  color: Colors.black),
                            )
                          ]))),
                  const Padding(
                    child: Text(' You',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14)),
                    padding: EdgeInsets.only(top: 3),
                  )
                ]),
              ))),
    );
  }

  Widget _storyTemplate(List<Story> stories, int index) {
    final String storyUserId = stories[index].user.id;
    final int dateCreated = stories[index].dateUpdated;

    final bool isStoryOwner = storyUserId == _user.id;

    if (isStoryOwner) {
      return const Center();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
          height: 150,
          width: 145,
          child: OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              closedColor: Colors.transparent,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (BuildContext context, VoidCallback _) {
                return ViewStories(
                  stories: stories,
                  currentPosition: index,
                  timeElasped: dateCreated,
                  isOwnerViewing: isStoryOwner,
                  storyUser: stories[index].user,
                  storyBloc: _blocGroup.storyBloc,
                );
              },
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return _storyDisplay(stories[index]);
              })),
    );
  }

  Widget _userStoryTemplate(UserStory userStory) {
    final String storyUserId = userStory.story!.id;
    final int dateCreated = userStory.story!.dateUpdated;

    final bool isStoryOwner = storyUserId == _user.id;

    return SizedBox(
        width: 145,
        height: 200,
        child: OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              return ViewUserStory(
                userStory: userStory,
                timeElasped: dateCreated,
                isOwnerViewing: isStoryOwner,
                storyBloc: _blocGroup.storyBloc,
              );
            },
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return _storyDisplay(userStory.story as Story);
            }));
  }

  Widget _storyDisplay(Story story) {
    final StoryMedia media = story.content.first.media;

    if (media.type == 'video') {
      return StoryVideoDisplay(story: story, user: _user);
    } else {
      return StoryImageDisplay(story: story, user: _user);
    }
  }
}
