import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:like_button/like_button.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/screens/account.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';
import 'package:frienderr/features/presentation/widgets/like_animation.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';

class RenderPost extends StatefulWidget {
  final PostEntity post;
  final bool isPostOwner;

  RenderPost({
    Key? key,
    required this.post,
    required this.isPostOwner,
  }) : super(key: key);

  _RenderPostState createState() => _RenderPostState();
}

class _RenderPostState extends State<RenderPost> with TickerProviderStateMixin {
  int postCount = 0;
  int currentIndex = 0;
  double targetValue = 0;
  bool isPostLiked = false;
  PostEntity get post => widget.post;
  late AnimationController _controller;
  final FlareControls flareControls = FlareControls();

  @override
  void initState() {
    super.initState();
    setState(() {
      postCount = post.likes;
      isPostLiked = false; //(post.userLikes.contains(user?.uid));
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700),
        lowerBound: 0.0,
        upperBound: 0.1,
        vsync: this)
      ..addListener(() {
        setState(() {});
      });
    // WidgetsBinding.instance?.addPostFrameCallback((_) => controller.pause());
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    // _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    //_refreshController.loadComplete();
  }

  _deletePost(BuildContext alertContext) async {
    final String id = post.id;

    try {
      // await posts.doc(id).delete();

      await FirebaseFirestore.instance
          .collection('postCount')
          .doc('count')
          .update({'count': FieldValue.increment(-1)});
      Navigator.pop(alertContext);
    } catch (err) {}
  }

  Future<void> _showAlertDialog(BuildContext highLevelContext) async {
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
                            .getAdaptiveTextSize(context, 10))),
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
                _deletePost(alertContext);
              },
            ),
          ],
        );
      },
    );
  }

  _showPostActions() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (BuildContext btx) {
        return _postActionItems(btx);
      },
    );
  }

  _likePost(dynamic post) {
    //postBloc.add(LikePost(user: userState.user, post: post));
  }

  _unLikePost(String id) {
    // postBloc.add(UnLikePost(postId: id, userId: userState.user.id));
  }

  void _determineLikeAction() {
    flareControls.play("Like");
    Timer(Duration(milliseconds: 1200), () {
      flareControls.play("IdleUnlike");
    });
  }

  _sharePost(String postId) async {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update({'shares': FieldValue.increment(1)});
    //final uri = await firebaseServices.createDynamicLink(postId);
    // Share.share(uri.toString());
  }

  Widget build(BuildContext context) {
    dynamic _scale = 1 - _controller.value;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: <Widget>[
          _postHeaderWidget(),
          LikeAnimation(
            child: _renderMediaWidget(),
            flareControls: flareControls,
          ),
          _postDetailsWidget(),
          _interactionHelper()
        ],
      ),
    );
  }

  Widget _likeAnimationWidget(_scale) {
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
            // print(size);
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

  Widget _interactionHelper() {
    final String postId = post.id;
    final int shareCount = post.shares;
    final int dateCreated = post.dateCreated;
    final int commentCount = post.commentCount;

    final String theme =
        BlocProvider.of<ThemeBloc>(context, listen: false).state.theme;
    return Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {},
                  color: Colors.grey[500],
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Constants.postCommentIconOutline1,
                    width: 35,
                    height: 35,
                    color: Colors.grey[200],
                  )),
              IconButton(
                  color: Colors.grey[500],
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    Constants.sharePostIconOutline1,
                    width: 25,
                    height: 25,
                    color: Colors.grey[400],
                  ))
            ]),
            _postOptions()
          ],
        ));
  }

  Widget _postDetailsWidget() {
    final String postId = post.id;
    final int shareCount = post.shares;
    final String caption = post.caption;
    final int itemCount = post.content.length;
    final int commentCount = post.commentCount;

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
                    size: Size.square(4),
                    activeColor: Colors.amber[500]!,
                    spacing: const EdgeInsets.all(7.0),
                  ),
                )),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        child: Text(caption,
                            style: TextStyle(
                                fontSize: AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 10))))),
              ])),
    );
  }

  Widget _renderMediaWidget() {
    final itemCount = post.content.length;
    return Container(
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
                        onDoubleTap: () => _determineLikeAction(),
                        child: _mediaContainer(
                          post,
                          currentIndex,
                        ));
                  }))
        ]));
  }

  Widget _postHeaderWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            _avatarWidget(),
          ]),
          _likeWidget(),
        ],
      ),
    ]);
  }

  Widget _postOptions() {
    return Align(
        alignment: Alignment.centerRight,
        child: IconButton(
            onPressed: () => _showPostActions(), icon: Icon(Icons.more_horiz)));
  }

  Widget _avatarWidget() {
    final String id = post.user.id;
    final String username = post.user.username;
    final String profilePic = post.user.profilePic;
    final String timeElasped = TimeElapsed.elapsedTimeDynamic(
        new DateTime.fromMicrosecondsSinceEpoch(post.dateCreated));

    return Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width * .50,
        child: ListTile(
            horizontalTitleGap: 5,
            visualDensity: VisualDensity(horizontal: 0, vertical: -2),
            leading: CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider(profilePic)),
            title: Text(
              username,
              style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 10.5)),
            ),
            subtitle: Text(timeElasped,
                style: TextStyle(
                    fontSize: AdaptiveTextSize()
                        .getAdaptiveTextSize(context, 7.5)))));
  }

  Widget _likeWidget() {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: LikeButton(
          size: 27,
          countPostion: CountPostion.right,
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
          countBuilder: (int? count, bool? isLiked, String text) {
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
                    fontSize:
                        AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
              );
            return result;
          },
          onTap: (bool isLiked) async {
            this.setState(() {
              isPostLiked = !isPostLiked;
              postCount = isPostLiked ? postCount + 1 : postCount - 1;
            });
            _determineLikeAction();
            return true;
          },
        ));
  }

  Widget _postActionItems(BuildContext btx) {
    return Container(
        height: 150,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
              leading: Icon(Icons.bookmark,
                  size: AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
              title: Text(
                'Save Post',
                style: TextStyle(
                    fontSize:
                        AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
              ),
              onTap: () {
                Navigator.pop(context);
                FlashMessage.buildSuccessSnackbar(context, 'Post Saved');
              }),
          widget.isPostOwner
              ? ListTile(
                  leading: Icon(Icons.delete,
                      size:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
                  title: Text(
                    'Delete Post',
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10)),
                  ),
                  onTap: () {
                    Navigator.of(btx).pop();
                    _showAlertDialog(context);
                  })
              : Container(),
        ]));
  }

  Widget _mediaContainer(items, itemIndex) {
    final String type = post.content[itemIndex].type;
    final String media = post.content[itemIndex].media;

    return ConditionalRenderDelegate(
      condition:
          type == Constants.mediaContainerTypes[MediaContainerType.Image],
      renderWidget: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                  imageUrl: media,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder:
                      ((BuildContext ctx, String _, DownloadProgress __) {
                    // print(__.downloaded);
                    return SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                            child: CircularProgressIndicator(
                                //   value: 0.8,
                                strokeWidth: 1.5,
                                backgroundColor: Colors.grey[800],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.amber,
                                ))));
                  })))),
      fallbackWidget: Container(
          width: MediaQuery.of(context).size.width,
          child: VideoScreen(
            video: media,
          )),
    );
  }
}
