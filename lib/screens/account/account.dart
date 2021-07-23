import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:frienderr/blocs/notification_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/events/notification_event.dart';
import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/messaging/messaging.dart';
import 'package:frienderr/models/notification/notification_model.dart';
import 'package:frienderr/repositories/auth_repository.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:frienderr/screens/change_theme/change_theme.dart';
import 'package:frienderr/screens/messaging/messaging.dart';
import 'package:frienderr/screens/view_friends_list/view_friends_list.dart';
import 'package:frienderr/widgets/bitmap_convertor/bitmap_converter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/widgets/render_posts/render_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';

class Account extends StatefulWidget {
  final String profileUserId;
  final bool isProfileOwnerViewing;
  Account(
      {Key? key,
      required this.profileUserId,
      required this.isProfileOwnerViewing})
      : super(key: key);

  @override
  AccountState createState() => AccountState();
}

class FullScreenImage extends StatelessWidget {
  final String tag;
  final String userId;
  final String imageUrl;
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
      required this.isProfileOwnerViewing})
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
                  ),
                ))));
  }
}

class AccountState extends State<Account>
    with AutomaticKeepAliveClientMixin<Account> {
  @override
  bool get wantKeepAlive => true;

  late UserState userState;
  List<dynamic> userStories = [];
  String get profileUserId => widget.profileUserId;
  NotificationBloc notificationBloc = new NotificationBloc();
  bool get isProfileOwnerViewing => widget.isProfileOwnerViewing;
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    userState = Provider.of<UserBloc>(context, listen: false).state;
    //  print('PROFILE ${userState.user.id}');
    // fetchUser(profileUserId);
    fetchStories(profileUserId);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userState = Provider.of<UserBloc>(context, listen: true).state;
    super.didChangeDependencies();
  }

  logOut() {
    AuthRepository().signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('We are about to log you out of your account'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
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
    final response = await user.doc(id).get();
    //  print('RES ${response['username']}');
    setState(() {
      userState = response.data() as dynamic;
    });
  }

  followUser(profileUser, appUser) {
    try {
      user.doc(userState.user.id).update({
        'following': FieldValue.arrayUnion([profileUserId])
      }).then((value) => {
            user.doc(profileUserId).update({
              'followers': FieldValue.arrayUnion([userState.user.id])
            })
          });
      final notification = new FollowNotificationModel(
        type: 'Follow',
        recipient: profileUser['id'],
        senderId: appUser.id,
        senderUsername: appUser.username,
        senderProfilePic: appUser.profilePic,
        dateCreated: DateTime.now().microsecondsSinceEpoch,
      );

      notificationBloc.add(SendFollowNotification(notification: notification));
    } catch (err) {}
  }

  unFollowUser() {
    try {
      user.doc(userState.user.id).update({
        'following': FieldValue.arrayRemove([profileUserId])
      }).then((value) => {
            user.doc(profileUserId).update({
              'followers': FieldValue.arrayRemove([userState.user.id])
            })
          });
    } catch (err) {}
  }

  showActionSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext btx) {
        return Container(
            height: MediaQuery.of(context).size.height - 150,
            child: Column(children: [
              ListTile(
                  leading: Icon(Icons.account_circle), title: Text('Profile')),
              ListTile(
                  leading: Icon(Icons.theater_comedy),
                  title: Text('Theme'),
                  onTap: () {
                    Navigator.of(btx).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeTheme()));
                  }),
              ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications')),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () => logOut())
            ]));
      },
    );
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

  Widget build(BuildContext context) {
    final dynamic appUser =
        BlocProvider.of<UserBloc>(context, listen: true).state.user;

    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(profileUserId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }
              dynamic user = snapshot.data!;

              return SingleChildScrollView(
                  child: Stack(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Container(
                          height: MediaQuery.of(context).size.height * .20,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: HexColor('#6D6D70'),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: GestureDetector(
                              onTap: () => {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return FullScreenImage(
                                        tag: "coverPic",
                                        userId: user['id'],
                                        isProfileChanging: false,
                                        imageUrl: user['coverPhoto'],
                                        isProfileOwnerViewing:
                                            isProfileOwnerViewing,
                                      );
                                    }))
                                  },
                              child: Hero(
                                tag: "coverPic",
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: user['coverPhoto'],
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ))),
                      new Container(
                          height: MediaQuery.of(context).size.height * .35,
                          //  color: Colors.white,
                          child: Column(
                            children: [],
                          ))
                    ],
                  ),
                  new Container(
                    alignment: Alignment.topCenter,
                    padding: new EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .13,
                        right: 20.0,
                        left: 20.0),
                    child: new Container(
                      //height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: FractionalOffset.center,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 100),
                                          child: !isProfileOwnerViewing
                                              ? followBottomWidget(
                                                  user, appUser)
                                              : Container()),
                                      Spacer(),
                                      profilePictureWidget(user),
                                      Spacer(),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 100),
                                          child: isProfileOwnerViewing
                                              ? accountIconWidget()
                                              : Container()),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 100),
                                          child: !isProfileOwnerViewing
                                              ? messageButtonWidget(
                                                  appUser, user)
                                              : Container()),
                                    ])),
                            usernameDisplayWidget(user),
                            accountMetadatatWidget(user),
                            userStories.length > 0
                                ? postSliderWidget(user)
                                : Center(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 200),
                                        child: Text('You have no posts')))
                          ]),
                    ),
                  ),
                ],
              ));
            }));
  }

  Widget accountIconWidget() {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;
    final dotIcon = theme == Constants.darkTheme
        ? 'assets/images/dot_menu_light.png'
        : 'assets/images/dot_menu_dark.png';
    return GestureDetector(
        onTap: () => showActionSheet(),
        child: Image.asset(dotIcon, height: 20, width: 20));
  }

  Widget followBottomWidget(user, appUser) {
    bool isFollowing = user['followers'].contains(userState.user.id);

    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.transparent))),
            backgroundColor: MaterialStateProperty.all<Color>(
                isFollowing ? Colors.amber[800] as Color : HexColor('#2E293C')),
            minimumSize: MaterialStateProperty.all<Size>(Size(60, 22))),
        child: isFollowing
            ? Text('Unfollow', style: TextStyle(fontSize: 11))
            : Text('Follow', style: TextStyle(fontSize: 11)),
        onPressed: () =>
            isFollowing ? unFollowUser() : followUser(user, appUser),
      ),
    );
  }

  Widget messageButtonWidget(appUser, user) {
    return Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.transparent))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(HexColor('#2E293C')),
              minimumSize: MaterialStateProperty.all<Size>(Size(60, 22))),
          child: Text('Message', style: TextStyle(fontSize: 11)),
          onPressed: () => messageUser(appUser, user),
        ));
  }

  Widget usernameDisplayWidget(dynamic user) {
    return Text('\n${user['username']}\n', style: TextStyle(fontSize: 14));
  }

  Widget profilePictureWidget(dynamic user) {
    return GestureDetector(
        child: Hero(
            tag: "profilePic",
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                width: 120.0,
                height: 120.0,
                // margin: const EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.redAccent,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: user['profilePic'],
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return FullScreenImage(
              tag: "profilePic",
              userId: user['id'],
              isProfileChanging: true,
              imageUrl: user['profilePic'],
              isProfileOwnerViewing: isProfileOwnerViewing,
            );
          }));
        });
  }

  Widget accountMetadatatWidget(dynamic user) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        // width: 00,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text('${userStories.length}',
                style: TextStyle(
                  fontSize: 16.5,
                )),
            Text('posts', style: TextStyle(fontSize: 12, color: Colors.grey))
          ]),
          GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewFriendsList(
                          id: user['id'], isFollowersInitial: true))),
              child: Column(children: [
                Text('${user['followers'].length}',
                    style: TextStyle(
                      fontSize: 16.5,
                    )),
                Text('followers',
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ])),
          GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewFriendsList(
                          id: user['id'], isFollowersInitial: false))),
              child: Column(children: [
                Text('${user['following'].length}',
                    style: TextStyle(fontSize: 16.5)),
                Text('following',
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ]))
        ]));
  }

  Widget postHeaderWidget(dynamic user) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Posts',
              style: TextStyle(
                fontSize: 16.5,
              )),
        ]));
  }

  Widget postSliderWidget(dynamic user) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      shrinkWrap: true,
      primary: true,
      physics: new NeverScrollableScrollPhysics(),
      itemCount: userStories.length,
      itemBuilder: (BuildContext context, int index) {
        final thumbnail = userStories[index]['content'][0]['media'];

        return OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            closedColor: Colors.transparent,
            transitionType: ContainerTransitionType.fade,
            openBuilder: (BuildContext context, VoidCallback _) {
              return RenderPost(
                items: userStories,
                index: index,
                shoudlPlayParent: true,
                isPostOwner: true,
              );
            },
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return CachedNetworkImage(
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  width: 200,

                  // margin: const EdgeInsets.only(right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.redAccent,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                imageUrl: thumbnail,
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            });

        /* return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ));
          },
          child: ,
        );*/
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}
