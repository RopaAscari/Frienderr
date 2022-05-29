import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/account/user_account.dart';
import 'package:frienderr/features/presentation/widgets/render_posts_dynamic.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';

class NotificationScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const NotificationScreen({Key? key, required this.blocGroup})
      : super(key: key);

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen>
    with AutomaticKeepAliveClientMixin<NotificationScreen> {
  BlocGroup get blocGroup => widget.blocGroup;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  User? user = FirebaseAuth.instance.currentUser;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    //blocGroup.notificationBloc
    //   .add(NotificationEvent.getNotifications(uid: user!.uid));
    super.initState();
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text('Notifications'),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
            bloc: blocGroup.notificationBloc,
            builder: (BuildContext context, NotificationState state) {
              switch (state.currentState) {
                case NotificationStatus.loading:
                  return _notificationLoading();
                case NotificationStatus.error:
                  return _notificationError(state.error);
                case NotificationStatus.loaded:
                  return __notificationList(state.notifications);
                default:
                  return const Center();
              }
            },
            listener: (BuildContext context, NotificationState state) {}));
  }

  Widget _notificationError(String error) {
    return ErrorDisplay(error: error);
  }

  Widget _notificationLoading() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80,
        child: const Center(
            child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }

  Widget _emptyNotifications() {
    return SizedBox(
      child: const Center(
        child: Text(
          "No new posts on your feed",
          style: TextStyle(fontSize: 13),
        ),
      ),
      height: MediaQuery.of(context).size.height * .60,
    );
  }

  Widget __notificationList(List<NotificationEntity> notifications) {
    if (notifications.isEmpty) {
      return _emptyNotifications();
    }

    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const ClassicHeader(
          idleText: '',
          releaseText: '',
          completeText: '',
          refreshingText: '',
          refreshingIcon: LoadingIndicator(size: Size(40, 40)),
          idleIcon: LoadingIndicator(size: Size(40, 40)),
          // completeIcon: LoadingIndicator(size: Size(40, 40)),
          releaseIcon: Center(),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            return const Center();
          },
        ),
        controller: _refreshController,
        child: ListView.builder(
            itemExtent: 72,
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              switch (notifications[index].type) {
                case 1:
                  return renderLikeNotification(notifications[index]);
                case 2:
                  return renderCommentNotification(notifications[index]);
                case 3:
                  return renderFollowNotification(notifications[index]);

                default:
                  return Container();
              }
            }));
  }

  Widget renderFollowNotification(NotificationEntity notification) {
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String senderUsername = notification.user.username ?? '';
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAccountScreen(
                            blocGroup: blocGroup,
                            isProfileOwnerViewing: false,
                            profileUserId: senderId,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername has started following you',
              style: TextStyle(
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 10))),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: const BorderSide(
                                          color: Colors.transparent))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amber[800] as Color),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(60, 22))),
                      child:
                          const Text('Follow', style: TextStyle(fontSize: 11)),
                      onPressed: () => null,
                    )),
                Text(
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: const AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10))),
              ])),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 0,
            flex: 1,
            onPressed: (context) => null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    );
  }

  Widget renderLikeNotification(NotificationEntity notification) {
    final String postId = notification.id;
    final int mediaType = notification.mediaType;
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String postThumbnail = notification.post.display;
    final String senderUsername = notification.user.username ?? '';
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAccountScreen(
                            blocGroup: blocGroup,
                            profileUserId: senderId,
                            isProfileOwnerViewing: false,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername liked your post',
              style: TextStyle(
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 10))),
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
                            alignment: const Alignment(-.2, 0),
                            image: CachedNetworkImageProvider(postThumbnail),
                            fit: BoxFit.cover),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Text(
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: const AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10)))
              ])),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 0,
            flex: 1,
            onPressed: (context) => null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    );
  }

  Widget renderCommentNotification(NotificationEntity notification) {
    final String postId = notification.id;
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String postThumbnail = notification.post.display;
    final String comment = notification.metadata.comment ?? '';
    final String senderUsername = notification.user.username ?? '';
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserAccountScreen(
                            blocGroup: blocGroup,
                            profileUserId: senderId,
                            isProfileOwnerViewing: false,
                          ))),
              child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(senderProfilePic))),
          title: Text('$senderUsername comment "$comment" on your post',
              style: TextStyle(
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 10))),
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
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: TextStyle(
                        fontSize: const AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10)))
              ])),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 0,
            flex: 1,
            onPressed: (context) => null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    );
  }
}
