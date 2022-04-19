import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/widgets/gallery.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/user_stories.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  StoryBloc get _storyBloc => getIt<StoryBloc>();
  User? user = FirebaseAuth.instance.currentUser;
  late UserState userState = context.read<UserBloc>().state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryBloc, StoryState>(
        bloc: _storyBloc,
        listener: (
          BuildContext context,
          StoryState state,
        ) {},
        builder: (
          BuildContext context,
          StoryState state,
        ) {
          return StreamBuilder<QuerySnapshot>(
              stream: _storyBloc.stories,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center();
                }
                List<DocumentSnapshot> items = snapshot.data?.docs ?? [];

                if (items.length == 0) {
                  return Container(height: 250, child: _renderUserStory());
                }

                return SizedBox(
                    height: 220,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Row(children: [
                              Container(height: 250, child: _renderUserStory()),
                              Container(
                                  height: 250,
                                  child: _storyTemplate(
                                      items[index], items, index))
                            ]);
                          }

                          return Container(
                              height: 150,
                              child:
                                  _storyTemplate(items[index], items, index));
                        }));
              });
        });
  }

  Widget _renderUserStory() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('stories')
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center();
          }
          var doesUserHaveStories = true;
          DocumentSnapshot? stories = snapshot.data;

          try {
            doesUserHaveStories = stories?['content'] != null;
            doesUserHaveStories = true;
          } catch (e) {
            doesUserHaveStories = false;
          }

          if (doesUserHaveStories) {
            return _storyTemplate(stories, [], 0);
          } else {
            return _renderAddUserStory();
          }
        });
  }

  Widget _renderAddUserStory() {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: [
            Opacity(
                opacity: 0.6,
                child: CachedNetworkImage(
                  height: 220,
                  width: 150,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 0, 0, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      // color: Colors.redAccent,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: userState.user.profilePic ?? '',
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 7),
                    child: Row(children: [
                      Icon(Icons.add_circle_rounded),
                      Text(' Add Story',
                          style: TextStyle(
                              // color: Colors.grey,
                              fontSize: AdaptiveTextSize()
                                  .getAdaptiveTextSize(context, 10)))
                    ]))),
          ]),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Gallery(mediaAction: 'Story'))));
  }

  Widget _storyTemplate(dynamic story, dynamic stories, int index) {
    final storyUserId = story['id'];
    final dateCreated = story['dateCreated'];
    final isStoryOwner = storyUserId == user?.uid;

    return SizedBox(
        height: 230,
        width: 170,
        child: OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              return ViewUserStory(
                stories: stories,
                currentPosition: index,
                timeElasped: dateCreated,
                isOwnerViewing: isStoryOwner,
                storyUser: story['user'],
              );
            },
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return _storyDisplay(story);
            }));
  }

  Widget _storyDisplay(story) {
    final username = story['user']['username'];
    final media = story['content'][0]['media'];
    final profilePic = story['user']['profilePic'];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Opacity(
            opacity: 0.5,
            child: CachedNetworkImage(
              width: 125,
              height: 220,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  // color: Colors.redAccent,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: media,
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 5),
                child: Row(children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundImage: CachedNetworkImageProvider(profilePic)),
                  Text(' $username',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10)))
                ]))),
      ]),
    );
  }
}
