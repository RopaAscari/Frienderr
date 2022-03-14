import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/widgets/blur/blur.dart';
import 'package:provider/provider.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/screens/chat/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/screens/camera/camera.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:frienderr/screens/timeline/timeline.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/widgets/keep_alive/keep_alive.dart';
import 'package:frienderr/screens/find_friends/find_friends.dart';
import 'package:frienderr/screens/notifications/notifications.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
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
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  List<BottomNavigationBarItem> buildItems(bool isDarkTheme) {
    return [
      BottomNavigationBarItem(
        label: '',
        activeIcon:
            Icon(MdiIcons.homeExportOutline, color: Colors.blue, size: 24),
        backgroundColor: Colors.white,
        icon: const Opacity(
            opacity: 0.4, child: Icon(MdiIcons.homeExportOutline, size: 24)),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: const Opacity(
            opacity: 0.4, child: Icon(CupertinoIcons.chat_bubble)),
        activeIcon: Icon(CupertinoIcons.chat_bubble, color: Colors.red),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: const Opacity(
            opacity: 0.4, child: Icon(CupertinoIcons.bell, size: 25)),
        activeIcon: Icon(CupertinoIcons.bell, color: Colors.orange, size: 25),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: const Opacity(opacity: 0.4, child: Icon(CupertinoIcons.camera)),
        activeIcon: Icon(CupertinoIcons.camera, color: Colors.purple),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: const Opacity(opacity: 0.4, child: Icon(CupertinoIcons.search)),
        activeIcon: Icon(CupertinoIcons.search, color: Colors.green),
      ),
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: const Opacity(opacity: 0.4, child: Icon(CupertinoIcons.person)),
        activeIcon: Icon(CupertinoIcons.person,
            color: isDarkTheme ? Colors.white : Colors.black),
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final String userId =
        BlocProvider.of<UserBloc>(context, listen: false).state.user.id;
    switch (state) {
      case AppLifecycleState.resumed:
        final bool isOnline = true;
        FirebaseServices().manageUserPresence(userId, isOnline);
        break;
      case AppLifecycleState.inactive:
        final bool isOnline = false;
        FirebaseServices().manageUserPresence(userId, isOnline);
        break;
      case AppLifecycleState.paused:
        final bool isOnline = false;
        FirebaseServices().manageUserPresence(userId, isOnline);
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  List<Widget> buildScreens() {
    User? user = FirebaseAuth.instance.currentUser;
    return [
      Timeline(),
      ChatDashboard(),
      Notifications(),
      CameraScreen(),
      FindFriends(),
      Account(
        isProfileOwnerViewing: true,
        profileUserId: user?.uid as String,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
  //  final UserModel user =
   //     BlocProvider.of<UserBloc>(context, listen: true).state.user;
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
            boxShadow: [
              BoxShadow(
                  color: Colors.black!, spreadRadius: 0.1, blurRadius: 0.1),
            ],
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
