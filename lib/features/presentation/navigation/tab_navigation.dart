import 'package:badges/badges.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/screens/chat/chat.dart';
import 'package:frienderr/features/presentation/screens/discover/find_friends.dart';
import 'package:frienderr/features/presentation/screens/notifications/notifications.dart';
import 'package:frienderr/features/presentation/screens/snapfeed/snap_feed.dart';
import 'package:frienderr/features/presentation/screens/timeline/timeline.dart';
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

class MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  late PageController _pageController;
  BlocGroup get _blocGroup => widget.blocGroup;
  User? user = FirebaseAuth.instance.currentUser;

  final List<TabIcon?> tabIcons = [
    TabIcon(icon: Constants.homeIconOutline, size: const Size(30, 30)),
    TabIcon(icon: Constants.snapIconOutline, size: const Size(27, 27)),
    null,
    TabIcon(icon: Constants.messageIconOutline, size: const Size(27, 27)),
    TabIcon(icon: Constants.profileIconOutline, size: const Size(27, 27)),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.removeObserver(this);

    _blocGroup.notificationBloc.notificationStream.listen((event) {
      _blocGroup.notificationBloc
          .add(NotificationEvent.getNotifications(uid: user!.uid));
    });

    _blocGroup.chatBloc.chatStream?.listen((event) {
      print('snapshot');
      _blocGroup.chatBloc.add(ChatEvent.getChats(id: user!.uid));
    });

    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

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
    });
    _pageController.jumpToPage(index);
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

  List<Widget> _buildTabIcons() {
    return tabIcons.mapIndexed((index, tabIcon) {
      if (tabIcon == null) {
        return const Expanded(child: Center());
      }

      return Expanded(
          child: GestureDetector(
              child: Padding(
                  child: SvgPicture.asset(
                    tabIcon.icon,
                    width: tabIcon.size.width,
                    height: tabIcon.size.height,
                    color: _determineIconRender(index),
                  ),
                  padding: const EdgeInsets.only(top: 0)),
              onTap: () {
                _onItemTapped(index);
              }));
    }).toList();
  }

  Color _determineIconRender(int idx) {
    return _selectedIndex == idx ? Colors.white : Colors.grey[700]!;
  }

  List<Widget> _buildScreens() {
    User? user = FirebaseAuth.instance.currentUser;
    return [
      Timeline(blocGroup: _blocGroup),
      SnapFeed(blocGroup: _blocGroup),
      const Center(),
      ChatDashboardScreen(blocGroup: _blocGroup),
      UserAccountScreen(
        blocGroup: _blocGroup,
        isProfileOwnerViewing: true,
        profileUserId: user?.uid as String,
      ),
    ];
  }

  Widget _buildNotchButton() {
    return Padding(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0.0, 1.0],
            end: const Alignment(1.0, 0.0),
            begin: const Alignment(-0.95, 0.0),
            colors: [HexColor('#FA5B8E'), HexColor('#FCA28E')],
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: MaterialButton(
          height: 65,
          minWidth: 65,
          onPressed: () {
            _openCamera();
          },
          child: SvgPicture.asset(
            Constants.cameraIconFill,
            width: 25,
            height: 25,
            color: Colors.white,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      padding: const EdgeInsets.only(top: 25),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
        elevation: 10,
        notchMargin: 10,
        color: Colors.black,
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
              border:
                  Border(top: BorderSide(color: Colors.grey[500]!, width: 0.7)),
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildTabIcons()),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (page) {
          if (page == 3) {}
        },
        children: _buildScreens(),
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: _buildNotchButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class TabIcon {
  Size size;
  String icon;
  TabIcon({
    required this.size,
    required this.icon,
  });
}
