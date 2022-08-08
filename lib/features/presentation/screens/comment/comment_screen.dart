import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/blocs/comment/comment_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';

class CommentScreen extends StatefulWidget {
  final Post? post;
  final Snap? snap;
  final UserModel user;
  final CommentType type;
  final Function() onDelete;
  final Function() onComment;

  const CommentScreen({
    Key? key,
    this.post,
    this.snap,
    required this.user,
    required this.type,
    required this.onDelete,
    required this.onComment,
  }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  Post? get _post => widget.post;
  Snap? get _snap => widget.snap;
  UserModel get _user => widget.user;
  CommentType get _type => widget.type;
  final CommentBloc _commentBloc = getService<CommentBloc>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentBloc
        .add(CommentEvent.getComments(postId: _buildPostId(), type: _type));
  }

  void _deleteComment(String id) {
    _commentBloc.add(CommentEvent.deleteComment(
      id: id,
      type: _type,
      postId: _buildPostId(),
    ));

    widget.onDelete();
  }

  void _commentOnPost() {
    final _comment = CommentDTO(
      likes: [],
      postId: _buildPostId(),
      id: Helpers.generateId(25),
      comment: _commentController.text,
      dateCreated: DateTime.now().millisecondsSinceEpoch,
      user: UserDTO(
          id: _user.id, username: _user.username, profilePic: _user.profilePic),
    );

    NotificationDTO? notification;

    if (_type == CommentType.post) {
      late final String display;

      if (_post!.content.first.type == 'video') {
        display = _post!.content.first.metadata.thumbnail as String;
      } else {
        display = _post!.content.first.media;
      }

      notification = NotificationDTO(
        type: 2,
        mediaType: 1,
        recipientId: _post!.user.id,
        id: Helpers.generateId(25),
        metadata: NotificationMetadataDTO(),
        dateCreated: DateTime.now().microsecondsSinceEpoch,
        post: PartialPostDTO(id: _post!.id, display: display),
        user: UserDTO(id: _user.id, username: _user.username),
      );
    } else if (_type == CommentType.snap) {
      notification = NotificationDTO(
        type: 2,
        mediaType: 1,
        recipientId: _snap!.user.id,
        id: Helpers.generateId(25),
        metadata: NotificationMetadataDTO(),
        dateCreated: DateTime.now().microsecondsSinceEpoch,
        post: PartialPostDTO(id: _snap!.id, display: _snap!.thumbnail),
        user: UserDTO(id: _user.id, username: _user.username),
      );
    }

    _commentBloc.add(CommentEvent.postComment(
        comment: _comment, notification: notification, type: _type));

    _commentController.clear();

    widget.onComment();
  }

  String _buildPostId() {
    if (_type == CommentType.post) {
      return _post!.id;
    } else if (_type == CommentType.snap) {
      return _snap!.id;
    }
    return '';
  }

  void _listener(BuildContext context, CommentState state) {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(clipBehavior: Clip.none, children: [
      CustomScrollView(slivers: [
        _buildAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SmartRefresher(
                enablePullUp: false,
                enablePullDown: true,
                controller: _refreshController,
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 2000));
                  _refreshController.refreshCompleted();
                },
                header: CustomHeader(
                    builder: (BuildContext context, RefreshStatus? mode) {
                  if (mode == RefreshStatus.refreshing) {
                    return const Center(
                        child: LoadingIndicator(size: Size(40, 40)));
                  }

                  return const Center();
                }),
                child: BlocConsumer<CommentBloc, CommentState>(
                    bloc: _commentBloc,
                    listener: _listener,
                    listenWhen:
                        (CommentState prevState, CommentState currState) {
                      return true;
                    },
                    builder: (BuildContext context, CommentState state) {
                      return PagedListView<int, Comment>(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        pagingController:
                            _commentBloc.state.paginationController,
                        builderDelegate: PagedChildBuilderDelegate<Comment>(
                          animateTransitions: true,
                          noItemsFoundIndicatorBuilder: (ctx) {
                            return Center(
                                heightFactor: 40,
                                child: Text(
                                  'Be the first to comment on this post',
                                  style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.4)),
                                ));
                          },
                          firstPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          newPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                          itemBuilder: (context, comment, index) {
                            return _buildCommentList(comment: comment);
                          },
                        ),
                      );
                    })),
          )
        ])),
      ]),
      _buildCommentTextField()
    ]));
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        floating: true,
        leading: const Center(),
        title: null,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
        expandedHeight: 55,
        flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.1),
                title: const Text(
                  'Comments',
                  style: TextStyle(fontSize: 15),
                ))));
  }

  Widget _buildCommentTextField() {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Flex(direction: Axis.horizontal, children: [
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: TextField(
                    obscureText: false,
                    controller: _commentController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle:
                          const TextStyle(color: Colors.grey, fontSize: 13.5),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () => _commentOnPost(),
                          icon: const Icon(Icons.send, color: Colors.grey)),
                      filled: true,
                      fillColor: Theme.of(context).canvasColor,
                      labelText: 'Comment',
                    ))),
          ),
        )
      ]),
    );
  }

  Widget _buildCommentList({required Comment comment}) {
    final likes = comment.likes;
    final commentText = comment.comment;
    final username = comment.user.username;
    final dateCreated = comment.dateCreated;
    final profilePic = comment.user.profilePic!;

    return Slidable(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(profilePic),
        ),
        subtitle: Text(
          commentText,
          style:
              TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.5)),
        ),
        title: Text(
          username,
          style:
              TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.6)),
        ),
        trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  TimeElapsed.elapsedTimeDynamic(
                      DateTime.fromMillisecondsSinceEpoch(dateCreated)
                          .toString()),
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
              Container(
                width: 30,
                height: 30,
                child: const Center(),
                margin: const EdgeInsets.only(top: 5),
              )
            ]),
        onTap: () {},
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            spacing: 1,
            label: 'Delete',
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (context) => _deleteComment(comment.id),
          ),
        ],
      ),
    );
  }
}
