import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/screens/chat/chat.dart';
import 'package:frienderr/constants/constants.dart';

import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/screens/account/account.dart';
import 'package:frienderr/screens/timeline/timeline.dart';
import 'package:frienderr/screens/post_media/post_media.dart';
import 'package:frienderr/screens/find_friends/find_friends.dart';
import 'package:frienderr/screens/notifications/notifications.dart';





class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MainTab>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController controller;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    controller = new TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
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

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        BlocProvider.of<UserBloc>(context, listen: true).state.user;
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;

    return new Scaffold(
        bottomNavigationBar: new Material(
            color: theme == Constants.darkTheme
                ? Colors.black
                : HexColor('#E9E9E9'),
            child: new TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                labelColor: HexColor('#f3923c'),
                indicatorWeight: 3.0,
                indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
                unselectedLabelColor: Colors.grey,
                indicatorColor: HexColor('#f3923c'),
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: const Icon(Elusive.home, size: 21)),
                  new Tab(icon: new Icon(Elusive.comment_alt, size: 21)),
                  new Tab(icon: new Icon(Elusive.bell, size: 21)),
                  new Tab(icon: new Icon(Entypo.camera, size: 21)),
                  new Tab(icon: new Icon(Entypo.search, size: 21)),
                  new Tab(icon: new Icon(Icons.person, size: 21))
                ])),
        //  resizeToAvoidBottomInset: true,
        endDrawerEnableOpenDragGesture: selectedIndex == 0 ? true : false,
        endDrawer: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: new Drawer(child: Center(child: PostMedia()))),
        body: new TabBarView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Timeline(),
              ChatDashboard(),
              Notifications(),
              PostMedia(),
              FindFriends(),
              Account(
                isProfileOwnerViewing: true,
                profileUserId: user.id,
              ),
            ]));
  }
}
