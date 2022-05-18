import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/view_stories/view_stories.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/widgets/view_user_story.dart';

class Stories extends StatefulWidget {
  final BlocGroup blocGroup;
  const Stories({Key? key, required this.blocGroup}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  BlocGroup get _blocGroup => widget.blocGroup;
  User? user = FirebaseAuth.instance.currentUser;
  late UserState userState = context.read<UserBloc>().state;

  Future<Object?> _navigateToCamera() async {
    return await getIt<AppRouter>().push(
        CameraRoute(mode: CameraSelectionMode.story, blocGroup: _blocGroup));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocConsumer<StoryBloc, StoryState>(
              bloc: _blocGroup.storyBloc,
              listener: (
                BuildContext context,
                StoryState state,
              ) {
                if (state.action == StoryListenableAction.created) {
                  _blocGroup.storyBloc
                      .add(StoryEvent.loadStories(userId: user?.uid as String));

                  getIt<AppRouter>().context.dismissToast();
                }
              },
              builder: (
                BuildContext context,
                StoryState state,
              ) {
                switch (state.status) {
                  case StoryStatus.loading:
                    return _storyLoading();
                  case StoryStatus.error:
                    return _storyError(state.error);
                  case StoryStatus.loaded:
                    return _storyCarousel(state.stories);
                  default:
                    return const Center();
                }
              })
        ]);
  }

  Widget _storyCarousel(StoryResponse stories) {
    if (stories.stories.isEmpty) {
      return Padding(
        child: Align(
          child: ConditionalRenderDelegate(
            condition: !stories.userStory.doesUserHaveStories,
            renderWidget: GestureDetector(
                child: _renderAddUserStory(), onTap: _navigateToCamera),
            fallbackWidget: SizedBox(
                height: 200, child: _renderUserStory(stories.userStory)),
          ),
          alignment: Alignment.centerLeft,
        ),
        padding: const EdgeInsets.only(left: 10),
      );
    }

    return SizedBox(
        height: 200,
        child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: stories.stories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Row(children: [
                  SizedBox(
                      height: 200, child: _renderUserStory(stories.userStory)),
                  SizedBox(height: 200, child: _storyTemplate(stories, index))
                ]);
              }

              return SizedBox(
                  height: 200, child: _storyTemplate(stories, index));
            }));
  }

  Widget _storyError(String error) {
    return ErrorDisplay(error: error);
  }

  Widget _storyLoading() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80,
        child: const Center(
            child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }

  Widget _renderUserStory(UserStory userStory) {
    if (userStory.doesUserHaveStories) {
      return _userStoryTemplate(userStory);
    } else {
      return _renderAddUserStory();
    }
  }

  Widget _renderAddUserStory() {
    return Container(
        height: 200,
        width: 130,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
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
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
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
                                    color: const Color.fromRGBO(255, 0, 0, 0.5),
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
                  child: AutoSizeText(' You',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14)),
                  padding: EdgeInsets.only(top: 3),
                )
              ]),
            )));
  }

  Widget _storyTemplate(StoryResponse story, int index) {
    final String storyUserId = story.stories[index].user.id;
    final int dateCreated = story.stories[index].dateUpdated;

    final bool isStoryOwner = storyUserId == user?.uid;

    if (isStoryOwner) {
      return const Center();
    }

    return SizedBox(
        height: 150,
        width: 130,
        child: OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              return ViewStories(
                stories: story.stories,
                currentPosition: index,
                timeElasped: dateCreated,
                isOwnerViewing: isStoryOwner,
                storyBloc: _blocGroup.storyBloc,
                storyUser: story.stories[index].user,
              );
            },
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return _storyDisplay(story.stories[index]);
            }));
  }

  Widget _userStoryTemplate(UserStory userStory) {
    final String storyUserId = userStory.story!.id;
    final int dateCreated = userStory.story!.dateUpdated;

    final bool isStoryOwner = storyUserId == user?.uid;

    return SizedBox(
        height: 200,
        width: 130,
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
              return _storyDisplay(userStory.story as StoryModel);
            }));
  }

  Widget _storyDisplay(StoryModel story) {
    final String username = story.user.username;
    final bool isStoryOwner = story.user.id == user!.uid;
    final String profilePic = story.user.profilePic ?? '';
    final String displayName = isStoryOwner ? 'You' : username;
    final StoryMedia media = story.content[story.content.length - 1].media;

    final List<Color> colors = isStoryOwner
        ? [Colors.grey.withOpacity(0.7), Colors.grey.withOpacity(0.7)]
        : [
            HexColor('#FA5B8E').withOpacity(0.7),
            HexColor('#FCA28E').withOpacity(0.7)
          ];

    final double _opacity =
        story.content[story.content.length - 1].views.contains(user!.uid)
            ? 0.5
            : 1;

    return Opacity(
        opacity: _opacity,
        child: Material(
            elevation: 20,
            child: Container(
                height: 200,
                width: 130,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(media.url),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(7)),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 75,
                                height: 75,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100.0)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: colors)),
                                child: Container(
                                    width: 70,
                                    height: 70,
                                    padding: const EdgeInsets.all(2.5),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0)),
                                    ),
                                    child: CachedNetworkImage(
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 0, 0, 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      imageUrl: profilePic,
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ))),
                            Padding(
                              child: AutoSizeText(' $displayName',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              padding: const EdgeInsets.only(top: 3),
                            )
                          ]),
                    )))));
  }
}
