import 'package:flutter/cupertino.dart';

import 'package:frienderr/core/constants/constants.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/data/models/chat/chat_participant.dart';
import 'package:frienderr/features/data/models/chat/messaging.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/following/following_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/messaging.dart';
import 'package:story_view/story_view.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatDashboardScreen extends StatefulWidget {
  ChatDashboardScreen({Key? key}) : super(key: key);

  @override
  _ChatDashboardScreenState createState() => _ChatDashboardScreenState();
}

class _ChatDashboardScreenState extends State<ChatDashboardScreen>
    with AutomaticKeepAliveClientMixin<ChatDashboardScreen> {
  @override
  bool get wantKeepAlive => true;
  late UserState userState;
  User? appUser = FirebaseAuth.instance.currentUser;
  ChatBloc get chatBloc => getIt<ChatBloc>();
  final storyController = StoryController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final PanelController panelController = new PanelController();
  FollowingBloc get followingBloc => getIt<FollowingBloc>();
  final TextEditingController searchController = TextEditingController();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference chats =
      FirebaseFirestore.instance.collection('chats');

  @override
  void initState() {
    listenChats();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  listenChats() {
    Stream<DocumentSnapshot> streamChats = users.doc(appUser?.uid).snapshots();

    streamChats.listen((event) {
      // chatBloc.add(GetChats(id: userState.user.id));
    });
  }

  createChatFromFriendsList(String id, FollowingState state) {
    //followingBloc.add(GetFollowing(id: id));
    panelController.open();
  }

  Widget build(BuildContext context) {
    userState = BlocProvider.of<UserBloc>(context).state;
    super.build(context);
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;
    final isDarkTheme = theme == Constants.darkTheme;
    return SafeArea(
        child: Scaffold(
            body: BlocBuilder<FollowingBloc, FollowingState>(
                bloc: followingBloc,
                builder: (
                  BuildContext context,
                  FollowingState state,
                ) {
                  return Stack(children: [
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 9, right: 9, bottom: 5),
                            child: headerWidget(state, isDarkTheme)),
                        Expanded(child: chatContainerWidget(isDarkTheme))
                      ],
                    ),
                    SlidingUpPanel(
                      controller: panelController,
                      isDraggable: true,
                      minHeight: 0,
                      color: Colors.transparent,
                      maxHeight: MediaQuery.of(context).size.height,
                      backdropEnabled: true,
                      panel: renderFriendsListWidget(state),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0)),
                    ),
                  ]);
                })));
  }

  Widget headerWidget(FollowingState state, bool isDarkTheme) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Messages\n', style: TextStyle(fontSize: 17)),
          InkWell(
              onTap: () {
                createChatFromFriendsList(appUser!.uid, state);
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Colors.white : HexColor('#13111A'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.add,
                      color: isDarkTheme ? Colors.black : Colors.white)))
        ],
      ),
      searchChatWidget(isDarkTheme),
    ]);
  }

  Widget chatContainerWidget(bool isDarkTheme) {
    return Container(
        margin: const EdgeInsets.only(top: 30.0),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
            color: isDarkTheme ? Colors.black : HexColor('#F5F5F5'),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0))),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [renderChatWidget(isDarkTheme)],
        ));
  }

  Widget renderChatActionWidget(ChatState state) {
    final bool shouldBeDisabled = true;
    return SizedBox(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
            child: Opacity(
                opacity: shouldBeDisabled ? 0.5 : 1,
                child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: HexColor('#EE6115'),
                    child:
                        Icon(Icons.attractions, size: 30, color: Colors.white),
                    onPressed: () =>
                        shouldBeDisabled ? null : () => print('')))));
  }

  Widget determineChatRender(ChatState state) {
    /*  if (state is ChatsLoaded) {
      return Center();
    } else if (state is ChatError) {
      return Center(child: Text(state.error));
    } else if (state is ChatsEmpty) {
      return Center(child: Text('You have no messages'));
    } else {
      return Center();
    }*/
    return Center();
  }

  Widget determineFriendRender(FollowingState state) {
    /*  if (state is FollowingLoading) {
      return CircularProgressIndicator();
    } else if (state is FollowingLoaded) {
      return renderFriendsWidget(state.following);
    } else if (state is FollowingEmpty) {
      return renderEmptyFriendsList();
    } else if (state is FollowingError) {
      return Center(child: Text(state.error));
    } else {
      return Center();
    }*/
    return Center();
  }

  Widget renderEmptyFriendsList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Image.asset('assets/images/friends.png',
                height: 70, width: 70)),
        Text('\You have no friends', style: TextStyle(fontSize: 14)),
        //your widgets here...
      ],
    );
  }

  Widget unReadCounterWidget(int unReadCount) {
    if (unReadCount > 0) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(20)),
          height: 20,
          width: 20,
          child: Center(
              child: Text('$unReadCount',
                  style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold))));
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  Widget timeElaspedWidget(int timeElapsed) {
    return Text(''
        //    TimeElapsed().elapsedTimeDynamic(
        //        new DateTime.fromMicrosecondsSinceEpoch(timeElapsed).toString()),
        //    style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.25)),
        );
  }

  Widget searchChatWidget(bool isDarkTheme) {
    return TextField(
        obscureText: false,
        controller: searchController,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: new OutlineInputBorder(
              // borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            suffixIcon: IconButton(
                color: isDarkTheme ? Colors.white : HexColor('#13111A'),
                onPressed: () {},
                icon: const Icon(Icons.search)),
            // fillColor: HexColor('#C4C4C4').withOpacity(0.5),
            filled: true,
            labelText: 'Search',
            contentPadding: const EdgeInsets.only(top: 30.0, left: 20.0)));
  }

  Widget renderFriendsListWidget(FollowingState state) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          color: HexColor('#1B1921'),
        ),
        child: Column(children: [
          Text('\nFriends\n', style: TextStyle(fontSize: 20)),
          new Expanded(
              child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[determineFriendRender(state)]))
        ]));
  }

  Widget renderFriendsWidget(friends) {
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final id = friends[index].id;
        final username = friends[index].username;
        final profilePic = friends[index].profilePic;
        final userPresence = friends[index].presence;

        return Card(
            color: HexColor('#121213'),
            child: ListTile(
                leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: CachedNetworkImageProvider(profilePic)),
                trailing: Icon(Icons.circle,
                    size: 15,
                    color: userPresence ? Colors.green : Colors.amber),
                title: Text('$username',
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10))),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Messaging(
                            metaData: new MessagingMetaData(
                                chatId: '${appUser!.uid}-$id',
                                chatRecipient: new ChatParticipant(
                                    id: id,
                                    username: username,
                                    profilePic: profilePic),
                                chatUser: new ChatParticipant(
                                    id: appUser!.uid,
                                    username: userState.user.username,
                                    profilePic:
                                        userState.user.profilePic ?? '')))
                        // instantiateChatInstance(userState.user, )),
                        ))));
      },
    );
  }

  Widget renderChatWidget(bool isDarkTheme) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(appUser!.uid)
            .collection('user_chats')
            .snapshots(),
        builder: (context, snapshot) {
          List<DocumentSnapshot> items = snapshot.data?.docs ?? [];

          return SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: ClassicHeader(
                idleText: '',
                releaseText: '',
                completeText: '',
                refreshingText: '',
                idleIcon: CupertinoActivityIndicator(radius: 10),
                completeIcon: CupertinoActivityIndicator(radius: 10),
                releaseIcon: CupertinoActivityIndicator(radius: 10),
              ),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  return Center();
                },
              ),
              controller: _refreshController,
              onRefresh: () => _onRefresh(),
              onLoading: () => _onLoading(),
              child: items.length == 0
                  ? Center(
                      child: Text('You have no messages',
                          style: TextStyle(
                              fontSize: AdaptiveTextSize()
                                  .getAdaptiveTextSize(context, 10))))
                  : ListView.builder(
                      itemCount: items.length,
                      padding: EdgeInsets.only(top: 25),
                      itemBuilder: (context, index) {
                        final chatID = items[index]['id'];
                        final unread = items[index]['latestMessage']['count'];
                        final timeElapsed =
                            items[index]['latestMessage']['date'];
                        final displayName = items[index]['participants']
                            .firstWhere((participant) =>
                                participant['id'] !=
                                userState.user.id)['username'];
                        final displayPhoto = items[index]['participants']
                            .firstWhere((participant) =>
                                participant['id'] !=
                                userState.user.id)['profilePic'];
                        final displayMessage =
                            items[index]['latestMessage']['message']['text'];

                        final chatUser = items[index]['participants']
                            .firstWhere((participant) =>
                                participant['id'] == userState.user.id);
                        final chatRecipient = items[index]['participants']
                            .firstWhere((participant) =>
                                participant['id'] != userState.user.id);

                        final chatMetadata = new MessagingMetaData(
                            chatUser: new ChatParticipant(
                                id: chatUser['id'],
                                username: chatUser['username'],
                                profilePic: chatUser['profilePic']),
                            chatRecipient: new ChatParticipant(
                                id: chatRecipient['id'],
                                username: chatRecipient['username'],
                                profilePic: chatRecipient['profilePic']),
                            chatId: chatID);

                        return Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(children: [
                              Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: isDarkTheme
                                      ? Colors.black
                                      : HexColor(
                                          '#F5F5F5'), //HexColor('#121213'),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          spacing: 0,
                                          flex: 1,
                                          onPressed: (context) => null,
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                        leading: CircleAvatar(
                                            radius: 20,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    displayPhoto)),
                                        subtitle: Text('$displayMessage',
                                            style: TextStyle(
                                                fontSize: AdaptiveTextSize()
                                                    .getAdaptiveTextSize(
                                                        context, 10))),
                                        title: Text('$displayName',
                                            style: TextStyle(
                                                fontSize: AdaptiveTextSize()
                                                    .getAdaptiveTextSize(
                                                        context, 10))),
                                        trailing: Container(
                                            margin:
                                                const EdgeInsets.only(top: 15),
                                            child: Column(children: [timeElaspedWidget(timeElapsed), unReadCounterWidget(unread)])),
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Messaging(metaData: chatMetadata)))),
                                  )),
                            ]));
                      },
                    ));
        });
  }
}
