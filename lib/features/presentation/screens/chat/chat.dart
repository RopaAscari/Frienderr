import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/data/models/chat/latest_message.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/empy_builder.dart';
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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  final storyController = StoryController();
  BlocGroup get _blocGroup => widget.blocGroup;
  FollowingBloc get followingBloc => getService<FollowingBloc>();
  UserModel get _user => widget.blocGroup.userBloc.state.user;
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
  void _listener(BuildContext context, ChatState state) {}
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      floatingActionButton: _buildMessageButton(),
      body: CustomScrollView(slivers: [
        _buildAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          searchChatWidget(),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SmartRefresher(
                  enablePullUp: false,
                  enablePullDown: true,
                  controller: _refreshController,
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 2000));
                    _refreshController.refreshCompleted();
                  },
                  header: CustomHeader(
                      builder: (BuildContext context, RefreshStatus? mode) {
                    if (mode == RefreshStatus.refreshing) {
                      return const Center(
                          child: LoadingIndicator(size: Size(40, 40)));
                    }

                    return const Center();
                  }),
                  child: BlocConsumer<ChatBloc, ChatState>(
                      bloc: _blocGroup.chatBloc,
                      listener: _listener,
                      listenWhen: (ChatState prevState, ChatState currState) {
                        return true;
                      },
                      builder: (BuildContext context, ChatState state) {
                        return PagedListView<int, ChatModel>.separated(
                          shrinkWrap: true,
                          separatorBuilder: (ctx, i) {
                            return const Center();
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          pagingController:
                              _blocGroup.chatBloc.state.paginationController,
                          builderDelegate: PagedChildBuilderDelegate<ChatModel>(
                            animateTransitions: true,
                            firstPageProgressIndicatorBuilder: (ctx) {
                              return const LoadingIndicator(size: Size(40, 40));
                            },
                            noItemsFoundIndicatorBuilder: (ctx) {
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .7,
                                  child: const Center(
                                      child: Text(
                                          "Start a conversation to see your chats",
                                          style: TextStyle(fontSize: 13))));
                            },
                            newPageProgressIndicatorBuilder: (ctx) {
                              return const LoadingIndicator(size: Size(40, 40));
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            itemBuilder: (context, chat, index) {
                              return Padding(
                                child: _buildChats(chat),
                                padding: const EdgeInsets.only(top: 0.0),
                              );
                            },
                          ),
                        );
                      })))
        ]))
      ]),
    );
  }

  Widget _buildMessageButton() {
    return Container(
      width: 55,
      height: 55,
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: const Alignment(-0.95, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: [HexColor('#E09810'), HexColor('#FEDA43')],
          stops: const [0.0, 1.0],
        ),
      ),
      child: const Icon(CupertinoIcons.chat_bubble_2, size: 30),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        title: null,
        floating: true,
        leading: const Center(),
        backgroundColor: Theme.of(context).canvasColor,
        expandedHeight: 55,
        flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).canvasColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Chats\n', style: TextStyle(fontSize: 17)),
                  /*InkWell(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.add, color: Colors.black)))*/
                ],
              ),
            )));
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
        const Text('\You have no friends', style: TextStyle(fontSize: 14)),
        //your widgets here...
      ],
    );
  }

  Widget searchChatWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
      child: TextField(
          obscureText: false,
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 13.5),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
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
              contentPadding: const EdgeInsets.only(top: 30.0, left: 20.0))),
    );
  }

  Widget renderFriendsListWidget(FollowingState state) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          color: HexColor('#1B1921'),
        ),
        child: Column(children: [
          const Text('\nFriends\n', style: TextStyle(fontSize: 20)),
          Expanded(
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
                                chatId: '${_user.id}-$id',
                                chatRecipient: UserDTO(
                                    id: id,
                                    username: username,
                                    profilePic: profilePic),
                                chatUser: UserDTO(
                                    id: _user.id,
                                    username: _user.username,
                                    profilePic: _user.profilePic ?? '')))
                        // instantiateChatInstance(userState.user, )),
                        ))));
      },
    );
  }

  Widget _buildChats(ChatModel chat) {
    if (chat.latestMessage == null) {
      return const Center();
    }
    final chatId = chat.id;
    final unread = chat.unread[_user.id] ?? 0 as int;
    final timeElapsed = chat.latestMessage?.date as int;

    final displayName = chat.participants
        .firstWhere((participant) => participant.id != _user.id)
        .username;
    ;
    final displayPhoto = chat.participants
        .firstWhere((participant) => participant.id != _user.id)
        .profilePic as String;

    final displayMessage = chat.latestMessage?.message?.text;

    final chatUser = chat.participants
        .firstWhere((participant) => participant.id == _user.id);
    final chatRecipient = chat.participants
        .firstWhere((participant) => participant.id != _user.id);

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
              color: Theme.of(context).canvasColor,
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
                child: SizedBox(
                  height: 60,
                  child: ListTile(
                      isThreeLine: true,
                      dense: false,
                      leading: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              CachedNetworkImageProvider(displayPhoto)),
                      subtitle:
                          _determineMessageDisplay(unread, chat.latestMessage),
                      title: Text(
                        '$displayName',
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: Container(
                          margin: const EdgeInsets.only(top: 0),
                          child: Column(children: [
                            _timeElaspedWidget(timeElapsed),
                          ])),
                      onTap: () {
                        getService<AppRouter>().push(MessagingRoute(
                            blocGroup: _blocGroup, metadata: chatMetadata));
                      }),
                ),
              )),
        ]));
  }

  Widget _timeElaspedWidget(int timeElapsed) {
    return Text(
        TimeElapsed.elapsedTimeDynamic(
            DateTime.fromMicrosecondsSinceEpoch(timeElapsed).toString()),
        style: const TextStyle(fontSize: 12.5));
  }

  Widget _determineMessageDisplay(int unread, LatestMessage? latestMessage) {
    String display = '...';

    final _isMine = latestMessage?.message?.user.id == _user.id;

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
      return Text(display, style: const TextStyle(fontSize: 12));
    }
  }
}
