import 'package:camera/camera.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/enums/enums.dart';

import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/screens/notifications/notifications.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/stories.dart';
import 'package:frienderr/features/presentation/widgets/timeline.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class Timeline extends StatefulWidget {
  final BlocGroup blocGroup;

  Timeline({Key? key, required this.blocGroup}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with AutomaticKeepAliveClientMixin<Timeline> {
  bool showRefresher = false;
  late ScrollController _scrollController;
  BlocGroup get _blocGroup => widget.blocGroup;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<Object?> _navigateToNotificationsScreen() async {
    return await getIt<AppRouter>()
        .push(NotificationRoute(blocGroup: _blocGroup));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      _appBody(),
      ConditionalRenderDelegate(
        condition: showRefresher,
        fallbackWidget: const Center(),
        renderWidget: _refresherWidget(),
      )
    ])));
  }

  Widget _appBody() {
    return CustomScrollView(
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
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Stories(
                  blocGroup: _blocGroup,
                ),
                // _buildSearchExplorer(),
                TimelinePosts(
                  postBloc: _blocGroup.postBloc,
                  scrollController: _scrollController,
                )
              ])))
        ]);
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

  Widget _appBarIcons() {
    return Row(children: [
      GestureDetector(
          child: SvgPicture.asset(
        Constants.searchIconOutline,
        width: 27,
        height: 27,
        color: Colors.white,
      )),
      GestureDetector(
        child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Badge(
                badgeContent: const Text('3'),
                child: SvgPicture.asset(
                  Constants.notificationIconOutline,
                  width: 31,
                  height: 31,
                  color: Colors.white,
                ))),
        onTap: () => _navigateToNotificationsScreen(),
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
