import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/screens/account.dart';
import 'package:frienderr/features/presentation/screens/timeline.dart';
import 'package:frienderr/features/presentation/screens/snap_feed.dart';
import 'package:frienderr/features/presentation/screens/find_friends.dart';
import 'package:frienderr/features/presentation/screens/notifications.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';

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
  BlocGroup get _blocGroup => widget.blocGroup;
  late PageController _pageController;
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

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

  List<BottomNavigationBarItem> _buildItems(bool isDarkTheme) {
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
      BottomNavigationBarItem(
        label: '',
        backgroundColor: Colors.white,
        icon: Opacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            Constants.discoverOutlineIcon,
            width: 28,
            height: 28,
            color: Colors.white,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Constants.discoverFillIcon,
          width: 28,
          height: 28,
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

  List<Widget> _buildScreens() {
    User? user = FirebaseAuth.instance.currentUser;
    return [
      Timeline(blocGroup: _blocGroup),
      SnapFeed(quickBloc: _blocGroup.quickBloc),
      FindFriends(),
      Notifications(),
      Account(
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
          children: _buildScreens(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              width: 1.0,
              color: Colors.grey[900]!,
            )),
          ),
          child: BottomNavigationBar(
            iconSize: 23,
            elevation: 10,
            onTap: _onItemTapped,
            enableFeedback: false,
            currentIndex: _selectedIndex,
            items: _buildItems(isDarkTheme),
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ));
  }
}
