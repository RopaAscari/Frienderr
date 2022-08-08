import 'dart:ui' as ui;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/services/route_builder.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/screens/timeline/stories.dart';
import 'package:frienderr/features/presentation/screens/timeline/refresher.dart';
import 'package:frienderr/features/presentation/screens/discover/find_friends.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/presentation/screens/timeline/timeline_posts.dart';
import 'package:frienderr/features/presentation/screens/timeline/mini_post_section.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/screens/timeline/create_post_button.dart';

class TimelineScreen extends StatefulWidget {
  final BlocGroup blocGroup;

  const TimelineScreen({Key? key, required this.blocGroup}) : super(key: key);

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen>
    with AutomaticKeepAliveClientMixin<TimelineScreen> {
  bool showRefresher = false;
  late ScrollController _scrollController;
  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => widget.blocGroup.userBloc.state.user;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {}
  }

  Future<dynamic> _openDiscover() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            decoration: const BoxDecoration(color: Colors.black),
            padding: EdgeInsets.only(
              top: ui.window.viewPadding.top / ui.window.devicePixelRatio,
            ),
            height: MediaQuery.of(context).size.height,
            child: SafeArea(child: FindFriends(blocGroup: _blocGroup)));
      },
    );
  }

  Future<void> _onRefresh() {
    return Future.sync(
      () async {
        _blocGroup.storyBloc.add(StoryEvent.fetchStories(userId: _user.id));
        _blocGroup.postBloc
            .add(const PostEvent.fetchTimelinePosts(shouldLoad: false));
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        _timelineBody(),
        Refresher(
            postBloc: _blocGroup.postBloc, scrollController: _scrollController)
      ]),
      floatingActionButton: CreatePostButton(
        postBloc: _blocGroup.postBloc,
        scrollController: _scrollController,
      ),
    ));
  }

  Widget _timelineBody() {
    return SmartRefresher(
        enablePullUp: false,
        enablePullDown: true,
        onRefresh: _onRefresh,
        controller: _refreshController,
        header:
            CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {
          if (mode == RefreshStatus.refreshing) {
            return const Center(child: LoadingIndicator(size: Size(40, 40)));
          }

          return const Center();
        }),
        child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverAppBar(
                  floating: true,
                  leading: const Center(),
                  title: null,
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
                  expandedHeight: 55,
                  flexibleSpace: _appBar()),
              SliverList(
                  delegate: SliverChildListDelegate([
                _buildStoryHeading(),
                Stories(
                  blocGroup: _blocGroup,
                ),
                _buildTimelineHeading(),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: MiniPostSection(
                    user: _user,
                    postBloc: _blocGroup.postBloc,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: TimelinePosts(
                    blocGroup: _blocGroup,
                    scrollController: _scrollController,
                  ),
                )
              ]))
            ]));
  }

  Widget _appBar() {
    return FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: 55,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _appLogoVector(),
                        _appBarIcons(),
                      ],
                    )),
              )
            ]));
  }

  Widget _buildStoryHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 8, bottom: 15),
      child: Text('\nStories',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
          )),
    );
  }

  Widget _buildTimelineHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 8),
      child: Text('\nFeed',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
          )),
    );
  }

  Widget _appBarIcons() {
    return Row(children: [
      GestureDetector(
          child: SvgPicture.asset(
            Constants.searchIconOutline,
            width: 23,
            height: 23,
            color: Colors.grey[500],
          ),
          onTap: () {
            _openDiscover();
          }),
      GestureDetector(
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
                radius: 13.5,
                backgroundImage: CachedNetworkImageProvider(
                    _blocGroup.userBloc.state.user.profilePic!))),
        onTap: () {
          Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
              child: UserAccountScreen(
            blocGroup: _blocGroup,
            isProfileOwnerViewing: true,
            profileUserId: _blocGroup.userBloc.state.user.id,
          )));
        },
      ),
    ]);
  }

  Widget _refresherWidget() {
    return GestureDetector(
        onTap: () => _scrollController.animateTo(0.0,
            curve: Curves.easeOut, duration: const Duration(milliseconds: 800)),
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 30,
                width: 70,
                margin: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).buttonColor),
                child: Center(
                    child: Icon(Icons.refresh,
                        color: Theme.of(context).canvasColor)))));
  }

  Widget _buildSearchExplorer() {
    return Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 25),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Explore',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .50,
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(Icons.search),
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                fillColor: HexColor('#9C9C9C').withOpacity(0.1),
                contentPadding: const EdgeInsets.only(top: 40.0),
                errorStyle: const TextStyle(
                    height: 0.7, color: Colors.red, fontSize: 14),
              )))
        ]));
  }

  Widget _appLogoVector() {
    final Widget appLogo = Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset(Constants.appLogo, width: 140, height: 140)));
    return Hero(
        flightShuttleBuilder: (_, animation, __, ___, ____) {
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          });
          return appLogo;
        },
        tag: 'none',
        child: Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 10),
            child: appLogo));
  }
}
