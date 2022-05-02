import 'package:camera/camera.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/enums/enums.dart';

import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/screens/camera.dart';
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

  Future<Object?> _navigateToChatScreen() async {
    return await getIt<AppRouter>().push(ChatDashboardRoute());
  }

  Future<Object?> _navigateToCamera() async {
    return await getIt<AppRouter>().push(
        CameraRoute(mode: CameraSelectionMode.post, blocGroup: _blocGroup));
  }

  Future<dynamic> _openCamera() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CameraScreen(
            mode: CameraSelectionMode.post, blocGroup: _blocGroup);
      },
    );
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
        fallbackWidget: Center(),
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
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.85),
              expandedHeight: 55,
              flexibleSpace: _appBar()),
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Stories(
                  blocGroup: _blocGroup,
                ),
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
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
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
          onTap: () => _navigateToCamera(),
          child: SvgPicture.asset(
            Constants.cameraIconOutline,
            width: 24,
            height: 24,
            color: Colors.white,
          )),
      GestureDetector(
          onTap: () => _navigateToChatScreen(),
          child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Badge(
                  badgeContent: Text('3'),
                  child: SvgPicture.asset(
                    Constants.sharePostIconOutline1,
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  )))),
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
                margin: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).buttonColor),
                child: Center(
                    child: Icon(Icons.refresh,
                        color: Theme.of(context).canvasColor)))));
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
            padding: EdgeInsets.only(top: 0, bottom: 10), child: appLogo));
  }
}
