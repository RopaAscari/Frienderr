import 'package:frienderr/core/services/helpers.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/screens/comment/comment_screen.dart';

class RenderPostDynamic extends StatefulWidget {
  final String postId;
  final bool isPostOwner;
  RenderPostDynamic({Key? key, required this.postId, required this.isPostOwner})
      : super(key: key);

  RenderPostDynamicState createState() => RenderPostDynamicState();
}

class RenderPostDynamicState extends State<RenderPostDynamic>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  bool isError = false;
  double targetValue = 0;
  bool isPostReady = false;
  String get postId => widget.postId;
  PostBloc get postBloc => getIt<PostBloc>();
  final List<StoryItem> stories = [];
  late DocumentSnapshot<Object?> fetchedPost;
  final FirebaseServices firebaseServices = new FirebaseServices();
  late final UserState userState = context.read<UserBloc>().state;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('postCount');
  @override
  void initState() {
    fetchPost();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onRefresh() async {
    fetchPost();
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
    // postBloc.add(LikePost(user: userState.user, post: post));
  }

  unLikePost(String id) {
    //postBloc.add(UnLikePost(postId: id, userId: userState.user.id));
  }

  determineLikeAction(dynamic post) async {
    (post['userLikes'].contains(userState.user.id))
        ? unLikePost(post['id'])
        : likePost(post);
    setState(() {
      targetValue = 130;
    });
  }

  deletePost(BuildContext alertContext) async {
    try {
      await posts.doc(postId).delete();

      await FirebaseFirestore.instance
          .collection('postCount')
          .doc('count')
          .update({'count': FieldValue.increment(-1)});
      Navigator.pop(alertContext);
    } catch (err) {}
  }

  Future<void> showAlertDialog(BuildContext highLevelContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext alertContext) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Delete Post',
              style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'This action is irreversable. Is this what you intended to do?',
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 5))),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(alertContext).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                deletePost(alertContext);
              },
            ),
          ],
        );
      },
    );
  }

  fetchPost() async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    try {
      final post = await posts.doc(postId).get();
      try {
        final postId = post['id'];
      } catch (err) {
        setState(() {
          isError = true;
        });
        return;
      }

      setState(() {
        fetchedPost = post;
        isPostReady = true;
      });
    } catch (e) {
      throw new Error();
    }
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
    return Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
            child: Scaffold(
                body: Center(
                    child: SmartRefresher(
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
                        child: Center(
                          child: isPostReady
                              ? Column(
                                  children: <Widget>[
                                    postHeaderWidget(),
                                    Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          renderMediaWidget(),
                                          Align(
                                              alignment: Alignment.center,
                                              child: likeAnimationWidget()),
                                        ]),
                                    postDetailsWidget(),
                                    interactionHelper()
                                  ],
                                )
                              : isError
                                  ? Center(child: Text('Something went wrong'))
                                  : CupertinoActivityIndicator(),
                        ))))));
  }

  Widget interactionHelper() {
    final postId = fetchedPost['id'];

    final shareCount = fetchedPost['shares'];
    final commentCount = fetchedPost['commentCount'];

    final theme =
        BlocProvider.of<ThemeBloc>(context, listen: false).state.theme;

    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width * .70,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: theme == Constants.darkTheme
                ? Colors.black
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  likeWidget(fetchedPost),
                  GestureDetector(
                      child: Row(children: [
                        Image.asset('assets/images/comment.png',
                            height: 35, width: 35),
                        Text(' $commentCount',
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 5)))
                      ]),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Center()))),
                  GestureDetector(
                      onTap: () => sharePost(postId),
                      child: Row(children: [
                        Image.asset('assets/images/share.png',
                            height: 35, width: 35),
                        Text(' $shareCount',
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 5)))
                      ]))
                ])));
  }

  Widget likeAnimationWidget() {
    return Align(
        alignment: Alignment.topCenter,
        child: TweenAnimationBuilder<double>(
          onEnd: () => Future.delayed(
              Duration(milliseconds: 1500),
              () => setState(() {
                    targetValue = 0;
                  })),
          tween: Tween(begin: 0, end: targetValue),
          duration: const Duration(milliseconds: 100),
          builder: (BuildContext builder, double size, Widget? child) {
            return Center(
                child: IconButton(
              iconSize: size,
              color: Colors.grey,
              icon: child!,
              onPressed: () {},
            ));
          },
          child: const Center(child: Icon(Icons.favorite, color: Colors.red)),
        ));
  }

  Widget postDetailsWidget() {
    final postId = fetchedPost['id'];
    final caption = fetchedPost['caption'];
    final shareCount = fetchedPost['shares'];
    final dateCreated = fetchedPost['dateCreated'];
    final commentCount = fetchedPost['commentCount'];

    final itemCount = fetchedPost['content'].length;
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
                    activeColor: Colors.blue[400]!,
                    spacing: const EdgeInsets.all(10.0),
                  ),
                )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        height: 35,
                        child: Text(caption,
                            //   softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 5))))),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        TimeElapsed.elapsedTimeDynamic(
                            new DateTime.fromMicrosecondsSinceEpoch(dateCreated)
                                .toString()),
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getAdaptiveTextSize(context, 5)))),
              ])),
    );
  }

  Widget renderMediaWidget() {
    final itemCount = fetchedPost['content'].length;
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
                        onDoubleTap: () => determineLikeAction(fetchedPost),
                        child: mediaContainer(
                            fetchedPost, itemIndex, currentIndex));
                  }))
        ]));
  }

  Widget postHeaderWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          avatarWidget(fetchedPost),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () => showPostActions(),
                  icon: Icon(Icons.more_horiz)))
        ],
      ),
    ]);
  }

  Widget avatarWidget(DocumentSnapshot<Object?> post) {
    final id = post['user']['id'];
    final username = post['user']['username'];
    final profilePic = post['user']['profilePic'];
    return Row(children: [
      Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
              child: CircleAvatar(
                  radius: 15,
                  backgroundImage: CachedNetworkImageProvider(profilePic)))),
      Text(
        '  $username',
        style: TextStyle(
            fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 5)),
      )
    ]);
  }

  Widget likeWidget(DocumentSnapshot<Object?> post) {
    return Row(children: [
      Padding(
          padding: const EdgeInsets.only(right: 10),
          child: LikeButton(
            size: 25,
            circleColor:
                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color:
                    isLiked || (post['userLikes'].contains(userState.user.id))
                        ? Colors.red
                        : Colors.grey,
                size: 25,
              );
            },
            likeCount: post['likes'],
            countBuilder: (int count, bool isLiked, String text) {
              var color =
                  isLiked || (post['userLikes'].contains(userState.user.id))
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
              determineLikeAction(post);
              return true;
            },
          )),
    ]);
  }

  Widget mediaContainer(
      DocumentSnapshot<Object?> post, int itemIndex, int currentIndex) {
    final type = post['content'][itemIndex]['type'];
    final media = post['content'][itemIndex]['media'];
    if (type == Constants.mediaContainerTypes[MediaContainerType.Image]) {
      //return ImageScreen(imageFile: media);
      return Container(
          //     height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0)),
              image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: CachedNetworkImageProvider(media))));
    } else {
      return Container(
          width: MediaQuery.of(context).size.width,
          child: VideoScreen(
            video: media,
            //shouldPlay: (itemIndex == currentIndex && shoudlPlayParent)
          ));
    }
  }
}
