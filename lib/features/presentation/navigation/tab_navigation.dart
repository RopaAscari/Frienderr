import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/screens/account/account.dart';
import 'package:frienderr/features/presentation/screens/timeline/timeline.dart';
import 'package:frienderr/features/presentation/screens/snapfeed/snap_feed.dart';
import 'package:frienderr/features/presentation/screens/discover/find_friends.dart';
import 'package:frienderr/features/presentation/screens/notifications/notifications.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class MainScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const MainScreen({
    Key? key,
    required this.blocGroup,
  }) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;
  BlocGroup get _blocGroup => widget.blocGroup;
  User? user = FirebaseAuth.instance.currentUser;

  final List<TabIcon> tabIcons = [
    TabIcon(icon: Constants.dashboardIconOutline, size: 23),
    TabIcon(icon: Constants.quickIconOutline, size: 25),
    TabIcon(icon: Constants.discoverOutlineIcon, size: 25),
    TabIcon(icon: Constants.notificationIconOutline, size: 26),
    TabIcon(icon: Constants.profileIconOutline, size: 24),
  ];

  @override
  void initState() {
    super.initState();

    _blocGroup.notificationBloc.notificationStream.listen((event) {
      _blocGroup.notificationBloc
          .add(NotificationEvent.getNotifications(uid: user!.uid));
    });

    WidgetsBinding.instance!.removeObserver(this);
    _tabController =
        TabController(initialIndex: _selectedIndex, length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  Widget _bottomNavigationBar() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),
          border: Border(
              top: BorderSide(
                  color: Colors.grey[800]!.withOpacity(0.8), width: 0.7)),
        ),
        child: TabBar(
            enableFeedback: true,
            onTap: (idx) {
              _onItemTapped(idx);
            },
            controller: _tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white, width: 2),
              ),
            ),
            tabs: tabIcons
                .mapIndexed((index, element) => _buildTabs(element, index))
                .toList()));
  }

  Widget _buildTabs(TabIcon tab, int idx) {
    return ConditionalRenderDelegate(
        condition: idx == 3,
        renderWidget: Tab(
          icon: SvgPicture.asset(
            tab.icon,
            width: tab.size,
            height: tab.size,
            color: _determineIconRender(idx),
          ),
        ),
        fallbackWidget: Tab(
          icon: SvgPicture.asset(
            tab.icon,
            width: tab.size,
            height: tab.size,
            color: _determineIconRender(idx),
          ),
        ));
  }

  Color _determineIconRender(int idx) {
    return _selectedIndex == idx ? Colors.white : Colors.grey[600]!;
  }

  List<Widget> _buildScreens() {
    User? user = FirebaseAuth.instance.currentUser;
    return [
      Timeline(blocGroup: _blocGroup),
      SnapFeed(blocGroup: _blocGroup),
      FindFriends(),
      Notifications(blocGroup: _blocGroup),
      Account(
        blocGroup: _blocGroup,
        isProfileOwnerViewing: true,
        profileUserId: user?.uid as String,
      ),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      _blocGroup.quickBloc.add(QuickEvent.playSnapAtIndex(
          index: _blocGroup.quickBloc.state.focusedIndex));
    } else {
      if (_blocGroup.quickBloc.state.controllers.isNotEmpty) {
        if (_blocGroup
            .quickBloc
            .state
            .controllers[_blocGroup.quickBloc.state.focusedIndex]
            .value
            .isPlaying) {
          _blocGroup.quickBloc.state
              .controllers[_blocGroup.quickBloc.state.focusedIndex]
              .pause();
        }
      }
    }
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: _buildScreens(),
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

class TabIcon {
  double size;
  String icon;
  TabIcon({
    required this.size,
    required this.icon,
  });
}
