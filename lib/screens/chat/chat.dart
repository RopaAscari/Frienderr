import 'package:frienderr/blocs/following_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:frienderr/events/followers_event.dart';
import 'package:frienderr/events/following_event.dart';
import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/messaging/messaging.dart';
import 'package:frienderr/screens/messaging/messaging.dart';
import 'package:frienderr/state/followers_state.dart';
import 'package:frienderr/state/following_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:story_view/story_view.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/chat_bloc.dart';
import 'package:frienderr/state/chat_state.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/events/chat_event.dart';
import 'package:frienderr/blocs/friends_bloc.dart';
import 'package:frienderr/state/friends_state.dart';

import 'package:frienderr/events/friends_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDashboard extends StatefulWidget {
  ChatDashboard({Key? key}) : super(key: key);

  @override
  ChatDashboardState createState() => ChatDashboardState();
}

class ChatDashboardState extends State<ChatDashboard>
    with AutomaticKeepAliveClientMixin<ChatDashboard> {
  @override
  bool get wantKeepAlive => true;
  late UserState userState;

  late ChatBloc chatBloc = new ChatBloc();
  final storyController = StoryController();
  late FollowingBloc followingBloc = new FollowingBloc();
  final TextEditingController searchController = TextEditingController();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference chats =
      FirebaseFirestore.instance.collection('chats');

  @override
  void initState() {
    userState = context.read<UserBloc>().state;
    listenChats();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  listenChats() {
    Stream<DocumentSnapshot> streamChats =
        users.doc(userState.user.id).snapshots();

    streamChats.listen((event) {
      chatBloc.add(GetChats(id: userState.user.id));
    });
  }

  showActionSheet(FollowingState state) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: double.infinity,
          child: renderFriendsListWidget(state),
        );
      },
    );
  }

  createChatFromFriendsList(String id, FollowingState state) {
    followingBloc.add(GetFollowing(id: id));
    showActionSheet(state);
  }

  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;
    final isDarkTheme = theme == Constants.darkTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 9, right: 9, bottom: 5),
              child: BlocBuilder<FollowingBloc, FollowingState>(
                  bloc: followingBloc,
                  builder: (
                    BuildContext context,
                    FollowingState state,
                  ) {
                    return headerWidget(state, isDarkTheme);
                  })),
          Expanded(child: chatContainerWidget(isDarkTheme))
        ],
      ),
    ));
  }

  Widget headerWidget(FollowingState state, bool isDarkTheme) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Messages\n', style: TextStyle(fontSize: 17)),
          InkWell(
              onTap: () {
                createChatFromFriendsList(userState.user.id, state);
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
            color: isDarkTheme ? HexColor('#1B1921') : HexColor('#F5F5F5'),
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
    if (state is ChatsLoaded) {
      return Center();
    } else if (state is ChatError) {
      return Center(child: Text(state.error));
    } else if (state is ChatsEmpty) {
      return Center(child: Text('You have no messages'));
    } else {
      return Center();
    }
  }

  Widget determineFriendRender(FollowingState state) {
    if (state is FollowingLoading) {
      return CircularProgressIndicator();
    } else if (state is FollowingLoaded) {
      return renderFriendsWidget(state.following);
    } else if (state is FollowingEmpty) {
      return renderEmptyFriendsList();
    } else if (state is FollowingError) {
      return Center(child: Text(state.error));
    } else {
      return Center();
    }
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
    return Text(
      TimeElapsed().elapsedTimeDynamic(
          new DateTime.fromMicrosecondsSinceEpoch(timeElapsed).toString()),
      style: TextStyle(fontSize: 12),
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
                title: Text(
                  '$username',
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Messaging(
                            metaData: new MessagingMetaData(
                                chatId: '${userState.user.id}-$id',
                                chatRecipient: new ChatParticipant(
                                    id: id,
                                    username: username,
                                    profilePic: profilePic),
                                chatUser: new ChatParticipant(
                                    id: userState.user.id,
                                    username: userState.user.username,
                                    profilePic: userState.user.profilePic)))
                        // instantiateChatInstance(userState.user, )),
                        ))));
      },
    );
  }

  Widget renderChatWidget(bool isDarkTheme) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(userState.user.id)
            .collection('user_chats')
            // .doc(metaData.chatRecipient.id)
            //.collection('messages')
            //.orderBy("createdAt")
            .snapshots(),
        builder: (context, snapshot) {
          List<DocumentSnapshot> items = snapshot.data?.docs ?? [];

          if (items.length == 0) {
            return Center(child: Text('You have no messages'));
          }

          return ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 25),
            itemBuilder: (context, index) {
              final chatID = items[index]['id'];
              final unread = items[index]['latestMessage']['count'];
              final timeElapsed = items[index]['latestMessage']['date'];
              final displayName = items[index]['participants'].firstWhere(
                  (participant) =>
                      participant['id'] != userState.user.id)['username'];
              final displayPhoto = items[index]['participants'].firstWhere(
                  (participant) =>
                      participant['id'] != userState.user.id)['profilePic'];
              final displayMessage =
                  items[index]['latestMessage']['message']['text'];

              final chatUser = items[index]['participants'].firstWhere(
                  (participant) => participant['id'] == userState.user.id);
              final chatRecipient = items[index]['participants'].firstWhere(
                  (participant) => participant['id'] != userState.user.id);

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
                            ? HexColor('#1B1921')
                            : HexColor('#F5F5F5'), //HexColor('#121213'),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: ListTile(
                              leading: CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      CachedNetworkImageProvider(displayPhoto)),
                              subtitle: Text('$displayMessage',
                                  style: TextStyle(fontSize: 12)),
                              title: Text('$displayName',
                                  style: TextStyle(fontSize: 17)),
                              trailing: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: Column(children: [
                                    timeElaspedWidget(timeElapsed),
                                    unReadCounterWidget(unread)
                                  ])),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Messaging(metaData: chatMetadata)
                                      // instantiateChatInstance(userState.user, )),
                                      ))),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              // onTap: () => _showSnackBar('Delete'),
                            ),
                          ],
                        )),
                  ]));
            },
          );
        });
  }
}
