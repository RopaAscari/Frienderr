import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/presentation/widgets/post/popup_items.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';
import 'package:frienderr/features/presentation/widgets/user_avatar.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/presentation/widgets/post/share_button.dart';
import 'package:frienderr/features/presentation/widgets/post/comment_button.dart';
import 'package:frienderr/features/presentation/widgets/post/bookmark_button.dart';
import 'package:frienderr/features/presentation/widgets/post/carousel_builder.dart';
import 'package:frienderr/features/presentation/screens/comment/comment_screen.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/widgets/reaction_button/reaction_button.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final BlocGroup blocGroup;
  const PostItem({Key? key, required this.post, required this.blocGroup})
      : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with TickerProviderStateMixin {
  Post get _post => widget.post;
  late int commentCount = widget.post.comments;
  BlocGroup get _blocGroup => widget.blocGroup;
  late AnimationController _animationController;
  String _currentReacton = Assets.lottie.thumbs;
  UserModel get _user => widget.blocGroup.userBloc.state.user;

  @override
  void initState() {
    super.initState();
    _initializeAnimationControllers();
  }

  void _initializeAnimationControllers() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
  }

  void _onComment() {
    setState(() {
      commentCount++;
    });
  }

  void _onDelete() {
    setState(() {
      commentCount--;
    });
  }

  String _handleReaction(String reaction) {
    String _reaction = Assets.lottie.heartAnimation;

    switch (reaction) {
      case Reactions.like:
        _reaction = Assets.lottie.thumbs;

        break;
      case Reactions.love:
        _reaction = Assets.lottie.heartAnimation;

        break;
      case Reactions.care:
        _reaction = Assets.lottie.thumbs;

        break;
      case Reactions.lol:
        _reaction = Assets.lottie.thumbs;

        break;
      case Reactions.sad:
        _reaction = Assets.lottie.thumbs;

        break;
      case Reactions.angry:
        _reaction = Assets.lottie.thumbs;

        break;
    }

    setState(() {
      _currentReacton = _reaction;
    });
    return reaction;
  }

  void _onUnReact() {
    //_handleReaction(reaction);
    //print("on un react");
    var _latestReactions = [..._post.latestReactions];

    final _postReaction =
        PostReaction(uid: _user.id, postId: _post.id, reaction: Reactions.like);

    if (_latestReactions.isNotEmpty) {
      _latestReactions.removeWhere((reaction) => reaction.uid == _user.id);
    }
    widget.blocGroup.postBloc.add(PostEvent.unReactToPost(
      reaction: _postReaction,
      latestReactions: _latestReactions,
    ));
  }

  void _onReactionUpdate(String reaction) {
    //print("on update");
    _handleReaction(reaction);

    var _latestReactions = [..._post.latestReactions];

    final _postReaction =
        PostReaction(postId: _post.id, uid: _user.id, reaction: reaction);

    widget.blocGroup.postBloc.add(PostEvent.updateReaction(
      reaction: _postReaction,
      latestReactions: _latestReactions,
    ));
  }

  void _onReaction(String reaction) {
    // print("on react");
    _handleReaction(reaction);

    var _latestReactions = [..._post.latestReactions];

    final _postReaction =
        PostReaction(postId: _post.id, uid: _user.id, reaction: reaction);

    if (_latestReactions.length < 3) {
      _latestReactions.add(_postReaction);
    }

    widget.blocGroup.postBloc.add(PostEvent.reactToPost(
      post: _post,
      user: _user,
      reaction: _postReaction,
      latestReactions: _latestReactions,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: _buildContainer(
            child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    _buildMedia(),
                    _buildCaption(),
                    _buildPostActions()
                  ],
                ))));
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: const [],
          color: HexColor("#070708").withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[900]!.withOpacity(0.5)),
        ),
        child: child);
  }

  Widget _buildOptionIcon() {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: BookmarkButton(
              userId: _user.id,
              postId: _post.id,
              isSaved: _post.isSaved ?? false,
              postBloc: widget.blocGroup.postBloc,
            )),
        PopupMenuContainer<PostActions>(
          child: const Icon(Icons.more_horiz),
          items:
              _post.user.id == _user.id ? userPostPopupItems : postPopupItems,
          onItemSelected: (value) async {
            if (value == PostActions.delete) {
              _blocGroup.postBloc.add(PostEvent.deletePost(postId: _post.id));
            } else if (value == PostActions.report) {
              getService<AppRouter>().context.showToast(
                  content: const Text("We are looking into this matter for you",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  type: SnackBarType.idle);
            }
          },
        ),
      ],
    );
  }

  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReactionButton(
              onUnReact: _onUnReact,
              onReaction: _onReaction,
              onUpdate: _onReactionUpdate,
              reactionCount: _post.reactions,
              initialReaction: _post.userReaction,
              latestReactions: _post.latestReactions,
              animationController: _animationController),
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: CommentButton(
                              post: _post,
                              user: _user,
                              onDelete: _onDelete,
                              onComment: _onComment,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ShareButton(
                        postId: _post.id,
                        postBloc: widget.blocGroup.postBloc,
                      ),
                    ),
                  ],
                ),
                /*Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 7),
                  child: Text('$commentCount comments',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(1.25))),
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaption() {
    final _size = _post.type == TimelinePostType.post ? 1.35 : 1.7;
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 5.0, left: 8),
      child: Text(_post.caption,
          style: TextStyle(
              fontFamily: 'Inter',
              color: Theme.of(context).textTheme.bodyText2!.color,
              fontSize: ResponsiveFlutter.of(context).fontSize(_size))),
    );
  }

  Widget _buildMedia() {
    return Stack(
      children: [
        /* Center(
            child: Lottie.asset(
          _currentReacton,
          width: 300.0,
          height: 300.0,
          repeat: false,
          animate: false,
          controller: _animationController,
        )),8*/
        ConditionalRenderDelegate(
          condition: _post.type == TimelinePostType.post,
          fallbackWidget: const Center(),
          renderWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 580,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: PostCarouselBuilder(post: _post, height: 550)
                  /*,*/
                  ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                _buildUserAvatar(),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildUserName(), _buildTimeElapsed()],
                  ),
                )
              ],
            ),
            _buildOptionIcon()
          ]),
        ),
      ],
    );
  }

  Widget _buildUserName() {
    return Text(_post.user.username,
        style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveFlutter.of(context).fontSize(1.6)));
  }

  Widget _buildTimeElapsed() {
    final _timeElasped = TimeElapsed.fromDateTime(
        DateTime.fromMillisecondsSinceEpoch(_post.dateCreated));

    return Text(
      _timeElasped,
      style: TextStyle(
          color: Colors.white,
          fontSize: ResponsiveFlutter.of(context).fontSize(1.2)),
    );
  }

  Widget _buildUserAvatar() {
    return UserAvatar(
      blocGroup: _blocGroup,
      avatarUserId: _post.user.id,
      profilePic: _post.user.profilePic!,
    );
  }
}
