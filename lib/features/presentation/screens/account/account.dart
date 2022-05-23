import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/data/models/chat/chat_participant.dart';
import 'package:frienderr/features/data/models/chat/messaging.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';

import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/theme/change_theme.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
import 'package:frienderr/features/presentation/screens/messaging/messaging.dart';
import 'package:frienderr/features/presentation/screens/construction/under_construction.dart';
import 'package:frienderr/features/presentation/screens/view_friends/view_friends_list.dart';
import 'package:frienderr/features/presentation/widgets/bitmap_converter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:frienderr/core/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

class AccountScreen extends StatefulWidget {
  final String profileUserId;
  final bool isProfileOwnerViewing;
  final BlocGroup blocGroup;
  const AccountScreen(
      {Key? key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing})
      : super(key: key);

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen>
    with AutomaticKeepAliveClientMixin<AccountScreen> {
  @override
  bool get wantKeepAlive => true;

  User? user = FirebaseAuth.instance.currentUser;

  List<dynamic> userStories = [];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String get profileUserId => widget.profileUserId;
  NotificationBloc get notificationBloc => getIt<NotificationBloc>();
  bool get isProfileOwnerViewing => widget.isProfileOwnerViewing;
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  @override
  void initState() {
    fetchStories(profileUserId);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  logOut(BuildContext actionSheetContext, BuildContext highLevelContext) async {
    Navigator.of(actionSheetContext).pop();
    //Future.delayed(Duration(milliseconds: 500));
    //AuthRepository().signOut();
    //Future.delayed(Duration(milliseconds: 500));
    /*Navigator.pushAndRemoveUntil(
      highLevelContext,
      MaterialPageRoute(
          builder: (context) => LoginScreen(
              userBloc: getIt<UserBloc>(),
              shouldRenderUI: true,
              authenticationBloc: getIt<AuthenticationBloc>())),
      (Route<dynamic> route) => false,
    );*/
  }

  Future<void> showLogOutDialog(BuildContext highLevelContext) async {
    Navigator.of(context).pop();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Logout',
              style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We are about to log you out of your account',
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
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
                logOut(context, highLevelContext);
              },
            ),
          ],
        );
      },
    );
  }

  fetchStories(String id) async {
    final response = await posts.where('user.id', isEqualTo: id).get();

    setState(() {
      userStories = response.docs.toList();
    });
  }

  fetchUser(String id) async {
    final response = await userCollection.doc(id).get();
    //  print('RES ${response['username']}');
    setState(() {
      // userState = response.data() as dynamic;
    });
  }

  followUser(profileUser, appUser) {
    try {
      userCollection.doc(user!.uid).update({
        'following': FieldValue.arrayUnion([profileUserId])
      }).then((value) => {
            userCollection.doc(profileUserId).update({
              'followers': FieldValue.arrayUnion([user!.uid])
            })
          });
      /*    final notification = new FollowNotificationModel(
        type: 'Follow',
        senderId: appUser.id,
        recipient: profileUser['id'],
        senderUsername: appUser.username,
        senderProfilePic: appUser.profilePic,
        dateCreated: DateTime.now().microsecondsSinceEpoch,
      );*/

      // notificationBloc.add(SendFollowNotification(notification: notification));
    } catch (err) {}
  }

  unFollowUser() {
    try {
      userCollection.doc(user!.uid).update({
        'following': FieldValue.arrayRemove([profileUserId])
      }).then((value) => {
            userCollection.doc(profileUserId).update({
              'followers': FieldValue.arrayRemove([user!.uid])
            })
          });
    } catch (err) {}
  }

  showActionSheet(BuildContext highLevelContext) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext btx) {
        return Container(
            height: MediaQuery.of(context).size.height - 150,
            child: Column(children: [
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  onTap: () {
                    Navigator.of(btx).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UnderConstruction()));
                  }),
              ListTile(
                  leading: Icon(Icons.theater_comedy),
                  title: Text('Theme',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  onTap: () {
                    Navigator.of(btx).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeTheme()));
                  }),
              ListTile(
                  leading: Icon(Icons.bookmark_add),
                  title: Text('Saved Posts',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  onTap: () {
                    Navigator.of(btx).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UnderConstruction()));
                  }),
              ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  onTap: () {
                    Navigator.of(btx).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UnderConstruction()));
                  }),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getAdaptiveTextSize(context, 10))),
                  onTap: () => showLogOutDialog(highLevelContext))
            ]));
      },
    );
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  messageUser(dynamic user, dynamic profileUser) {
    final metaData = new MessagingMetaData(
        chatId: '',
        chatRecipient: new ChatParticipant(
            id: profileUser['id'],
            username: profileUser['username'],
            profilePic: profileUser['profilePic']),
        chatUser: new ChatParticipant(
            id: user.id, username: user.username, profilePic: user.profilePic));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Messaging(
                  metaData: metaData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      SizedBox(
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
            imageUrl: _user.profilePic as String,
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
      Positioned(
          top: 250,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        accountMetadatatWidget(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                Text(
                                  _user.username,
                                  style: TextStyle(fontSize: 23),
                                ),
                                Text(
                                  'Hi Im user frienderr',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[400]),
                                )
                              ]),
                              accountIconWidget()
                            ]),
                        _mediaTabView()
                      ]))))
    ])));
  }

  Widget _mediaTabView() {
    return SizedBox(
        height: 500,
        width: 800,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0), // here the desired height
                child: AppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                  bottom: const TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    tabs: [
                      Tab(icon: Text('Media')),
                      Tab(icon: Text('Snaps')),
                      Tab(icon: Text('Status')),
                    ],
                  ),
                )),
            body: TabBarView(
              children: [
                postGridWidget(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ));
  }

  Widget accountIconWidget() {
    return Row(children: [
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
    ]);
  }

  Widget profilePictureWidget() {
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
                  borderRadius: BorderRadius.all(Radius.circular(150.0)),
                  color: Colors.redAccent,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: _user.profilePic as String,
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return FullScreenImage(
              tag: "profilePic",
              blocGroup: widget.blocGroup,
              userId: _user.id as String,
              isProfileChanging: true,
              imageUrl: _user.profilePic as String,
              isProfileOwnerViewing: isProfileOwnerViewing,
            );
          }));
        });
  }

  Widget accountMetadatatWidget() {
    return Container(
        width: 500,
        margin: const EdgeInsets.only(top: 20, bottom: 25),
        // width: 00,
        child: Row(
          children: [
            profilePictureWidget(),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${userStories.length}',
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
                                      id: _user.id, isFollowersInitial: true))),
                          child: Column(children: [
                            Text('${_user.followers!.length}',
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 14))),
                            Text('Followers',
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
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
                                      id: _user.id,
                                      isFollowersInitial: false))),
                          child: Column(children: [
                            Text('${_user.following!.length}',
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
                                        .getAdaptiveTextSize(context, 14))),
                            Text('Following',
                                style: TextStyle(
                                    fontSize: AdaptiveTextSize()
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

  Widget postHeaderWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Posts',
                  style: TextStyle(
                    fontSize: 16.5,
                  )),
            ]));
  }

  Widget postGridWidget() {
    return MasonryGridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      primary: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userStories.length,
      itemBuilder: (BuildContext context, int index) {
        final thumbnail = userStories[index]['content'][0]['type'] == 'video'
            ? userStories[index]['content'][0]['thumbnail']
            : userStories[index]['content'][0]['media'];

        return Image.network(thumbnail);
      },
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}
