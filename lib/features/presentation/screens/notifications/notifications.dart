import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:frienderr/features/presentation/widgets/empy_builder.dart';
import 'package:frienderr/features/presentation/widgets/user_avatar.dart';

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
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
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
  BlocGroup get _blocGroup => widget.blocGroup;
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

  void _listener(BuildContext context, NotificationState state) {}
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(slivers: [
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
                child: BlocConsumer<NotificationBloc, NotificationState>(
                    bloc: _blocGroup.notificationBloc,
                    listener: _listener,
                    listenWhen: (NotificationState prevState,
                        NotificationState currState) {
                      return true;
                    },
                    builder: (BuildContext context, NotificationState state) {
                      return PagedListView<int, NotificationModel>(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        pagingController: _blocGroup
                            .notificationBloc.state.paginationController,
                        builderDelegate:
                            PagedChildBuilderDelegate<NotificationModel>(
                          animateTransitions: true,
                          firstPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          noItemsFoundIndicatorBuilder: (ctx) {
                            return SizedBox(
                                height: MediaQuery.of(context).size.height * .8,
                                child: const Center(
                                    child: Text(
                                        "You have no current activity on your feed",
                                        style: TextStyle(fontSize: 13))));
                          },
                          newPageProgressIndicatorBuilder: (ctx) {
                            return const LoadingIndicator(size: Size(40, 40));
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                          itemBuilder: (context, item, index) {
                            return Padding(
                              child: _buildNotificationList(item),
                              padding: const EdgeInsets.only(top: 10.0),
                            );
                          },
                        ),
                      );
                    })))
      ]))
    ]);
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        title: null,
        floating: true,
        leading: const Center(),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        expandedHeight: 55,
        flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).canvasColor,
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 15),
                ))));
  }

  Widget _buildNotificationList(NotificationModel notification) {
    switch (notification.type) {
      case 1:
        return renderLikeNotification(notification);
      case 2:
        return renderCommentNotification(notification);
      case 3:
        return renderFollowNotification(notification);

      default:
        return Container();
    }
    ;
  }

  Widget renderFollowNotification(NotificationModel notification) {
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String senderUsername = notification.user.username;
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: UserAvatar(
              blocGroup: _blocGroup,
              avatarUserId: senderId,
              profilePic: senderProfilePic),
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
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(60, 22))),
                      child:
                          const Text('Follow', style: TextStyle(fontSize: 11)),
                      onPressed: () => null,
                    )),
                Text(
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: const TextStyle(fontSize: 12)),
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

  Widget renderLikeNotification(NotificationModel notification) {
    final String postId = notification.id;
    final int mediaType = notification.mediaType;
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String postThumbnail = notification.post.display;
    final String senderUsername = notification.user.username;
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: UserAvatar(
              blocGroup: _blocGroup,
              avatarUserId: senderId,
              profilePic: senderProfilePic),
          title: Text('$senderUsername liked your post',
              style: const TextStyle(fontSize: 13)),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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
                Text(
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: const TextStyle(fontSize: 12))
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
            //  icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
    );
  }

  Widget renderCommentNotification(NotificationModel notification) {
    final String postId = notification.id;
    final String senderId = notification.user.id;
    final int timeElasped = notification.dateCreated;
    final String postThumbnail = notification.post.display;
    final String comment = notification.metadata.comment ?? '';
    final String senderUsername = notification.user.username;
    final String senderProfilePic = notification.user.profilePic ?? '';

    return Slidable(
      child: ListTile(
          leading: UserAvatar(
              blocGroup: _blocGroup,
              avatarUserId: senderId,
              profilePic: senderProfilePic),
          title: Text('$senderUsername comment "$comment" on your post',
              style: const TextStyle(fontSize: 13)),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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
                Text(
                    TimeElapsed.elapsedTimeDynamic(
                        DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                            .toString()),
                    style: const TextStyle(fontSize: 12)),
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
