import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/screens/chat/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/screens/camera/camera.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/blocs/quick/quick_bloc.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/screens/timeline/timeline.dart';
import 'package:frienderr/screens/snap_feed/snap_feed.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/widgets/keep_alive/keep_alive.dart';
import 'package:frienderr/screens/find_friends/find_friends.dart';
import 'package:frienderr/screens/notifications/notifications.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainTab extends StatefulWidget {
  const MainTab({
    Key? key,
  }) : super(key: key);

  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MainTab>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late PageController _pageController;
  QuickBloc quickBloc = new QuickBloc();
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  List<BottomNavigationBarItem> buildItems(bool isDarkTheme) {
    return [
      BottomNavigationBarItem(
        label: '',
        activeIcon: SvgPicture.asset(
          Constants.dashboardIconFill,
          width: 22,
          height: 22,
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        icon: Opacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            Constants.dashboardIconOutline,
            width: 22,
            height: 22,
            color: Colors.white,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        activeIcon: SvgPicture.asset(
          Constants.quickIconFill,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        icon: Opacity(
            opacity: 0.4,
            child: SvgPicture.asset(
              Constants.quickIconOutline,
              width: 26,
              height: 26,
              color: Colors.white,
            )),
      ),
      /*   BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Opacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            Constants.commentIconOutline,
            width: 26,
            height: 26,
            color: Colors.white,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Constants.commentIconFill,
          width: 25,
          height: 25,
          color: Colors.white,
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Opacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            Constants.notificationIconOutline,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Constants.notificationIconFill,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),*/

      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Opacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            Constants.cameraIconOutline,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Constants.cameraIconFill,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Badge(
            badgeContent: Text('3'),
            child: Opacity(
                opacity: 0.4,
                child: SvgPicture.asset(
                  Constants.notificationIconOutline,
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ))),
        activeIcon: Badge(
            badgeContent: Text('3'),
            child: SvgPicture.asset(
              Constants.notificationIconFill,
              width: 24,
              height: 24,
              color: Colors.white,
            )),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Opacity(
            opacity: 0.4,
            child: SvgPicture.asset(
              Constants.profileIconOutline,
              width: 22,
              height: 22,
              color: Colors.white,
            )),
        activeIcon: SvgPicture.asset(
          Constants.profileIconFill,
          width: 22,
          height: 22,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.removeObserver(this);
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  List<Widget> buildScreens() {
    User? user = FirebaseAuth.instance.currentUser;
    return [
      Timeline(quickBloc: quickBloc),
      SnapFeed(quickBloc: quickBloc),
      //ChatDashboard(),

      CameraScreen(),
      Notifications(),
      Account(
        isProfileOwnerViewing: true,
        profileUserId: user?.uid as String,
      ),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      quickBloc
          .add(QuickEvent.playSnapAtIndex(index: quickBloc.state.focusedIndex));
    } else {
      if (quickBloc
          .state.controllers[quickBloc.state.focusedIndex].value.isPlaying) {
        quickBloc.state.controllers[quickBloc.state.focusedIndex].pause();
      }
    }
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        BlocProvider.of<ThemeBloc>(context).state.theme == Constants.darkTheme;

    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: buildScreens(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              color: Colors.grey[900]!,
              width: 1.0,
            )),
          ),
          child: BottomNavigationBar(
              iconSize: 23,
              elevation: 10,
              enableFeedback: false,
              backgroundColor:
                  isDarkTheme ? Colors.black.withOpacity(0.5) : Colors.white,
              type: BottomNavigationBarType.fixed,
              items: buildItems(isDarkTheme),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              onTap: _onItemTapped),
        ));
  }
}
