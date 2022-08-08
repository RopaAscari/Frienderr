import 'dart:ui' as ui;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';

class TabNavigationScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const TabNavigationScreen({Key? key, required this.blocGroup})
      : super(key: key);

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => widget.blocGroup.userBloc.state.user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.removeObserver(this);

    _blocGroup.notificationBloc.notificationStream.listen((event) {
      _blocGroup.notificationBloc
          .add(NotificationEvent.getNotifications(uid: _user.id));
    });

    _blocGroup.chatBloc.chatStream?.listen((event) {
      _blocGroup.chatBloc.add(ChatEvent.getChats(id: _user.id));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  void _handleSnapChange(int index) {
    if (index == 1) {
      _blocGroup.snapBloc.add(SnapEvent.playSnapAtIndex(
          index: _blocGroup.snapBloc.state.focusedIndex));
    } else {
      if (_blocGroup.snapBloc.state.controllers.isNotEmpty) {
        if (_blocGroup
            .snapBloc
            .state
            .controllers[_blocGroup.snapBloc.state.focusedIndex]
            .value
            .isPlaying) {
          _blocGroup.snapBloc.state
              .controllers[_blocGroup.snapBloc.state.focusedIndex]
              .pause();
        }
      }
    }
  }

  List<BottomNavigationBarItem> _bottomNavigationItems() {
    return [
      BottomNavigationBarItem(
        label: '',
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SvgPicture.asset(Assets.icons.homeIconOutlineSvg,
                height: 20, width: 20, color: Colors.grey[700])),
        activeIcon: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: SvgPicture.asset(Assets.icons.homeIconOutlineSvg,
                  height: 20, width: 20, color: Colors.white),
            ),
            const Icon(Icons.circle, size: 4, color: Colors.red)
          ],
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SvgPicture.asset(Assets.icons.snapIconOutlineSvg,
                height: 23, width: 23, color: Colors.grey[700])),
        activeIcon: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(Assets.icons.snapIconOutlineSvg,
                    height: 23, width: 23, color: Colors.white)),
            const Icon(Icons.circle, size: 4, color: Colors.red)
          ],
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SvgPicture.asset(Assets.icons.cameraIconOutlineSvg,
                height: 22, width: 22, color: Colors.grey[700])),
        activeIcon: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(Assets.icons.cameraIconOutlineSvg,
                    height: 22, width: 22, color: Colors.white)),
            const Icon(Icons.circle, size: 4, color: Colors.red)
          ],
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Badge(
                badgeContent: const Text('1'),
                child: SvgPicture.asset(Assets.icons.notificationIconOutline,
                    height: 20, width: 20, color: Colors.grey[700]))),
        activeIcon: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Badge(
                    badgeContent: const Text('1'),
                    child: SvgPicture.asset(
                        Assets.icons.notificationIconOutline,
                        height: 20,
                        width: 20,
                        color: Colors.white))),
            const Icon(Icons.circle, size: 4, color: Colors.red)
          ],
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Badge(
                badgeContent: const Text('1'),
                child: SvgPicture.asset(Assets.icons.messageIconOutlineSvg,
                    height: 20, width: 20, color: Colors.grey[700]))),
        activeIcon: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Badge(
                    badgeContent: const Text('1'),
                    child: SvgPicture.asset(Assets.icons.messageIconOutlineSvg,
                        height: 20, width: 20, color: Colors.white))),
            const Icon(Icons.circle, size: 4, color: Colors.red)
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsRouter(
        routes: [
          TimelineRoute(blocGroup: _blocGroup),
          SnapFeedRoute(blocGroup: _blocGroup),
          CameraRoute(blocGroup: _blocGroup, mode: CameraSelectionMode.post),
          NotificationRoute(
            blocGroup: _blocGroup,
          ),
          ChatDashboardRoute(blocGroup: _blocGroup),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 11,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey[800],
              unselectedLabelStyle: TextStyle(color: Colors.grey[700]),
              onTap: (index) {
                _handleSnapChange(index);
                if (index == 2) {
                  Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
                    child: CameraScreen(
                        mode: CameraSelectionMode.post, blocGroup: _blocGroup),
                  ));
                  return;
                }
                tabsRouter.setActiveIndex(index);
              },
              items: _bottomNavigationItems(),
            ),
          );
        },
      ),
    );
  }
}
