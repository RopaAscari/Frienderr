import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/followers_bloc.dart';
import 'package:frienderr/blocs/following_bloc.dart';
import 'package:frienderr/events/followers_event.dart';
import 'package:frienderr/events/following_event.dart';
import 'package:frienderr/state/followers_state.dart';
import 'package:frienderr/state/following_state.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class ViewFriendsList extends StatefulWidget {
  final String id;
  final bool isFollowersInitial;

  ViewFriendsList({required this.id, required this.isFollowersInitial})
      : super();

  ViewFriendsListState createState() => ViewFriendsListState();
}

class ViewFriendsListState extends State<ViewFriendsList> {
  String get id => widget.id;
  late final PageController _pageController;
  late int currentPage = isFollowersInitial ? 0 : 1;
  FollowersBloc followersBloc = new FollowersBloc();
  FollowingBloc followingBloc = new FollowingBloc();
  bool get isFollowersInitial => widget.isFollowersInitial;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController _refreshController2 =
      RefreshController(initialRefresh: false);

  void initState() {
    fetchFriendsList();
    _pageController = PageController(initialPage: isFollowersInitial ? 0 : 1);

    super.initState();
  }

  fetchFriendsList() {
    followersBloc.add(GetFollowers(id: id));
    followingBloc.add(GetFollowing(id: id));
  }

  changePage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    setState(() {
      currentPage = page;
    });
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  void _onRefreshFollowers() async {
    _refreshController2.refreshCompleted();
  }

  void _onLoadingFollowers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController2.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(30), child: headerWidget()),
        Expanded(
            child: PageView(
          controller: _pageController,
          onPageChanged: (page) => changePage(page),
          children: <Widget>[
            renderFollowerList(),
            renderFollowingList(),
          ],
        ))
      ]),
    );
  }

  Widget headerWidget() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () => changePage(0),
              child: Column(children: [
                Text(
                  'Followers\n',
                  style: TextStyle(
                      fontWeight: currentPage == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: ResponsiveFlutter.of(context)
                          .fontSize(currentPage == 0 ? 1.6 : 1.5),
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                // currentPage == 0 ? sliderBar() : Container()
              ])),
          GestureDetector(
              onTap: () => changePage(1),
              child: Column(children: [
                Text(
                  'Following\n',
                  style: TextStyle(
                      fontWeight: currentPage == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: ResponsiveFlutter.of(context)
                          .fontSize(currentPage == 1 ? 1.6 : 1.5),
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                // currentPage == 1 ? sliderBar() : Container()
              ]))
        ]);
  }

  Widget sliderBar() {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget renderFollowerList() {
    return BlocBuilder<FollowersBloc, FollowerState>(
        bloc: followersBloc,
        builder: (
          BuildContext context,
          FollowerState state,
        ) {
          if (state is FollowersLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FollowersEmpty) {
            return Center(
              child: Text(state.message,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
            );
          }

          if (state is FollowerLoaded) {
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
                controller: _refreshController2,
                onRefresh: () => _onRefreshFollowers(),
                onLoading: () => _onLoadingFollowers(),
                child: ListView.builder(
                  itemCount: state.followers.length,
                  itemBuilder: (context, index) {
                    final id = state.followers[index].id;
                    final username = state.followers[index].username;
                    final profilePic = state.followers[index].profilePic;
                    final userPresence = state.followers[index].presence;

                    return Card(
                        color: Theme.of(context).canvasColor,
                        child: ListTile(
                            leading: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    CachedNetworkImageProvider(profilePic)),
                            trailing: Icon(Icons.circle,
                                size: 15,
                                color:
                                    userPresence ? Colors.green : Colors.amber),
                            title: Text(
                              '$username',
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.4)),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => new Account(
                                    isProfileOwnerViewing: false,
                                    profileUserId: id,
                                  ),
                                  // instantiateChatInstance(userState.user, )),
                                ))));
                  },
                ));
          } else {
            return Center();
          }
        });
  }

  Widget renderFollowingList() {
    return BlocBuilder<FollowingBloc, FollowingState>(
        bloc: followingBloc,
        builder: (
          BuildContext context,
          FollowingState state,
        ) {
          if (state is FollowingLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FollowingEmpty) {
            return Center(
              child: Text(state.message,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
            );
          }

          if (state is FollowingLoaded) {
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
                child: ListView.builder(
                  itemCount: state.following.length,
                  itemBuilder: (context, index) {
                    final id = state.following[index].id;
                    final username = state.following[index].username;
                    final profilePic = state.following[index].profilePic;
                    final userPresence = state.following[index].presence;

                    return Card(
                        color: Theme.of(context).canvasColor,
                        child: ListTile(
                            leading: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    CachedNetworkImageProvider(profilePic)),
                            trailing: Icon(Icons.circle,
                                size: 15,
                                color:
                                    userPresence ? Colors.green : Colors.amber),
                            title: Text('$username',
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.4))),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => new Account(
                                    isProfileOwnerViewing: false,
                                    profileUserId: id,
                                  ),
                                  // instantiateChatInstance(userState.user, )),
                                ))));
                  },
                ));
          } else {
            return Center();
          }
        });
  }
}
