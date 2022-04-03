import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/post_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/models/post/post.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/events/post_event.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:frienderr/core/constants/constants.dart';
//import 'package:frienderr/screens/account/account.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/widgets/image_screen/image_screen.dart';
import 'package:frienderr/widgets/video_screen/video_screen.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/screens/comment_screen/comment_screen.dart';

class RenderPost extends StatefulWidget {
  final Post post;
  final bool isPostOwner;

  RenderPost({
    Key? key,
    required this.post,
    required this.isPostOwner,
  }) : super(key: key);

  RenderPostState createState() => RenderPostState();
}

class RenderPostState extends State<RenderPost> with TickerProviderStateMixin {
  int currentIndex = 0;
  double targetValue = 0;
  bool isPostLiked = false;
  int postCount = 0;
  PostBloc postBloc = new PostBloc();
  Post get post => widget.post;
  final List<StoryItem> stories = [];
  late AnimationController _controller;
  final StoryController controller = StoryController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final FirebaseServices firebaseServices = new FirebaseServices();
  late final UserState userState = context.read<UserBloc>().state;
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    setState(() {
      postCount = post.likes;

      isPostLiked = (post.userLikes.contains(user?.uid));
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700),
        lowerBound: 0.0,
        upperBound: 0.1,
        vsync: this)
      ..addListener(() {
        setState(() {});
      });
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

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  deletePost(BuildContext alertContext) async {
    final id = post.id;

    try {
      await posts.doc(id).delete();

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
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.55))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'This action is irreversable. Is this what you intended to do?',
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.5))),
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

  showPostActions() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (BuildContext btx) {
        return Container(
            height: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                  leading: Icon(Icons.bookmark,
                      size: ResponsiveFlutter.of(context).fontSize(2.2)),
                  title: Text(
                    'Save Post',
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.5)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    FlashMessage.buildSuccessSnackbar(context, 'Post Saved');
                  }),
              widget.isPostOwner
                  ? ListTile(
                      leading: Icon(Icons.delete,
                          size: ResponsiveFlutter.of(context).fontSize(2.2)),
                      title: Text(
                        'Delete Post',
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.5)),
                      ),
                      onTap: () {
                        Navigator.of(btx).pop();
                        showAlertDialog(context);
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
    setState(() => targetValue = 170);

    (post.userLikes.contains(userState.user.id))
        ? unLikePost(post.id)
        : likePost(post);
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
    dynamic _scale = 1 - _controller.value;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: <Widget>[
          postHeaderWidget(),
          Stack(alignment: Alignment.center, children: [
            renderMediaWidget(),
            Align(
                alignment: Alignment.center,
                child: likeAnimationWidget(_scale)),
          ]),
          postDetailsWidget(),
          interactionHelper()
        ],
      ),
    );
  }

  Widget likeAnimationWidget(_scale) {
    return Align(
        alignment: Alignment.center,
        child: TweenAnimationBuilder<double>(
          onEnd: () => Future.delayed(
              Duration(milliseconds: 1500),
              () => setState(() {
                    targetValue = 0;
                  })),
          tween: Tween(begin: 0, end: targetValue),
          duration: const Duration(milliseconds: 200),
          builder: (BuildContext builder, double size, Widget? child) {
            print(size);
            return Transform.scale(
                scale: _scale,
                child: IconButton(
                  iconSize: size,
                  color: Colors.grey,
                  icon: child!,
                  onPressed: () {},
                ));
          },
          child: const Icon(Icons.favorite, color: Colors.red),
        ));
  }

  Widget interactionHelper() {
    final postId = post.id;
    final shareCount = post.shares;
    final commentCount = post.commentCount;
    final dateCreated = post.dateCreated;
    final theme =
        BlocProvider.of<ThemeBloc>(context, listen: false).state.theme;
    return Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              likeWidget(),
              IconButton(
                  onPressed: () {},
                  color: Colors.grey[500],
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Constants.postCommentIconOutline,
                    width: 30,
                    height: 30,
                    color: Colors.grey[200],
                  )),
              IconButton(
                  color: Colors.grey[500],
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Constants.sharePostIconOutline,
                    width: 30,
                    height: 30,
                    color: Colors.grey[400],
                  ))
            ]),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    '${TimeElapsed.elapsedTimeDynamic(new DateTime.fromMicrosecondsSinceEpoch(dateCreated).toString())}',
                    style: TextStyle(
                        fontSize:
                            ResponsiveFlutter.of(context).fontSize(1.35))))
          ],
        ));
  }

  /*Widget interactionHelper() {
    final postId = items[index]['id'];
    final shareCount = items[index]['shares'];
    final commentCount = items[index]['commentCount'];

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
                  likeWidget(),
                  GestureDetector(
                      child: Row(children: [
                        Image.asset('assets/images/comment.png',
                            height: 35, width: 35),
                        Text(' $commentCount',
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.3)))
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
                        Text(' $shareCount',
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.3)))
                      ]))
               ])));
  }
*/
  Widget postDetailsWidget() {
    final postId = post.id;
    final caption = post.caption;
    final shareCount = post.shares;

    final commentCount = post.commentCount;

    final itemCount = post.content.length;
    return Material(
      child: Container(
          width: double.infinity,
          // height: auto,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          // borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
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
                        height: 15,
                        child: Text(caption,
                            //   softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.3))))),
              ])),
    );
  }

  Widget renderMediaWidget() {
    final itemCount = post.content.length;
    return Container(
        //  height: 700,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor, // HexColor('#E9E9E9'), //Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Flex(direction: Axis.vertical, children: [
          Expanded(
              child: CarouselSlider.builder(
                  itemCount: itemCount,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    height: 700,
                    onPageChanged: (i, v) => setState(() {
                      currentIndex = i;
                    }),
                    initialPage: 0,
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return GestureDetector(
                        onDoubleTap: () => determineLikeAction(),
                        child: mediaContainer(
                          post,
                          currentIndex,
                        ));
                  }))
        ]));
  }

  Widget postHeaderWidget() {
    final dateCreated = post.dateCreated;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            avatarWidget(),
          ]),
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
    final id = post.user.id;
    final username = post.user.username;
    final profilePic = post.user.profilePic;
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
        style:
            TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.45)),
      )
    ]);
  }

  Widget likeWidget() {
    return LikeButton(
      size: 30,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return isPostLiked
            ? SvgPicture.asset(
                Constants.postLikeIconFill,
                width: 30,
                height: 30,
                color: Colors.red,
              )
            : SvgPicture.asset(
                Constants.postLikeIconOutline,
                width: 30,
                height: 30,
                color: Colors.grey[400],
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
            style: TextStyle(
                color: color,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.1)),
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
    );
  }

  Widget mediaContainer(items, itemIndex) {
    final type = post.content[itemIndex].type;
    final media = post.content[itemIndex].media;

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
