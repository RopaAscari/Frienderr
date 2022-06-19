import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:story_view/story_view.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:dash_chat_2/dash_chat_2.dart' as chat;
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/screens/messaging/messaging.dart';
import 'package:frienderr/features/presentation/blocs/following/following_bloc.dart';

class ChatDashboardScreen extends StatefulWidget {
  const ChatDashboardScreen({Key? key, required this.blocGroup})
      : super(key: key);

  final BlocGroup blocGroup;

  @override
  _ChatDashboardScreenState createState() => _ChatDashboardScreenState();
}

class _ChatDashboardScreenState extends State<ChatDashboardScreen>
    with AutomaticKeepAliveClientMixin<ChatDashboardScreen> {
  late UserState userState;
  final storyController = StoryController();
  BlocGroup get _blocGroup => widget.blocGroup;
  User? _appUser = FirebaseAuth.instance.currentUser;
  FollowingBloc get followingBloc => getIt<FollowingBloc>();
  final TextEditingController searchController = TextEditingController();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _createChatFromFriendsList(String id, FollowingState state) {}

  @override
  Widget build(BuildContext context) {
    userState = context.read<UserBloc>().state;
    super.build(context);
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ChatBloc, ChatState>(
                bloc: _blocGroup.chatBloc,
                listener: (
                  BuildContext context,
                  ChatState state,
                ) {},
                builder: (
                  BuildContext context,
                  ChatState state,
                ) {
                  return Stack(children: [
                    Column(
                      children: [
                        _headerWidget(state),
                        _chatContainerWidget(state)
                      ],
                    ),
                    _buildSlidingPanel()
                  ]);
                })));
  }

  Widget _determineChatRender(ChatState state) {
    switch (state.currentState) {
      case ChatStatus.loading:
        return const Center(child: LoadingIndicator(size: Size(40, 40)));
      case ChatStatus.error:
        return const Center(child: Text('An error occured'));
      case ChatStatus.loaded:
        return _renderChatWidget(state);
      case ChatStatus.idle:
        return const Center();
    }
  }

  Widget _buildSlidingPanel() {
    return Center();
  }

  Widget _headerWidget(ChatState state) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 9, right: 9, bottom: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Messages\n', style: TextStyle(fontSize: 17)),
              InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.add, color: Colors.black)))
            ],
          ),
          searchChatWidget(),
        ]));
  }

  Widget _chatContainerWidget(ChatState state) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.only(top: 30.0),
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0))),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [_determineChatRender(state)],
            )));
  }

  Widget _renderChatActionWidget(ChatState state) {
    const bool shouldBeDisabled = true;
    return SizedBox(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
            child: Opacity(
                opacity: shouldBeDisabled ? 0.5 : 1,
                child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: HexColor('#EE6115'),
                    child: const Icon(Icons.attractions,
                        size: 30, color: Colors.white),
                    onPressed: () =>
                        shouldBeDisabled ? null : () => print('')))));
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
    return const Center();
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

  Widget searchChatWidget() {
    return TextField(
        obscureText: false,
        controller: searchController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: OutlineInputBorder(
              // borderSide: new BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            suffixIcon: IconButton(
                color: HexColor('#13111A'),
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
                        builder: (context) => MessagingScreen(
                            blocGroup: _blocGroup,
                            metadata: MessagingMetaDataEntity(
                                chatId: '${_appUser!.uid}-$id',
                                chatRecipient: UserEntity(
                                    id: id,
                                    username: username,
                                    profilePic: profilePic),
                                chatUser: UserEntity(
                                    id: _appUser!.uid,
                                    username: userState.user.username,
                                    profilePic:
                                        userState.user.profilePic ?? '')))
                        // instantiateChatInstance(userState.user, )),
                        ))));
      },
    );
  }

  Widget _renderChatWidget(ChatState state) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const ClassicHeader(
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
            return const Center();
          },
        ),
        controller: _refreshController,
        child: _buildChats(state.chats));
  }

  Widget _buildChats(List<ChatEntity> chats) {
    if (chats.isEmpty) {
      return const Center(child: Text('You have no chats'));
    }
    return ListView.builder(
      itemCount: chats.length,
      padding: const EdgeInsets.only(top: 25),
      itemBuilder: (context, index) {
        if (chats[index].latestMessage == null) {
          return const Center();
        }
        final chatId = chats[index].id;
        final unread = chats[index].unread[_appUser!.uid] ?? 0 as int;
        final timeElapsed = chats[index].latestMessage?.date as int;

        final displayName = chats[index]
            .participants
            .firstWhere((participant) => participant.id != userState.user.id)
            .username;

        final displayPhoto = chats[index]
            .participants
            .firstWhere((participant) => participant.id != userState.user.id)
            .profilePic as String;
        final displayMessage = chats[index].latestMessage?.message?.text;

        final chatUser = chats[index]
            .participants
            .firstWhere((participant) => participant.id == userState.user.id);
        final chatRecipient = chats[index]
            .participants
            .firstWhere((participant) => participant.id != userState.user.id);

        final chatMetadata = MessagingMetaDataEntity(
          chatId: chatId,
          chatUser: chatUser,
          chatRecipient: chatRecipient,
        );

        return Padding(
            padding: const EdgeInsets.all(0),
            child: Column(children: [
              Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.black,
                  //HexColor('#121213'),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
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
                        isThreeLine: true,
                        leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                CachedNetworkImageProvider(displayPhoto)),
                        subtitle: _determineMessageDisplay(
                            unread, chats[index].latestMessage),
                        title: Text('$displayName',
                            style: TextStyle(
                                fontSize: const AdaptiveTextSize()
                                    .getAdaptiveTextSize(context, 10))),
                        trailing: Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Column(children: [
                              _timeElaspedWidget(timeElapsed),
                            ])),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessagingScreen(
                                    blocGroup: _blocGroup,
                                    metadata: chatMetadata)))),
                  )),
            ]));
      },
    );
  }

  Widget _timeElaspedWidget(int timeElapsed) {
    return Text(
        TimeElapsed.elapsedTimeDynamic(
            DateTime.fromMicrosecondsSinceEpoch(timeElapsed).toString()),
        style: const TextStyle(fontSize: 14));
  }

  Widget _determineMessageDisplay(
      int unread, LatestMessageEntity? latestMessage) {
    String display = '';

    final _isMine = latestMessage?.message?.user.id == _appUser!.uid;

    final _prefix = _isMine ? 'You: ' : '';

    if (latestMessage?.message?.medias != null &&
        latestMessage!.message!.medias!.isNotEmpty) {
      if (latestMessage.message?.medias?.first.type == chat.MediaType.image) {
        display = '$_prefix Image';
      } else if (latestMessage.message?.medias?.first.type ==
          chat.MediaType.video) {
        display = '$_prefix Video';
      } else if (latestMessage.message?.medias?.first.type ==
          chat.MediaType.audio) {
        display = '$_prefix Voice Message';
      }
    } else if (latestMessage?.message?.text != null) {
      display = '$_prefix ${latestMessage?.message?.text}';
    }

    if (unread > 0) {
      return Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text('${unread.toString()} new messages',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)));
    } else {
      return Text(display,
          style: TextStyle(
              fontSize:
                  const AdaptiveTextSize().getAdaptiveTextSize(context, 10)));
    }
  }
}
