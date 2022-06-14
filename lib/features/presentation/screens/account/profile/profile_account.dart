import 'dart:async';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/post_masonic_view.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/snap_masonic_view.dart';

import '../data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/quicks.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/screens/view_friends/view_friends_list.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

class ProfileAccountScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final String profileUserId;
  final bool isProfileOwnerViewing;

  const ProfileAccountScreen(
      {Key? key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing})
      : super(key: key);

  @override
  State<ProfileAccountScreen> createState() => _ProfileAccountScreenState();
}

class _ProfileAccountScreenState extends State<ProfileAccountScreen> {
  bool _isFollowing = false;
  String get uid => widget.profileUserId;
  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  bool get _isProfileOwnerViewing => widget.isProfileOwnerViewing;
  NotificationBloc notificationBloc = getIt<NotificationBloc>();

  @override
  void initState() {
    _blocGroup.profileAccountBloc
      ..add(ProfileAccountEvent.getUser(uid: uid))
      ..add(ProfileAccountEvent.getPosts(uid: uid))
      ..add(ProfileAccountEvent.getSnaps(uid: uid))
      ..add(ProfileAccountEvent.getFollowers(uid: uid))
      ..add(ProfileAccountEvent.getFollowing(uid: uid));

    setState(() {
      _isFollowing = _blocGroup.userAccountBloc.state.following.contains(uid);
    });
    super.initState();
  }

  Future<void> _logOut(
      BuildContext actionSheetContext, BuildContext highLevelContext) async {
    Navigator.of(actionSheetContext).pop();
  }

  Future<void> _showLogOutDialog(BuildContext highLevelContext) async {
    Navigator.of(context).pop();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext ctx) {
        return _logOutDialog(ctx);
      },
    );
  }

  Future<dynamic?> _messageUser(ProfileAccountState state) async {
    final _chatId = _buildChatId(_user, state.user);
    return await getIt<AppRouter>().push(MessagingRoute(
        blocGroup: _blocGroup,
        metadata: MessagingMetaDataEntity(
          chatId: _chatId,
          chatUser: _user,
          chatRecipient: state.user,
        )));
  }

  String _buildChatId(UserEntity chatUser, UserEntity chatRecipient) {
    final _comparison = chatUser.id.compareTo(chatRecipient.id);
    print(_comparison);
    if (_comparison == -1) {
      return '${chatUser.id}_${chatRecipient.id}';
    } else if ((_comparison == 1)) {
      return '${chatRecipient.id}_${chatUser.id}';
    } else {
      return '';
    }
  }

  void _unFollowAccount() {
    _blocGroup.followersBloc
        .add(FollowersEvent.unfollowUser(uid: _user.id, fid: uid));
  }

  void _followAccount() {
    _blocGroup.followersBloc
        .add(FollowersEvent.followUser(uid: _user.id, fid: uid));
  }

  void _showActionSheet(BuildContext hlc) {
    showModalBottomSheet<void>(
      context: context,
      shape:  RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext btx) {
        return _accountOptions(btx, hlc);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ProfileAccountBloc, ProfileAccountState>(
                bloc: _blocGroup.profileAccountBloc,
                builder: (BuildContext context, ProfileAccountState state) {
                  return SingleChildScrollView(
                      child: Stack(children: [
                    _buildCoverPhoto(state),
                    _buildHeaderActions(),
                    _buildAccounDetails(state)
                  ]));
                  ;
                },
                listener:
                    (BuildContext context, ProfileAccountState state) {})));
  }

  Widget _errorDisplay(String? error) {
    return Center(child: Text(error ?? 'An error occured'));
  }

  Widget _accountLoading() {
    return const Center(child: LoadingIndicator(size: Size(40, 40)));
  }

  Widget _buildHeaderActions() {
    return ConditionalRenderDelegate(
      fallbackWidget: const Center(),
      condition: _isProfileOwnerViewing,
      renderWidget: Positioned(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildCameraIcon(), _buildMenuIcon()]))),
    );
  }

  Widget _buildCameraIcon() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#232323').withOpacity(0.7)),
              child: const Icon(
                CupertinoIcons.camera_fill,
              )),
          onTap: () => null,
        ));
  }

  Widget _buildMenuIcon() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#232323').withOpacity(0.7)),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.menu,
              )),
          onTap: () => _showActionSheet(context),
        ));
  }

  Widget _buildAccounDetails(ProfileAccountState state) {
    return Positioned(
        top: 250,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAccountMetadata(state),
                      _buildAccountActions(state),
                      _buildTabularItems(state)
                    ]))));
  }

  Widget _buildCoverPhoto(ProfileAccountState state) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ConditionalRenderDelegate(
          renderWidget: CachedNetworkImage(
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            imageUrl: state.user.coverPhoto as String,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          fallbackWidget: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),
          condition: state.userState == ProfileAccountUserStatus.loaded,
        ));
  }

  Widget _buildAccountActions(ProfileAccountState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Text(
            state.user.username ?? '',
            style: const TextStyle(fontSize: 23),
          ),
          Text(
            'Hi Im user frienderr',
            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
          )
        ]),
        _buildFollowButton(state)
      ],
    );
  }

  Widget _buildProfilePic(ProfileAccountState state) {
    return GestureDetector(
        child: ConditionalRenderDelegate(
            condition: state.userState == ProfileAccountUserStatus.loaded,
            renderWidget: Hero(
                tag: "profilePic",
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(150.0)),
                      color: Colors.redAccent,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: state.user.profilePic as String,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
            fallbackWidget: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: const BorderRadius.all(Radius.circular(150.0))),
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return _buildFullScreenDisplay(
              tag: "profilePic",
              imageUrl: state.user.profilePic as String,
              isProfileOwnerViewing: _isProfileOwnerViewing,
            );
          }));
        });
  }

  Widget _buildAccountMetadata(ProfileAccountState state) {
    return Container(
        width: 500,
        margin: const EdgeInsets.only(top: 20, bottom: 25),
        // width: 00,
        child: Row(
          children: [
            _buildProfilePic(state),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${state.posts.length}',
                                style: TextStyle(
                                  fontSize: const AdaptiveTextSize()
                                      .getAdaptiveTextSize(context, 14),
                                )),
                            Text('Posts',
                                style: TextStyle(
                                    fontSize: const AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 8),
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold))
                          ])),
                  Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewFriendsList(
                                      id: state.user.id,
                                      isFollowersInitial: true))),
                          child: Column(children: [
                            Text('${state.followers.length}',
                                style: TextStyle(
                                    fontSize: const AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 14))),
                            Text('Followers',
                                style: TextStyle(
                                    fontSize: const AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 8),
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold))
                          ]))),
                  Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewFriendsList(
                                      id: state.user.id,
                                      isFollowersInitial: false))),
                          child: Column(children: [
                            Text('${state.following.length}',
                                style: TextStyle(
                                    fontSize: const AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 14))),
                            Text('Following',
                                style: TextStyle(
                                    fontSize: const AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 8),
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold))
                          ]))),
                  const Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Icon(Icons.keyboard_arrow_down_rounded))
                ]),
          ],
        ));
  }

  Widget _buildTabularItems(ProfileAccountState state) {
    return Container(
        width: 800,
        height: 700,
        margin: const EdgeInsets.only(top: 15),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    const Size.fromHeight(60.0), // here the desired height
                child: AppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  bottom: TabBar(
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 30),
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    tabs: [
                      Tab(
                          icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            SvgPicture.asset(
                              Constants.moreIcon,
                              width: 26,
                              height: 26,
                              color: Colors.grey[300]!,
                            )
                          ])),
                      Tab(
                          icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            SvgPicture.asset(
                              Constants.snapIconOutline,
                              width: 25,
                              height: 25,
                              color: Colors.grey[300]!,
                            )
                          ])),
                    ],
                  ),
                )),
            body: TabBarView(
              children: [
                _buildPosts(state),
                _buildSnaps(state),
              ],
            ),
          ),
        ));
  }

  Widget _buildPosts(ProfileAccountState state) {
    switch (state.postState) {
      case ProfileAccountPostStatus.loading:
        return _accountLoading();
      case ProfileAccountPostStatus.error:
        return _errorDisplay(null);
      case ProfileAccountPostStatus.loaded:
        return _buildPostGridView(state);
      case ProfileAccountPostStatus.idle:
        return const Center();
    }
  }

  Widget _buildPostGridView(ProfileAccountState state) {
    if (state.posts.isEmpty) {
      return const Center(child: Text("No posts"));
    }
    return PostMasonicView(
      posts: state.posts,
      blocGroup: _blocGroup,
      isProfileOwnerViewing: true,
    );
  }

  Widget _buildSnaps(ProfileAccountState state) {
    switch (state.snapState) {
      case ProfileAccountSnapStatus.loading:
        return _accountLoading();
      case ProfileAccountSnapStatus.error:
        return _errorDisplay(null);
      case ProfileAccountSnapStatus.loaded:
        return _buildSnapGridView(state);
      case ProfileAccountSnapStatus.idle:
        return const Center();
    }
  }

  Widget _buildSnapGridView(ProfileAccountState state) {
    if (state.snaps.isEmpty) {
      return const Center(child: Text("No Snaps"));
    }
    return SnapMasonicView(
      snaps: state.snaps,
      blocGroup: _blocGroup,
      isProfileOwnerViewing: true,
    );
  }

  Widget _buildFollowButton(ProfileAccountState state) {
    return Row(children: [
      BlocConsumer<FollowersBloc, FollowersState>(
          bloc: _blocGroup.followersBloc,
          listener: (BuildContext context, FollowersState state) {
            if (state.action == FollowerListenableAction.followSuccess) {
              setState(() {
                _isFollowing = true;
              });

              _blocGroup.userAccountBloc
                  .add(UserAccountEvent.getFollowing(uid: _user.id));
            } else if (state.action == FollowerListenableAction.followFailure) {
              setState(() {
                _isFollowing = false;
              });
            }

            if (state.action == FollowerListenableAction.unfollowSuccess) {
              setState(() {
                _isFollowing = false;
              });

              _blocGroup.userAccountBloc
                  .add(UserAccountEvent.getFollowing(uid: _user.id));
            } else if (state.action ==
                FollowerListenableAction.unfollowFailure) {
              setState(() {
                _isFollowing = true;
              });
            }

            _blocGroup.followersBloc.add(const FollowersEvent.reset());
          },
          builder: (BuildContext context, FollowersState state) {
            return ConditionalRenderDelegate(
                condition: _isFollowing,
                renderWidget: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    gradient:  LinearGradient(
                      end: const Alignment(1.0, 0.0),
                      begin: const Alignment(-0.95, 0.0),
                      colors: const [Colors.transparent, Colors.transparent],
                      stops: const [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: MaterialButton(
                      height: 40,
                      onPressed: _unFollowAccount,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: const Text('Unfollow',
                          style: TextStyle(fontSize: 14, color: Colors.white))),
                ),
                fallbackWidget: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: const Alignment(1.0, 0.0),
                      begin: const Alignment(-0.95, 0.0),
                      colors: [HexColor('#E09810'), HexColor('#FEDA43')],
                      stops: const [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: MaterialButton(
                      height: 40,
                      onPressed: _followAccount,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: const Text('Follow',
                          style: TextStyle(fontSize: 14, color: Colors.white))),
                ));
          }),
      GestureDetector(
        child: Padding(
            child: SvgPicture.asset(
              Constants.messageIconOutline,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 15)),
        onTap: () => _messageUser(state),
      )
    ]);
  }

  Widget _accountOptions(BuildContext btx, BuildContext highLevelContext) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
            children: accountOptions
                .map(
                  (e) => ListTile(
                      leading: Icon(e.icon),
                      title: Text(e.title,
                          style: TextStyle(
                              fontSize: const AdaptiveTextSize()
                                  .getAdaptiveTextSize(context, 10))),
                      onTap: () {
                        Navigator.of(btx).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => e.route));
                      }),
                )
                .toList()));
  }

  Widget _logOutDialog(BuildContext hlc) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text('Logout',
          style: TextStyle(
              fontSize:
                  const AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('We are about to log you out of your account',
                style: TextStyle(
                    fontSize: const AdaptiveTextSize()
                        .getAdaptiveTextSize(context, 10))),
          ],
        ),
      ),
      actions: <Widget>[
      /*  TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, Widget: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _logOut(context, hlc);
          },Widget: const Text('Ok'),
        ),*/
      ],
    );
    ;
  }

  Widget _buildFullScreenDisplay(
      {required String tag,
      required String imageUrl,
      required bool isProfileOwnerViewing}) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ConditionalRenderDelegate(
                      condition: isProfileOwnerViewing,
                      renderWidget: IconButton(
                          icon: const Icon(Icons.photo_camera),
                          onPressed: () {}),
                      fallbackWidget: const Center()))
            ],
            backgroundColor: Theme.of(context).canvasColor),
        // backgroundColor: Colors.black87,
        body: InteractiveViewer(
            constrained: false,
            child: Container(
              child: Hero(
                tag: tag,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              margin: const EdgeInsets.only(top: 100),
            )));
  }
}
