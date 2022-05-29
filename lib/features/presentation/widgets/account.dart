import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/account.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/chat/messaging.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/widgets/quicks.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/data/models/chat/chat_participant.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frienderr/features/presentation/widgets/bitmap_converter.dart';
import 'package:frienderr/features/presentation/screens/theme/change_theme.dart';
import 'package:frienderr/features/presentation/screens/messaging/messaging.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/screens/view_friends/view_friends_list.dart';
import 'package:frienderr/features/presentation/screens/construction/under_construction.dart';

class AccountDisplay extends StatefulWidget {
  final Account account;
  final BlocGroup blocGroup;
  final String profileUserId;
  final bool isProfileOwnerViewing;
  const AccountDisplay({
    Key? key,
    required this.account,
    required this.blocGroup,
    required this.profileUserId,
    required this.isProfileOwnerViewing,
  }) : super(key: key);

  @override
  State<AccountDisplay> createState() => _AccountDisplayState();
}

class _AccountDisplayState extends State<AccountDisplay>
    with AutomaticKeepAliveClientMixin<AccountDisplay> {
  @override
  bool get wantKeepAlive => true;

  User? user = FirebaseAuth.instance.currentUser;

  Account get account => widget.account;
  String get profileUserId => widget.profileUserId;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  bool get _isProfileOwnerViewing => widget.isProfileOwnerViewing;
  NotificationBloc get notificationBloc => getIt<NotificationBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _messageUser() {}

  void _unfollowUser() {}

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

  void _showActionSheet(BuildContext hlc) {
    showModalBottomSheet<void>(
      context: context,
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
    super.build(context);

    return SingleChildScrollView(
        child: Stack(children: [
      _buildCoverPhoto(),
      _buildHeaderActions(),
      _buildAccount()
    ]));
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

  Widget _buildAccount() {
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
                      _buildAccountMetadata(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text(
                                account.user.username as String,
                                style: const TextStyle(fontSize: 23),
                              ),
                              Text(
                                'Hi Im user frienderr',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[400]),
                              )
                            ]),
                            _buildAccountActions()
                          ]),
                      _buildTabularItems()
                    ]))));
  }

  Widget _buildCoverPhoto() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child: Container(
                    //height: 220,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  )),
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            // margin: const EdgeInsets.only(right: 40),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          imageUrl: account.user.coverPhoto as String,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }

  Widget _buildTabularItems() {
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
                _buildPosts(),
                _buildSnaps(),
              ],
            ),
          ),
        ));
  }

  Widget _buildPosts() {
    if (account.snaps.isEmpty) {
      return const Center(child: Text("No posts"));
    }
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        pattern: [
          const QuiltedGridTile(1, 1),
        ],
        repeatPattern: QuiltedGridRepeatPattern.inverted,
      ),
      physics: const NeverScrollableScrollPhysics(),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final thumbnail = account.posts[index].content[0].type == "video"
              ? account.posts[index].content[0].metadata.thumbnail
              : account.posts[index].content[0].media;
          return OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              closedColor: Colors.transparent,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (BuildContext context, VoidCallback _) {
                return RenderPost(
                    post: account.posts[index],
                    isPostOwner: _isProfileOwnerViewing,
                    postBloc: widget.blocGroup.postBloc);
              },
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        Image.network(thumbnail as String, fit: BoxFit.cover));
              });
        },
        childCount: account.posts.length,
      ),
    );
  }

  Widget _buildSnaps() {
    if (account.snaps.isEmpty) {
      return const Center(child: Text("No Snaps"));
    }
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        pattern: [
          const QuiltedGridTile(1, 1),
        ],
        repeatPattern: QuiltedGridRepeatPattern.inverted,
      ),
      physics: const NeverScrollableScrollPhysics(),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          final String thumbnail = account.snaps[index].thumbnail;
          return OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              closedColor: Colors.transparent,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (BuildContext context, VoidCallback _) {
                final VideoPlayerController _controller =
                    VideoPlayerController.network(account.snaps[index].url);

                return Quicks(
                  controller: _controller,
                  quick: account.snaps[index],
                );
              },
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(thumbnail, fit: BoxFit.cover));
              });
        },
        childCount: account.snaps.length,
      ),
    );
  }

  Widget _buildAccountActions() {
    return ConditionalRenderDelegate(
        condition: !_isProfileOwnerViewing,
        renderWidget: Row(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: const Alignment(1.0, 0.0),
                begin: const Alignment(-0.95, 0.0),
                colors: [HexColor('#E09810'), HexColor('#FEDA43')],
                stops: const [0.0, 1.0],
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: const MaterialButton(
                height: 40,
                onPressed: null,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // shape: const StadiumBorder(),
                child: Text('Follow',
                    style: TextStyle(fontSize: 14, color: Colors.white))),
          ),
          Padding(
              child: SvgPicture.asset(
                Constants.messageIconOutline,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(left: 15))
        ]),
        fallbackWidget: const Center());
  }

  Widget _buildProfilePic() {
    return GestureDetector(
        child: Hero(
            tag: "profilePic",
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child: Container(
                        //height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100.0,
                        height: 100.0,
                      )),
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                width: 100.0,
                height: 100.0,
                // margin: const EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                  color: Colors.redAccent,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: account.user.profilePic as String,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return FullScreenImage(
              tag: "profilePic",
              userId: account.user.id,
              isProfileChanging: true,
              blocGroup: widget.blocGroup,
              imageUrl: _user.profilePic as String,
              isProfileOwnerViewing: _isProfileOwnerViewing,
            );
          }));
        });
  }

  Widget _buildAccountMetadata() {
    return Container(
        width: 500,
        margin: const EdgeInsets.only(top: 20, bottom: 25),
        // width: 00,
        child: Row(
          children: [
            _buildProfilePic(),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${account.posts.length}',
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
                                      id: account.user.id,
                                      isFollowersInitial: true))),
                          child: Column(children: [
                            Text('${account.followers.length}',
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
                                      id: account.user.id,
                                      isFollowersInitial: false))),
                          child: Column(children: [
                            Text('${account.following.length}',
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

  Widget _accountOptions(BuildContext btx, BuildContext highLevelContext) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        child: Column(children: [
          ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text('Profile',
                  style: TextStyle(
                      fontSize: const AdaptiveTextSize()
                          .getAdaptiveTextSize(context, 10))),
              onTap: () {
                Navigator.of(btx).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderConstruction()));
              }),
          ListTile(
              leading: const Icon(Icons.theater_comedy),
              title: Text('Theme',
                  style: TextStyle(
                      fontSize: const AdaptiveTextSize()
                          .getAdaptiveTextSize(context, 10))),
              onTap: () {
                Navigator.of(btx).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeTheme()));
              }),
          ListTile(
              leading: const Icon(Icons.bookmark_add),
              title: Text('Saved Posts',
                  style: TextStyle(
                      fontSize: const AdaptiveTextSize()
                          .getAdaptiveTextSize(context, 10))),
              onTap: () {
                Navigator.of(btx).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderConstruction()));
              }),
          ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('Notifications',
                  style: TextStyle(
                      fontSize: const AdaptiveTextSize()
                          .getAdaptiveTextSize(context, 10))),
              onTap: () {
                Navigator.of(btx).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UnderConstruction()));
              }),
          ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout',
                  style: TextStyle(
                      fontSize: const AdaptiveTextSize()
                          .getAdaptiveTextSize(context, 10))),
              onTap: () => _showLogOutDialog(highLevelContext))
        ]));
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
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            _logOut(context, hlc);
          },
        ),
      ],
    );
    ;
  }
}

class FullScreenImage extends StatelessWidget {
  final String tag;
  final String userId;
  final String imageUrl;
  final BlocGroup blocGroup;
  final bool isProfileChanging;
  final bool isProfileOwnerViewing;

  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  FullScreenImage(
      {Key? key,
      required this.tag,
      required this.userId,
      required this.imageUrl,
      required this.isProfileChanging,
      required this.isProfileOwnerViewing,
      required this.blocGroup})
      : super(key: key);

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  onChangeProfilePhoto(String type, BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    final File file = File(pickedFile?.path as String);

    final path = type == Constants.profileChange['CoverPhoto']
        ? 'coverPhoto'
        : 'profilePic';

    final url = await uploadHandler(file, path);

    final Map<String, dynamic> updated =
        type == Constants.profileChange['ProfilePhoto']
            ? {'profilePic': url}
            : {'coverPhoto': url};

    try {
      user.doc(userId).update(updated);
      Navigator.of(context).pop();
      if (type == Constants.profileChange['ProfilePhoto']) {
        final image = await loadImage(file.readAsBytesSync());
        final bitMapImageRounded =
            await BitmapConverter().saveCanvas(Size(100, 100), image);
        final uploadFile = new File(bitMapImageRounded);
        final url = await uploadHandler(uploadFile, 'bitmapImages');
        user.doc(userId).update({'bitmapImage': url});

        final updated = blocGroup.userBloc.state.user.copyWith(profilePic: url);
        blocGroup.userBloc.add(UserEvent.setUser(updated));
        print('updated');
      }
    } catch (err) {}
  }

  uploadHandler(File file, String path) async {
    final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('/$path/$timestamp');
    await storageRef
        .putFile(
          file,
          SettableMetadata(
            contentType: 'image/jpg',
          ),
        )
        .catchError((onError) => print('Error : $onError'));
    return await storageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: isProfileOwnerViewing
                      ? IconButton(
                          icon: Icon(Icons.photo_camera),
                          onPressed: () {
                            final changeType = isProfileChanging
                                ? Constants.profileChange['ProfilePhoto']
                                    as String
                                : Constants.profileChange['CoverPhoto']
                                    as String;
                            onChangeProfilePhoto(changeType, context);
                          })
                      : null)
            ],
            backgroundColor: Theme.of(context).canvasColor),
        // backgroundColor: Colors.black87,
        body: InteractiveViewer(
            constrained: false,
            child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: Hero(
                  tag: tag,
                  child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                      imageUrl: imageUrl,
                      progressIndicatorBuilder: (context, url,
                              downloadProgress) =>
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              enabled: true,
                              child: Container(
                                //height: 220,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width,
                              ))),
                ))));
  }
}
