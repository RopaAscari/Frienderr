import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/util/helpers.dart';
import 'package:provider/provider.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/blocs/comment_bloc.dart';
import 'package:frienderr/state/comment_state.dart';
import 'package:frienderr/events/comment_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/blocs/notification_bloc.dart';
import 'package:frienderr/events/notification_event.dart';
import 'package:frienderr/models/comment/comment_model.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/models/notification/notification_model.dart';

class Comment extends StatefulWidget {
  final dynamic post;
  Comment({Key? key, required this.post}) : super(key: key);

  CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State<Comment> {
  late final UserState userState;
  final commentBloc = new CommentBloc();
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');
  dynamic get post => widget.post;
  NotificationBloc notificationBloc = new NotificationBloc();
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    userState = context.read<UserBloc>().state;
    fetchComments();
    super.initState();
  }

  makeCommentOnPost() {
    commentBloc.add(PostComment(
        comment: new CommentModel(
            id: Helpers().generateId(32),
            userId: userState.user.id,
            comment: commentController.text,
            username: userState.user.username,
            profilePic: userState.user.profilePic,
            dateCreated: DateTime.now().microsecondsSinceEpoch),
        postId: post['id']));
    if (userState.user.id != post['user']['id']) {
      final notification = new CommentNotificationModel(
        type: 'Comment',
        postId: post['id'],
        senderId: userState.user.id,
        recipient: post['user']['id'],
        comment: commentController.text,
        mediaType: post['content'][0]['type'],
        senderUsername: userState.user.username,
        postThumbnail: post['content'][0]['media'],
        senderProfilePic: userState.user.profilePic,
        dateCreated: DateTime.now().microsecondsSinceEpoch,
      );

      notificationBloc.add(SendCommentNotification(notification: notification));
    }
    commentController.clear();
  }

  fetchComments() {
    commentBloc.add(FetchComments(postId: post['id']));
  }

  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
        bloc: commentBloc,
        builder: (BuildContext context, CommentState state) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(45.0),
                  child: AppBar(
                      elevation: 0,
                      backgroundColor: Theme.of(context).canvasColor,
                      title: const Text(
                        'Comments',
                        style: TextStyle(fontSize: 15),
                      ))),
              body: Center(
                  child: Stack(
                clipBehavior: Clip.none,
                children: [
                  determineCommentRenderWidget(state),
                  commentTextField()
                ],
              )));
        });
  }

  Widget commentTextField() {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: TextField(
                  obscureText: false,
                  controller: commentController,
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    border: new OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () => makeCommentOnPost(),
                        icon: Icon(Icons.send, color: Colors.grey)),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    labelText: 'Comment',
                  ))),
        ),
      )
    ]);
  }

  Widget determineCommentRenderWidget(CommentState state) {
    if (state is CommentsLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is CommentsEmpty) {
      return Center(
          child: Text(
        state.message,
        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.4)),
      ));
    } else if (state is CommentsLoaded) {
      return ListView.builder(
        itemCount: state.comments.length,
        itemBuilder: (context, index) {
          final comment = state.comments[index].comment;
          final username = state.comments[index].username;
          final profilePic = state.comments[index].profilePic;
          final dateCreated = state.comments[index].dateCreated;

          return Center();
          /* return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: CachedNetworkImageProvider(profilePic),
              ),
              subtitle: Text(
                comment,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.3)),
              ),
              title: Text(
                username,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.55)),
              ),
              trailing: Text(
                  TimeElapsed().elapsedTimeDynamic(
                      new DateTime.fromMicrosecondsSinceEpoch(dateCreated)
                          .toString()),
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.3))),
              onTap: () {},
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                // onTap: () => _showSnackBar('Delete'),
              ),
            ],
          );*/
        },
      );
    } else {
      return Center();
    }
  }
}
