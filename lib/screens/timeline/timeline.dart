import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/blocs/story/story_bloc.dart';
import 'package:frienderr/models/post/post.dart';
import 'package:frienderr/widgets/error/error.dart';

import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/screens/live/live.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/screens/chat/chat.dart';
import 'package:frienderr/screens/camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/blocs/quick/quick_bloc.dart';
import 'package:frienderr/widgets/gallery/gallery.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:frienderr/screens/find_friends/find_friends.dart';
import 'package:frienderr/screens/user_stories/user_stories.dart';
import 'package:frienderr/widgets/render_posts/render_posts.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';
import 'package:frienderr/blocs/timeline/timeline_bloc.dart';

class Timeline extends StatefulWidget {
  final QuickBloc quickBloc;
  Timeline({Key? key, required this.quickBloc}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with AutomaticKeepAliveClientMixin<Timeline> {
  int currentIndex = 0;
  int postLength = 0;
  bool isInit = true;
  dynamic userStory = [];
  dynamic allStories = [];
  bool isUserCaughtUp = false;
  bool showRefresher = false;
  bool isFetchingData = true;
  bool shouldRenderUI = false;
  late ScrollController scrollController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final CollectionReference<Map<String, dynamic>> postCollection =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference stories =
      FirebaseFirestore.instance.collection('stories');
  late UserState userState = context.read<UserBloc>().state;
  User? user = FirebaseAuth.instance.currentUser;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> posts = [];

  StoryBloc storyBloc = new StoryBloc();
  TimelineBloc timelineBloc = new TimelineBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    fetchPosts();

    super.initState();
    listenToTimelineUpdates();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    widget.quickBloc.add(QuickEvent.initialize());
    timelineBloc.add(TimelineEvent.fetchTimelinePosts());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (isUserCaughtUp == false) {
        fetchPaginatedPosts();
      }
    }
  }

  void _navigateToChatScreen() => Navigator.push(
        context,
        transition.PageTransition(
            child: ChatDashboard(),
            type: transition.PageTransitionType.slideInLeft),
      );

  void _openSearch() => showGeneralDialog(
        context: context,
        barrierColor: Colors.black, // Background color
        barrierDismissible: false,
        barrierLabel: 'Dialog',
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (_, __, ___) {
          return FindFriends();
        },
      );

  void fetchPostCount() async {}

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      _appBody(),
      ConditionalRenderDelegate(
        condition: showRefresher,
        fallbackWidget: Center(),
        renderWidget: _refresherWidget(),
      )
    ])));
  }

  Widget _appBody() {
    return CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
              floating: true,
              leading: const Center(),
              title: null,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.85),
              expandedHeight: 55,
              flexibleSpace: _appBar()),
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(
                      [_storyBlocConsumer(), _timelineBlocConsumer()])))
        ]);
  }

  Widget _appBar() {
    return FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: 55,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _appLogoVector(),
                        _appBarIcons(),
                      ],
                    )),
              )
            ]));
  }

  Widget _appBarIcons() {
    return Row(children: [
      GestureDetector(
          onTap: () => _navigateToChatScreen(),
          child: Badge(
              badgeContent: Text('3'),
              child: SvgPicture.asset(
                Constants.messageIconOutline,
                width: 22,
                height: 22,
                color: Colors.white,
              ))),
      GestureDetector(
          onTap: () => _openSearch(),
          child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: SvgPicture.asset(
                Constants.searchIconOutline,
                width: 22,
                height: 22,
                color: Colors.white,
              ))),
    ]);
  }

  Widget _timelineBlocConsumer() {
    return BlocConsumer<TimelineBloc, TimelineState>(
        bloc: timelineBloc,
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
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: CircularProgressIndicator())));
  }

  //  Container(height: 250, child: renderStories()),

  Widget _timelinePostList(List<Post> posts) {
    if (posts.length == 0) {
      return _emptyTimeline();
    }

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final postUserId = posts[index].user.id;

        if (index == posts.length - 1) {
          _trailingPost(posts[index]);
        }
        return RenderPost(
          post: posts[index],
          isPostOwner: postUserId == user?.uid,
        );
      },
    );
  }

  Widget _trailingPost(Post post) {
    return Flex(direction: Axis.vertical, children: [
      RenderPost(
        post: post,
        isPostOwner: post.user.id == user?.uid,
      ),
      _userCaughtUp()
    ]);
  }

  Widget _userCaughtUp() {
    return Container(
        height: 200,
        child: Center(
            child: Column(children: [
          Text('\n\nYou are at the end of your journey',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
          GestureDetector(
              onTap: () {
                scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);
                fetchPosts();
              },
              child: Text('\nReturn to top',
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.3))))
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

  Widget _refresherWidget() {
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

  Widget _appLogoVector() {
    final Widget appLogo = Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset(Constants.appLogo, width: 140, height: 140)));
    return Hero(
        flightShuttleBuilder: (_, animation, __, ___, ____) {
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          });
          return appLogo;
        },
        tag: 'none',
        child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 10), child: appLogo));
  }

  Widget _storyBlocConsumer() {
    return BlocConsumer<StoryBloc, StoryState>(
        bloc: storyBloc,
        listener: (
          BuildContext context,
          StoryState state,
        ) {},
        builder: (
          BuildContext context,
          StoryState state,
        ) {
          return StreamBuilder<QuerySnapshot>(
              stream: storyBloc.stories,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center();
                }
                List<DocumentSnapshot> items = snapshot.data?.docs ?? [];

                if (items.length == 0) {
                  return Container(height: 250, child: renderUserStory());
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
                              Container(height: 250, child: renderUserStory()),
                              Container(
                                  height: 250,
                                  child: storyTemplate(items[index]))
                            ]);
                          }

                          return Container(
                              height: 150, child: storyTemplate(items[index]));
                        }));
              });
        });
  }

  Widget renderUserStory() {
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
                  imageUrl: userState.user.profilePic,
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
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.4)))
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
    final isStoryOwner = storyUserId == user?.uid;

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
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          enabled: true,
                          child: Container(
                            height: 220,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: 150,
                          )),
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
                      Text(' $username',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.35)))
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
