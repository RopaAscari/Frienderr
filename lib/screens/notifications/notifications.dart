import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/widgets/render_posts_dynamic/render_posts_dynamic.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<Notifications>
    with AutomaticKeepAliveClientMixin<Notifications> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  Widget build(BuildContext context) {
    super.build(context);
    late UserState userState = context.read<UserBloc>().state;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text('Notifications'),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('activity')
                .doc(userState.user.id)
                .collection('notifications')
                .orderBy('dateCreated', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              final notifications = snapshot.data?.docs ?? [];
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: ClassicHeader(
                    idleText: '',
                    releaseText: '',
                    completeText: '',
                    refreshingText: '',
                    idleIcon: CupertinoActivityIndicator(radius: 10),
                    completeIcon: CupertinoActivityIndicator(radius: 10),
                    releaseIcon: CupertinoActivityIndicator(radius: 10),
                  ),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      return Center();
                    },
                  ),
                  controller: _refreshController,
                  onRefresh: () => _onRefresh(),
                  onLoading: () => _onLoading(),
                  child: notifications.length == 0
                      ? Center(
                          child: Text('You have no notifications',
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.4))))
                      : ListView.builder(
                          itemExtent: 72,
                          itemCount: notifications.length,
                          itemBuilder: (BuildContext context, int index) {
                            final notificationType =
                                notifications[index]['type'];

                            switch (notificationType) {
                              case 'Like':
                                return renderLikeNotification(
                                    notifications[index]);

                              case 'Follow':
                                return renderFollowNotification(
                                    notifications[index]);

                              case 'Comment':
                                return renderCommentNotification(
                                    notifications[index]);

                              default:
                                return Container();
                            }
                          }));
            }));
  }

  Widget renderFollowNotification(
      QueryDocumentSnapshot<Object?> notifications) {
    final senderId = notifications['senderId'];
    final timeElasped = notifications['dateCreated'];
    final senderUsername = notifications['senderUsername'];
    final senderProfilePic = notifications['senderProfilePic'];

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Account(
                            isProfileOwnerViewing: false,
                            profileUserId: senderId,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername has started following you',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.3))),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.transparent))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amber[800] as Color),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(60, 22))),
                      child: Text('Follow', style: TextStyle(fontSize: 11)),
                      onPressed: () => null,
                    )),
                Text(
                    TimeElapsed().elapsedTimeDynamic(
                        new DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.3))),
              ])),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          // onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }

  Widget renderLikeNotification(QueryDocumentSnapshot<Object?> notifications) {
    final postId = notifications['postId'];
    final senderId = notifications['senderId'];
    final mediaType = notifications['mediaType'];
    final timeElasped = notifications['dateCreated'];
    final postThumbnail = notifications['postThumbnail'];
    final senderUsername = notifications['senderUsername'];
    final senderProfilePic = notifications['senderProfilePic'];

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Account(
                            isProfileOwnerViewing: false,
                            profileUserId: senderId,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername liked your post',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.3))),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RenderPostDynamic(
                              postId: postId, isPostOwner: true))),
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment(-.2, 0),
                            image: CachedNetworkImageProvider(
                                mediaType == 'image'
                                    ? postThumbnail
                                    : Constants.videoLogo),
                            fit: BoxFit.cover),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Text(
                    TimeElapsed().elapsedTimeDynamic(
                        new DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.3)))
              ])),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          // onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }

  Widget renderCommentNotification(
      QueryDocumentSnapshot<Object?> notifications) {
    final postId = notifications['postId'];
    final comment = notifications['comment'];
    final senderId = notifications['senderId'];
    final timeElasped = notifications['dateCreated'];
    final postThumbnail = notifications['postThumbnail'];
    final senderUsername = notifications['senderUsername'];
    final senderProfilePic = notifications['senderProfilePic'];

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Account(
                            isProfileOwnerViewing: false,
                            profileUserId: senderId,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername comment "$comment" on your post',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.3))),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RenderPostDynamic(
                                  postId: postId,
                                  isPostOwner: true,
                                ))),
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment(-.2, 0),
                              image: CachedNetworkImageProvider(postThumbnail),
                              fit: BoxFit.cover),
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                Text(
                    TimeElapsed().elapsedTimeDynamic(
                        new DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.3)))
              ])),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          // onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
