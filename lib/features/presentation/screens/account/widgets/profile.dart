import 'dart:async';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/widgets/gallery_picker/gallery_picker.dart';
import 'package:frienderr/features/presentation/widgets/latest_reaction_builder.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';

import '../data.dart';
import 'dart:developer';
import 'snap_preview.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/fonts.gen.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/profile/profile.dart';
import 'package:frienderr/features/presentation/widgets/user_avatar.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/screens/view_friends/view_friends_list.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/post_masonic_view.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/snap_masonic_view.dart';

import 'update_profile.dart';

class ProfileAccount extends StatefulWidget {
  final bool? loading;
  final Profile profile;
  final bool isProfileOwner;
  final BlocGroup blocGroup;

  const ProfileAccount(
      {Key? key,
      this.loading,
      required this.profile,
      required this.blocGroup,
      required this.isProfileOwner})
      : super(key: key);

  @override
  State<ProfileAccount> createState() => _ProfileAccountState();
}

class _ProfileAccountState extends State<ProfileAccount> {
  bool _isFollowing = false;
  final double _bottomOffset = 0.0;
  final double _avatarOffset = 65.0;
  Profile get _profile => widget.profile;
  late ScrollController _srollController;
  BlocGroup get _blocGroup => widget.blocGroup;
  bool get _isProfileOwner => widget.isProfileOwner;
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  NotificationBloc notificationBloc = getService<NotificationBloc>();

  @override
  void initState() {
    log(_profile.posts.length.toString());
    setState(() {
      _isFollowing = _profile.isFollowing;
    });

    _srollController = ScrollController();

    _srollController.addListener(() {});

    super.initState();
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

  Future<dynamic?> _messageUser() async {
    final _chatId = _buildChatId(_user, _profile.user);
    return await getService<AppRouter>().push(MessagingRoute(
        blocGroup: _blocGroup,
        metadata: MessagingMetaDataEntity(
          chatId: _chatId,
          chatUser: _user,
          chatRecipient: _profile.user,
        )));
  }

  Future<dynamic?> _navigateToPostGridView() async {
    return await getService<AppRouter>().push(PostMasonicRoute(
      blocGroup: _blocGroup,
      posts: _profile.posts,
      isProfileOwnerViewing: true,
    ));
  }

  Future<dynamic?> _navigateToSnapGridView() async {
    return await getService<AppRouter>().push(SnapMasonicRoute(
      blocGroup: _blocGroup,
      snaps: _profile.snaps,
      isProfileOwnerViewing: true,
    ));
  }

  String _buildChatId(UserModel chatUser, UserModel chatRecipient) {
    final _comparison = chatUser.id.compareTo(chatRecipient.id);

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
        .add(FollowersEvent.unfollowUser(uid: _user.id, fid: _profile.user.id));
  }

  void _followAccount() {
    _blocGroup.followersBloc
        .add(FollowersEvent.followUser(uid: _user.id, fid: _profile.user.id));
  }

  void _showActionSheet(BuildContext hlc) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: HexColor("#111010"),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
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
            body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
          controller: _srollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              title: null,
              floating: true,
              collapsedHeight: 150,
              expandedHeight: 200.0,
              onStretchTrigger: () async {},
              leading: _buildCameraIcon(),
              actions: <Widget>[_buildMenuIcon()],
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildCoverPhoto(),
                collapseMode: CollapseMode.parallax,
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildMessageButton(),
                        _buildFollowButton(),
                      ],
                    ),
                  ),
                  _buildAccountDetails(),
                  _buildAccountInfo(),
                  _buildAccountMetadata(),
                  ConditionalRenderDelegate(
                      condition: _profile.posts.isEmpty &&
                          _profile.snaps.isEmpty &&
                          _profile.followersList.isEmpty,
                      renderWidget: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Lottie.asset(
                              Assets.lottie.socialMediaNetwork,
                              width: 350,
                              height: 350,
                            ),
                            Center(
                                child: Text('You have no posts on your account',
                                    style: TextStyle(
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(1.3)))),
                          ],
                        ),
                      ),
                      fallbackWidget: Column(children: [
                        _buildPostList(),
                        _buildSnapList(),
                        _buildFollowersList(),
                      ])),
                ])))
          ]),
    )));
  }

  Widget _buildCameraIcon() {
    return ConditionalRenderDelegate(
        condition: _isProfileOwner,
        fallbackWidget: const Center(),
        renderWidget: Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor('#232323').withOpacity(0.3)),
                  child: const Icon(CupertinoIcons.camera_fill, size: 20)),
              // ignore: avoid_returning_null_for_void
              onTap: () => null,
            )));
  }

  Widget _buildMenuIcon() {
    return ConditionalRenderDelegate(
        condition: _isProfileOwner,
        fallbackWidget: const Center(),
        renderWidget: InkWell(
          child: PopupMenuContainer<ProfileActions>(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor('#232323').withOpacity(0.3)),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.more_horiz, size: 20)),
            ),
            items: [
              PopupMenuItem(
                  value: ProfileActions.logout,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logout',
                          style: TextStyle(
                              color: Colors.grey[100]!, fontSize: 13)),
                      const Icon(Icons.logout, size: 19),
                    ],
                  ))
            ],
            onItemSelected: (value) async {
              if (value == ProfileActions.logout) {
                _showLogOutDialog(context);
                // _blocGroup.postBloc.add(PostEvent.deletePost(postId: _post.id));
              }
            },
          ),
        ));
  }

  Widget _buildAccountDetails() {
    return Column(
      children: [
        Container(
            height: 0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const []))),
      ],
    );
  }

  Widget _buildFollowersList() {
    return ConditionalRenderDelegate(
        condition: _profile.followersList.isNotEmpty,
        fallbackWidget: const Center(),
        renderWidget: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, left: 20.0, right: 20.0, bottom: 0.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Followers",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.7))),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.5)),
                )
              ]),
              Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _profile.followersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            UserAvatar(
                              size: 30,
                              blocGroup: _blocGroup,
                              profilePic:
                                  _profile.followersList[index].profilePic,
                              avatarUserId: _profile.followersList[index].id,
                            ),
                            Text(_profile.followersList[index].username,
                                style: const TextStyle(fontSize: 12))
                          ],
                        );
                      }))
            ],
          ),
        ));
  }

  Widget _buildPostList() {
    return ConditionalRenderDelegate(
      condition: _profile.posts.isNotEmpty,
      fallbackWidget: const Center(),
      renderWidget: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 17.0, right: 17.0, bottom: 0.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Posts",
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.7))),
                    GestureDetector(
                        onTap: () => _navigateToPostGridView(),
                        child: Text("View All",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.5))))
                  ])),
          Container(
              height: 150,
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _profile.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildPostDisplay(post: _profile.posts[index]);
                  }))
        ],
      ),
    );
  }

  Widget _buildPostDisplay({required Post post}) {
    final thumbnail = post.content[0].type == "video"
        ? post.content[0].metadata.thumbnail ?? ''
        : post.content[0].media;

    print(post.latestReactions);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            imageUrl: thumbnail,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.grey[800]!.withOpacity(0.5)),
                  child: Row(
                    children: [
                      LatestReactionBuilder(reactions: post.latestReactions),
                      Text(post.reactions.toString(),
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.3))),
                    ],
                  ))),
        ],
      ),
    );
  }

  Widget _buildSnapList() {
    return ConditionalRenderDelegate(
        condition: _profile.snaps.isNotEmpty,
        fallbackWidget: const Center(),
        renderWidget: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 17.0, right: 17.0, bottom: 0.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Snaps",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.7))),
                      GestureDetector(
                          onTap: () => _navigateToSnapGridView(),
                          child: Text("View All",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.5))))
                    ])),
            Container(
                height: 250,
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _profile.snaps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          SnapPreview(
                              snap: _profile.snaps[index], index: index),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey[800]!.withOpacity(0.5)),
                                child: Row(
                                  children: [
                                    const Icon(Icons.play_arrow, size: 20),
                                    Text(_profile.snaps[index].likes.toString(),
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.3))),
                                  ],
                                ),
                              ))
                        ],
                      );
                    }))
          ],
        ));
  }

  Widget _buildCoverPhoto() {
    final String _coverPhoto =
        _isProfileOwner ? _user.coverPhoto! : _profile.user.coverPhoto!;
    return Center(
      child: Stack(
        children: [
          GestureDetector(
              child: Hero(
                tag: PhotoChange.coverPhoto.name,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          imageUrl: _coverPhoto,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ))),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return _buildFullScreenDisplay(
                    imageUrl: _coverPhoto,
                    tag: PhotoChange.coverPhoto,
                    isProfileOwnerViewing: _isProfileOwner,
                  );
                }));
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0))))),
          Align(alignment: Alignment.bottomCenter, child: _buildProfilePic()),
        ],
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: Column(children: [
        //  _buildMessageButton(),
        Text(
          _profile.user.username,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(2.4)),
        ),
        Text(
          _profile.user.status ?? 'Hi Im user frienderr',
          style: TextStyle(
              fontFamily: FontFamily.inter,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
              color: Colors.grey[400]),
        )
      ]),
    );
  }

  Widget _buildProfilePic() {
    final String _profilePic =
        _isProfileOwner ? _user.profilePic! : _profile.user.profilePic!;

    return Align(
      alignment: const Alignment(0.0, 1.0),
      child: GestureDetector(
          child: Hero(
              tag: PhotoChange.profilePhoto.name,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => AnimatedContainer(
                  width: _avatarOffset,
                  height: _avatarOffset,
                  duration: const Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(150.0)),
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                imageUrl: _profilePic,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return _buildFullScreenDisplay(
                imageUrl: _profilePic,
                tag: PhotoChange.profilePhoto,
                isProfileOwnerViewing: _isProfileOwner,
              );
            }));
          }),
    );
  }

  Widget _buildAccountMetadata() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 80.0, right: 80.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .75,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${_profile.following}',
                            style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.3),
                            )),
                        Text('Following',
                            style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.3),
                              color: Colors.grey,
                            ))
                      ])),
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: GestureDetector(
                      child: Column(children: [
                    Text('${_profile.following}',
                        style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                        )),
                    Text('Followers',
                        style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
                          color: Colors.grey,
                        ))
                  ]))),
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: GestureDetector(
                      child: Column(children: [
                    Text('${_profile.reactions}',
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.3))),
                    Text('Reactions',
                        style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.3),
                          color: Colors.grey,
                        ))
                  ]))),
            ]),
      ),
    );
  }

  Widget _buildMessageButton() {
    return ConditionalRenderDelegate(
        condition: !_isProfileOwner,
        renderWidget: Padding(
          child: MaterialButton(
              height: 35,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.grey[600]!)),
              onPressed: _messageUser,
              child: Text('Message',
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
                      color: Colors.grey[300]!))),
          padding: const EdgeInsets.all(0),
        ),
        fallbackWidget: const Center());
  }

  Widget _buildFollowButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: ConditionalRenderDelegate(
            condition: !_isProfileOwner,
            renderWidget: BlocListener<FollowersBloc, FollowersState>(
              bloc: _blocGroup.followersBloc,
              listener: (BuildContext context, FollowersState state) {
                if (state.action == FollowerListenableAction.followSuccess) {
                  setState(() {
                    _isFollowing = true;
                  });

                  _blocGroup.userAccountBloc
                      .add(UserAccountEvent.getFollowing(uid: _user.id));
                } else if (state.action ==
                    FollowerListenableAction.followFailure) {
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
              child: ConditionalRenderDelegate(
                  condition: _isFollowing,
                  renderWidget: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      gradient: const LinearGradient(
                        end: Alignment(1.0, 0.0),
                        begin: Alignment(-0.95, 0.0),
                        colors: [Colors.transparent, Colors.transparent],
                        stops: [0.0, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: MaterialButton(
                        height: 32,
                        onPressed: _unFollowAccount,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text('Unfollow',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.5),
                                color: Colors.white))),
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
                        height: 32,
                        onPressed: _followAccount,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text('Follow',
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.5),
                                color: Colors.white))),
                  )),
            ),
            fallbackWidget: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
                      child: UpdateProfile(
                          profile: _profile, blocGroup: _blocGroup)));
                },
                child: SvgPicture.asset(Assets.icons.profileEditIcon,
                    color: Colors.white, width: 22, height: 22)),
          )),
    );
  }

  Widget _accountOptions(BuildContext btx, BuildContext highLevelContext) {
    return SizedBox(
        //   height: MediaQuery.of(context).size.height - 150,
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
                        if (e.title == "Logout") {
                          _showLogOutDialog(highLevelContext);
                          return;
                        }
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
        TextButton(
          onPressed: () => Navigator.pop(hlc, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(hlc);
            _blocGroup.authenticationBloc
                .add(const AuthenticationEvent.logOut());
          },
          child: const Text('OK'),
        ),
      ],
    );
    ;
  }

  Widget _buildFullScreenDisplay(
      {required String imageUrl,
      required PhotoChange tag,
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
                          onPressed: () => Navigator.of(context)
                                  .push(RouteBuilder.createAnimatedRoute(
                                child: GalleryPicker(
                                  onPicked: (assets) async {
                                    final file = assets[0].asset;

                                    if (tag == PhotoChange.profilePhoto) {
                                      _blocGroup.profileAccountBloc.add(
                                          ProfileAccountEvent
                                              .updateProfilePhoto(
                                                  file: file,
                                                  uid: _user.id,
                                                  userBloc:
                                                      _blocGroup.userBloc));
                                    } else {
                                      _blocGroup.profileAccountBloc.add(
                                          ProfileAccountEvent.updateCoverPhoto(
                                              file: file,
                                              uid: _user.id,
                                              userBloc: _blocGroup.userBloc));
                                    }
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ))),
                      fallbackWidget: const Center()))
            ],
            backgroundColor: Theme.of(context).canvasColor),
        // backgroundColor: Colors.black87,
        body: InteractiveViewer(
            constrained: false,
            child: Container(
              child: Hero(
                tag: tag.name,
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
