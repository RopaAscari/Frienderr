import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';

import 'package:like_button/like_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/flash_message.dart';
import 'package:frienderr/features/presentation/widgets/like_animation.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class RenderPost extends StatefulWidget {
  final Post post;
  final bool isPostOwner;
  final PostBloc postBloc;

  RenderPost({
    Key? key,
    required this.post,
    required this.postBloc,
    required this.isPostOwner,
  }) : super(key: key);

  _RenderPostState createState() => _RenderPostState();
}

class _RenderPostState extends State<RenderPost> with TickerProviderStateMixin {
  int _postCount = 0;
  int _currentIndex = 0;
  bool _isPostLiked = false;
  Post get _post => widget.post;
  PostBloc get _postBloc => widget.postBloc;
  UserDTO _user = getService<UserBloc>().state.user;
  final FlareControls _flareControls = FlareControls();

  @override
  void initState() {
    setState(() {
      // _postCount = _post.likes.length;
      // _isPostLiked = _post.likes.contains(_user.id);
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _likePost() {
    //_postBloc.add(PostEvent.likePost(user: _user, post: _post));
  }

  void _unLikePost() {
    _postBloc.add(PostEvent.unLikePost(postId: _post.id, userId: _user.id));
  }

  void _determineLikeAction() {
    if (_isPostLiked) {
      _unLikePost();
    } else {
      _likePost();
    }
  }

  void _renderLikeAction() {
    _flareControls.play("Like");
    Timer(const Duration(milliseconds: 1200), () {
      _flareControls.play("IdleUnlike");
    });
  }

  Future<void> _deletePost(BuildContext alertContext) async {
    final String id = _post.id;
    try {} catch (err) {}
  }

  Future<void> _sharePost(String postId) async {
    //final uri = await firebaseServices.createDynamicLink(postId);
    // Share.share(uri.toString());
  }

  dynamic _navigateToCommentScreen() async {
    // return await getService<AppRouter>().push(CommentRoute(post: _post));
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    //_refreshController.loadComplete();
  }

  void _showPostActions() {
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

  Future<void> _showAlertDialog(BuildContext highLevelContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext alertContext) {
        return _actionDialog(alertContext);
      },
    );
  }

  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
        bloc: _postBloc,
        listener: (
          BuildContext context,
          PostState state,
        ) {
          if (state.action == PostListenableAction.likeFailure) {
            getService<AppRouter>().context.showToast(
                content: Text('An error occured',
                    style: TextStyle(color: Colors.white)),
                type: SnackBarType.error);
          }
        },
        child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox.expand(
                            child: Column(children: [
                          _renderMediaWidget(),
                          _postDetailsWidget(),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child:
                                  Divider(height: 1, color: Colors.grey[900])),
                          _postHeaderWidget(),
                        ]))),
                    width: MediaQuery.of(context).size.width - 30,
                    height: MediaQuery.of(context).size.height * .75,
                    decoration: BoxDecoration(
                        color: HexColor('#131313').withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15))))));
  }

  Widget _renderMediaWidget() {
    return Stack(children: [
      _mediaSlider(),
      _postOptions(),
      _dotIndicator(),
      //_blurContainer(child: _interactionHelper()),
    ]);
  }

  Widget _interactionHelper() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      _commentButton(),
      //_shareButton(),
      // ReactionButton(onReaction: () => _determineLikeAction()),
    ]);
  }

  Widget _blurContainer({required Widget child}) {
    return Positioned(
        bottom: 0,
        child: Center(
            child: new ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: new ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: Colors.grey[800]!.withOpacity(0.5)),
                            child: child))))));
  }

  Widget _dotIndicator() {
    final int itemCount = _post.content.length;
    return Positioned(
        bottom: 60,
        left: MediaQuery.of(context).size.width * .45,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: itemCount,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                size: Size.square(4),
                activeColor: Colors.amber[500]!,
                spacing: const EdgeInsets.all(7.0),
              ),
            )));
  }

  Widget _mediaSlider() {
    final int itemCount = _post.content.length;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context)
              .primaryColor, // HexColor('#E9E9E9'), //Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
            child: CarouselSlider.builder(
                itemCount: itemCount,
                options: CarouselOptions(
                  height: 700,
                  autoPlay: false,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (i, v) => setState(() {
                    _currentIndex = i;
                  }),
                  initialPage: 0,
                ),
                itemBuilder: (BuildContext context, int i, int p) {
                  return GestureDetector(
                    child: _mediaContainer(
                      _post,
                      _currentIndex,
                    ),
                    onDoubleTap: () => _renderLikeAction(),
                  );
                }))
      ]),
    );
  }

  Widget _postDetailsWidget() {
    final String postId = _post.id;
    final int shareCount = _post.shares;
    final String caption = _post.caption;
    final int commentCount = _post.comments;
    final int itemCount = _post.content.length;
    return Material(
      child: Container(
          width: double.infinity,
          // height: auto,
          padding: const EdgeInsets.only(bottom: 5),
          decoration:
              BoxDecoration(color: HexColor('#131313').withOpacity(0.5)),
          // borderRadius: BorderRadius.vertical(bottom: 161616.circular(8))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        child: Text(caption,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 10))))),
              ])),
    );
  }

  Widget _commentButton() {
    return Padding(
        padding: EdgeInsets.only(right: 5),
        child: Row(children: [
          //  Text(_post.commentCount.toString(),
          //   style: TextStyle(color: Colors.grey[400])),
          IconButton(
              onPressed: () => _navigateToCommentScreen(),
              color: Colors.white,
              icon: SvgPicture.asset(
                Constants.postCommentIconOutline1,
                width: 25,
                height: 25,
                color: Colors.grey[400],
              ))
        ]));
  }

  Widget _shareButton() {
    return Padding(
        padding: EdgeInsets.only(right: 15),
        child: Row(children: [
          Text(_post.shares.toString(), style: TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () => null,
              icon: SvgPicture.asset(
                Constants.shareCircleIconOutline,
                width: 25,
                height: 25,
                color: Colors.white,
              ))
        ]));
  }

  Widget _likeWidget() {
    return Padding(
        padding: const EdgeInsets.only(right: 0),
        child: LikeButton(
          size: 28,
          countPostion: CountPostion.left,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return ConditionalRenderDelegate(
                condition: _isPostLiked,
                renderWidget: SvgPicture.asset(
                  Constants.postLikeIconFill,
                  width: 25,
                  height: 25,
                  color: Colors.red,
                ),
                fallbackWidget: SvgPicture.asset(
                  Constants.postLikeIconOutline,
                  width: 25,
                  height: 25,
                  color: Colors.grey[600],
                ));
          },
          likeCount: _postCount,
          countBuilder: (int? count, bool? isLiked, String text) {
            final Color color = _isPostLiked //||
                ? Colors.red
                : Colors.grey[600]!;

            return Center();
            /*ConditionalRenderDelegate(
                condition: count == 0,
                renderWidget: Center(),
                fallbackWidget: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      text,
                      style: TextStyle(color: color, fontSize: 14),
                    )));*/
          },
          onTap: (bool isLiked) async {
            _determineLikeAction();

            this.setState(() {
              _isPostLiked = !_isPostLiked;
              _postCount = _isPostLiked ? _postCount + 1 : _postCount - 1;
            });

            _renderLikeAction();
            return true;
          },
        ));
  }

  Widget _postHeaderWidget() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_avatarWidget(), _interactionHelper()]),
      ],
    );
  }

  Widget _postOptions() {
    return Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () => _showPostActions(),
                    icon: Icon(Icons.more_horiz)))));
  }

  Widget _avatarWidget() {
    final String id = _post.user.id;
    final String username = _post.user.username as String;
    final String profilePic = _post.user.profilePic as String;
    final String timeElasped = TimeElapsed.elapsedTimeDynamic(
        new DateTime.fromMicrosecondsSinceEpoch(_post.dateCreated));

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

  Widget _actionDialog(BuildContext alertContext) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text('Delete Post',
          style: TextStyle(
              fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                'This action is irreversable. Is this what you intended to do?',
                style: TextStyle(
                    fontSize:
                        AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
          ],
        ),
      ),
      actions: <Widget>[
        /* TextButton(
       
          onPressed: () {
            Navigator.of(alertContext).pop();
          },Widget: const Text('Cancel') ,
        ),
        TextButton(
          onPressed: () {
            _deletePost(alertContext);
          },Widget: const Text('Delete') ,
        ),*/
      ],
    );
    ;
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
          ConditionalRenderDelegate(
            fallbackWidget: Container(),
            renderWidget: ListTile(
                leading: Icon(Icons.delete,
                    size: AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
                title: Text(
                  'Delete Post',
                  style: TextStyle(
                      fontSize:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
                ),
                onTap: () {
                  Navigator.of(btx).pop();
                  _showAlertDialog(context);
                }),
            condition: widget.isPostOwner,
          )
        ]));
  }

  Widget _mediaContainer(items, itemIndex) {
    final String type = _post.content[itemIndex].type;
    final String media = _post.content[itemIndex].media;

    return ConditionalRenderDelegate(
      fallbackWidget: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: VideoScreen(
                video: media,
                onInitialized: (v) {},
              ))),
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
                                strokeWidth: 1.5,
                                backgroundColor: Colors.grey[800],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.amber,
                                ))));
                  })))),
      condition:
          type == Constants.mediaContainerTypes[MediaContainerType.Image],
    );
  }
}
