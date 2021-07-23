import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/screens/live/live.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/widgets/gallery/gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/screens/user_stories/user_stories.dart';
import 'package:frienderr/widgets/render_posts/render_posts.dart';

class Timeline extends StatefulWidget {
  Timeline({Key? key}) : super(key: key);

  @override
  TimelineState createState() => TimelineState();
}

class TimelineState extends State<Timeline>
    with AutomaticKeepAliveClientMixin<Timeline> {
  int currentIndex = 0;
  int postLength = 0;
  bool isInit = true;
  dynamic userStory = [];
  dynamic allStories = [];
  bool isUserCaughtUp = false;
  bool showRefresher = false;
  bool isFetchingData = true;
  late ScrollController scrollController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final CollectionReference<Map<String, dynamic>> postCollection =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference stories =
      FirebaseFirestore.instance.collection('stories');
  late UserState userState = context.read<UserBloc>().state;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> posts = [];
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    fetchPosts();
    fetchPostCount();
    super.initState();
    listenToTimelineUpdates();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (isUserCaughtUp == false) {
        fetchPaginatedPosts();
      }
    }
  }

  void fetchPostCount() async {
    final count = await FirebaseFirestore.instance
        .collection('postCount')
        .doc('count')
        .get();
    setState(() {
      postLength = count['count'];
    });
  }

  void _onRefresh() async {
    fetchPosts();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  void fetchPosts() async {
    final fetchedPosts = await postCollection
        .orderBy('dateCreated', descending: true)
        .limit(10)
        .get();

    this.setState(() {
      posts = fetchedPosts.docs;
      showRefresher = false;
      isFetchingData = false;
      isUserCaughtUp = false;
    });
  }

  void fetchPaginatedPosts() async {
    if (isUserCaughtUp == true) {
      return;
    }
    final paginted = await postCollection
        .orderBy('dateCreated', descending: true)
        .startAfter([posts[posts.length - 1]['dateCreated']])
        .limit(10)
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> newPosts = []
      ..addAll(posts)
      ..addAll(paginted.docs);

    if (newPosts.length == posts.length) {
      this.setState(() {
        isUserCaughtUp = true;
      });
    }

    this.setState(() {
      posts = newPosts;
      isFetchingData = false;
      showRefresher = false;
    });
  }

  void listenToTimelineUpdates() {
    FirebaseFirestore.instance
        .collection('postCount')
        .doc('count')
        .snapshots()
        .listen((event) {
      this.setState(() {
        showRefresher = isInit ? false : true;
        isInit = false;
      });
    });
  }

  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      isFetchingData
          ? Center(child: CupertinoActivityIndicator())
          : renderPosts(),
      showRefresher ? refreshWidget() : Center()
    ]))); //
  }

  Widget refreshWidget() {
    return GestureDetector(
        onTap: () {
          scrollController.animateTo(0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 800));
          fetchPosts();
        },
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 30,
                width: 70,
                margin: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).buttonColor),
                child: Center(
                    child: Icon(Icons.refresh,
                        color: Theme.of(context).canvasColor)))));
  }

  Widget renderPosts() {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            return Center();
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: posts.length > 0
            ? ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: posts.length,
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final postUserId = posts[index]['user']['id'];

                  if (index == 0) {
                    return Column(children: [
                      Container(height: 250, child: renderStories()),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height - 150,
                          child: RenderPost(
                              items: posts,
                              index: index,
                              isPostOwner: postUserId == userState.user.id,
                              shoudlPlayParent: index == index))
                    ]);
                  }
                  return Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: RenderPost(
                          items: posts,
                          index: index,
                          isPostOwner: postUserId == userState.user.id,
                          shoudlPlayParent: index == index));
                })
            : Center(
                child: Text(
                  "No new posts on your feed",
                  style: TextStyle(fontSize: 13),
                ),
              ));
  }

  Widget renderStories() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('stories')
            .where('id', isNotEqualTo: userState.user.id)
            .orderBy('id', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center();
          }
          List<DocumentSnapshot> items = snapshot.data?.docs ?? [];

          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(children: [
                    Container(height: 250, child: renderUserStory()),
                    Container(height: 250, child: storyTemplate(items[index]))
                  ]);
                }

                return Container(
                    height: 150, child: storyTemplate(items[index]));
              });
        });
  }

  Widget renderUserStory() {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('stories')
            .doc(userState.user.id)
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
            return storyTemplate(stories);
          } else {
            return renderAddUserStory();
          }
        });
  }

  Widget renderAddUserStory() {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: [
            Opacity(
                opacity: 0.5,
                child: CachedNetworkImage(
                  height: 220,
                  width: 150,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 0, 0, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      // color: Colors.redAccent,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: userState.user.profilePic,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Icon(Icons.add_circle_rounded),
                      Text(' Add Story')
                    ]))),
          ]),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Gallery(mediaAction: 'Story'))));
  }

  Widget storyTemplate(dynamic story) {
    final storyUserId = story['id'];
    final content = story['content'];
    final dateCreated = story['dateCreated'];
    final username = story['user']['username'];
    final media = story['content'][0]['media'];
    final profilePic = story['user']['profilePic'];
    final isStoryOwner = storyUserId == userState.user.id;

    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(children: [
            Opacity(
                opacity: 0.5,
                child: CachedNetworkImage(
                  height: 220,
                  width: 150,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 0, 0, 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      // color: Colors.redAccent,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
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
                          backgroundImage:
                              CachedNetworkImageProvider(profilePic)),
                      Text(' $username')
                    ]))),
          ]),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewUserStory(
                      stories: content,
                      timeElasped: dateCreated,
                      isOwnerViewing: isStoryOwner,
                      storyUser: story['user'],
                    ))));
  }
}
