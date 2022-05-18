import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/presentation/widgets/like_button.dart';
import 'package:provider/provider.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/comment/comment_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';

class CommentScreen extends StatefulWidget {
  final PostEntity post;
  CommentScreen({Key? key, required this.post}) : super(key: key);

  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  dynamic get _post => widget.post;
  CommentBloc _commentBloc = getIt<CommentBloc>();
  final UserEntity _user = getIt<UserBloc>().state.user;
  NotificationBloc _notificationBloc = getIt<NotificationBloc>();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentBloc.add(CommentEvent.getComments(postId: _post.id));
  }

  void _commentOnPost() {
    final CommentEntity _comment = CommentEntity(
        likes: [],
        postId: _post.id,
        id: Helpers().generateId(32),
        user: PartialUser(id: _user.id),
        comment: _commentController.text,
        dateCreated: DateTime.now().microsecondsSinceEpoch);

    _commentBloc.add(
        CommentEvent.postComment(comment: _comment, post: _post, user: _user));

    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).canvasColor,
                title: const Text(
                  'Comments',
                  style: TextStyle(fontSize: 15),
                ))),
        body: BlocConsumer<CommentBloc, CommentState>(
            bloc: _commentBloc,
            listener: (BuildContext context, CommentState state) {
              if (state.action == CommentListenableAction.created) {
                _commentBloc
                    .add(CommentEvent.getPaginatedComments(postId: _post.id));
              }
            },
            builder: (BuildContext context, CommentState state) {
              return Center(
                  child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _determineCommentRenderWidget(state),
                  _commentTextField()
                ],
              ));
            }));
  }

  Widget _commentTextField() {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextField(
                  obscureText: false,
                  controller: _commentController,
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    border: new OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () => _commentOnPost(),
                        icon: Icon(Icons.send, color: Colors.grey)),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    labelText: 'Comment',
                  ))),
        ),
      )
    ]);
  }

  Widget _determineCommentRenderWidget(CommentState state) {
    print(state.currentState == CommentStatus.loading);
    switch (state.currentState) {
      case CommentStatus.loaded:
        return _commentList(state.comments);
      case CommentStatus.loading:
        return _commentLoading();
      case CommentStatus.faliure:
        return _commentFailure(state.error);

      default:
        return Center();
    }
  }

  Widget _commentFailure(String error) {
    return Center(child: Text(error));
  }

  Widget _commentLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _commentList(List<CommentEntity> comments) {
    if (comments.length == 0) {
      return Center(
          child: Text(
        'Be the first to comment on this post',
        style: TextStyle(fontSize: 16),
      ));
    }
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final likes = comments[index].likes;
        final comment = comments[index].comment;
        final username = comments[index].user.username;
        final dateCreated = comments[index].dateCreated;
        final profilePic = comments[index].user.profilePic;

        return Slidable(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(profilePic),
            ),
            subtitle: Text(
              comment,
              style: TextStyle(fontSize: 16),
            ),
            title: Text(
              username,
              style: TextStyle(fontSize: 16),
            ),
            trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      TimeElapsed.elapsedTimeDynamic(
                          new DateTime.fromMicrosecondsSinceEpoch(dateCreated)
                              .toString()),
                      style: TextStyle(fontSize: 15)),
                  Container(
                    width: 30,
                    height: 30,
                    child: AppLikeButton(
                      size: 20,
                      onLike: () {},
                      hideCount: true,
                      color: Colors.red,
                      likeCount: likes.length,
                    ),
                    margin: const EdgeInsets.only(top: 5),
                  )
                ]),
            onTap: () {},
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                spacing: 2,
                flex: 2,
                onPressed: (context) => null,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
