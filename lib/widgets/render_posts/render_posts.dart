import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';
import 'package:frienderr/enums/enums.dart';
import 'package:like_button/like_button.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';

import 'package:frienderr/blocs/post_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/events/post_event.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/screens/account/account.dart';
//import 'package:frienderr/screens/account/account.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/widgets/image_screen/image_screen.dart';
import 'package:frienderr/widgets/video_screen/video_screen.dart';
import 'package:frienderr/screens/comment_screen/comment_screen.dart';

class RenderPost extends StatefulWidget {
  final int index;
  final dynamic items;
  final bool isPostOwner;
  final bool shoudlPlayParent;
  RenderPost(
      {Key? key,
      required this.items,
      required this.index,
      required this.isPostOwner,
      required this.shoudlPlayParent})
      : super(key: key);

  RenderPostState createState() => RenderPostState();
}

class RenderPostState extends State<RenderPost> with TickerProviderStateMixin {
  int currentIndex = 0;
  double targetValue = 0;
  bool isPostLiked = false;
  int postCount = 0;
  PostBloc postBloc = new PostBloc();
  dynamic get items => widget.items;
  dynamic get index => widget.index;
  final List<StoryItem> stories = [];
  late AnimationController _controller;
  final StoryController controller = StoryController();
  dynamic get shoudlPlayParent => widget.shoudlPlayParent;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final FirebaseServices firebaseServices = new FirebaseServices();
  late final UserState userState = context.read<UserBloc>().state;

  @override
  void initState() {
    super.initState();
    setState(() {
      postCount = items[index]['likes'];
      isPostLiked = (items[index]['userLikes'].contains(userState.user.id));
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    WidgetsBinding.instance?.addPostFrameCallback((_) => controller.pause());
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  showPostActions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext btx) {
        return Container(
            height: 150,
            child: Column(children: [
              ListTile(
                  leading: Icon(Icons.bookmark_add), title: Text('Save Post')),
              widget.isPostOwner
                  ? ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete Post'),
                      onTap: () {
                        Navigator.of(btx).pop();
                      })
                  : Container(),
            ]));
      },
    );
  }

  likePost(dynamic post) {
    postBloc.add(LikePost(user: userState.user, post: post));
  }

  unLikePost(String id) {
    postBloc.add(UnLikePost(postId: id, userId: userState.user.id));
  }

  determineLikeAction() async {
    (items[index]['userLikes'].contains(userState.user.id))
        ? unLikePost(items[index]['id'])
        : likePost(items[index]);
    setState(() {
      targetValue = 130;
    });
  }

  sharePost(String postId) async {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update({'shares': FieldValue.increment(1)});
    final uri = await firebaseServices.createDynamicLink(postId);
    Share.share(uri.toString());
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: <Widget>[
          postHeaderWidget(),
          Stack(alignment: Alignment.center, children: [
            renderMediaWidget(),
            Align(alignment: Alignment.center, child: likeAnimationWidget()),
          ]),
          postDetailsWidget(),
          interactionHelper()
        ],
      ),
    )));
  }

  Widget likeAnimationWidget() {
    return Align(
        alignment: Alignment.center,
        child: TweenAnimationBuilder<double>(
          onEnd: () => Future.delayed(
              Duration(milliseconds: 1500),
              () => setState(() {
                    targetValue = 0;
                  })),
          tween: Tween(begin: 0, end: targetValue),
          duration: const Duration(milliseconds: 100),
          builder: (BuildContext builder, double size, Widget? child) {
            return IconButton(
              iconSize: size,
              color: Colors.grey,
              icon: child!,
              onPressed: () {},
            );
          },
          child: const Icon(Icons.favorite, color: Colors.red),
        ));
  }

  Widget interactionHelper() {
    final postId = items[index]['id'];

    final shareCount = items[index]['shares'];
    final commentCount = items[index]['commentCount'];
    return Container(
        width: MediaQuery.of(context).size.width * .57,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  likeWidget(),
                  GestureDetector(
                      child: Row(children: [
                        Image.asset('assets/images/comment.png',
                            height: 35, width: 35),
                        Text(' $commentCount')
                      ]),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Comment(post: items[index])))),
                  GestureDetector(
                      onTap: () => sharePost(postId),
                      child: Row(children: [
                        Image.asset('assets/images/share.png',
                            height: 35, width: 35),
                        Text(' $shareCount')
                      ]))
                ])));
  }

  Widget postDetailsWidget() {
    final postId = items[index]['id'];
    final caption = items[index]['caption'];
    final shareCount = items[index]['shares'];
    final dateCreated = items[index]['dateCreated'];
    final commentCount = items[index]['commentCount'];

    final itemCount = items[index]['content'].length;
    return Material(
      child: Container(
          width: double.infinity,
          // height: auto,
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: DotsIndicator(
                  dotsCount: itemCount,
                  position: currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(5, 5),
                    activeColor: HexColor('#f3923c'),
                    spacing: const EdgeInsets.all(10.0),
                  ),
                )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        height: 35,
                        child: Text(caption,
                            style: TextStyle(
                              fontSize: 14,
                            )))),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      TimeElapsed().elapsedTimeDynamic(
                          new DateTime.fromMicrosecondsSinceEpoch(dateCreated)
                              .toString()),
                    )),
              ])),
    );
  }

  Widget renderMediaWidget() {
    final itemCount = items[index]['content'].length;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, // HexColor('#E9E9E9'), //Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(children: [
          Expanded(
              child: CarouselSlider.builder(
                  itemCount: itemCount,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    height: 600,
                    onPageChanged: (i, v) => setState(() {
                      currentIndex = i;
                    }),
                    initialPage: 0,
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return GestureDetector(
                        onDoubleTap: () => determineLikeAction(),
                        child: mediaContainer(items, index, itemIndex,
                            currentIndex, shoudlPlayParent));
                  }))
        ]));
  }

  Widget postHeaderWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          avatarWidget(),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () => showPostActions(),
                  icon: Icon(Icons.more_horiz)))
        ],
      ),
    ]);
  }

  Widget avatarWidget() {
    final id = items[index]['user']['id'];
    final username = items[index]['user']['username'];
    final profilePic = items[index]['user']['profilePic'];
    return Row(children: [
      Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Account(
                            isProfileOwnerViewing: false,
                            profileUserId: id,
                          ))),
              child: CircleAvatar(
                  radius: 15,
                  backgroundImage: CachedNetworkImageProvider(profilePic)))),
      Text(
        '  $username',
        style: TextStyle(fontSize: 14),
      )
    ]);
  }

  Widget likeWidget() {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: LikeButton(
          size: 36,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isPostLiked //||
                  // (items[index]['userLikes'].contains(userState.user.id))
                  ? Colors.red
                  : Colors.grey,
              size: 36,
            );
          },
          likeCount: postCount,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isPostLiked //||
                ? Colors.red
                : Colors.grey;
            Widget result;
            if (count == 0) {
              return null;
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          } as Widget? Function(int?, bool, String)?,
          onTap: (bool isLiked) async {
            this.setState(() {
              isPostLiked = !isPostLiked;
              postCount = isPostLiked ? postCount + 1 : postCount - 1;
            });
            determineLikeAction();
            return true;
          },
        ));
  }

  Widget mediaContainer(
      items, index, itemIndex, currentIndex, shoudlPlayParent) {
    final type = items[index]['content'][itemIndex]['type'];
    final media = items[index]['content'][itemIndex]['media'];

    if (type == Constants.mediaContainerTypes[MediaContainerType.Image]) {
      return ImageScreen(imageFile: media);
    } else {
      return VideoScreen(
          videoFile: media,
          shouldPlay: (itemIndex == currentIndex && shoudlPlayParent));
    }
  }
}
