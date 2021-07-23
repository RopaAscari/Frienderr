import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/widgets/display_media/display_media.dart';
import 'package:frienderr/widgets/display_selected_stories/display_selected_stories.dart';
import 'package:provider/provider.dart';
//import 'package:agora_rtm/agora_rtm.dart';
import 'package:frienderr/enums/enums.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/widgets/gallery/gallery.dart';
//import 'package:frienderr/screens/broadcast/broadcast.dart';

class PostMedia extends StatefulWidget {
  PostMedia({Key? key}) : super(key: key);

  @override
  PostMediaState createState() => PostMediaState();
}

class PostMediaState extends State<PostMedia> {
  int x = 0;
  int count = 1;
  bool muted = false;
  String myChannel = '';
  bool isCameraInit = false;
  //late AgoraRtmClient _client;
  int currentTimelineIndex = 0;
  List<dynamic> userStories = [];
  late CameraController _controller;
  final Map<String, int> _channelList = {};
  late Future<void> _initializeControllerFuture;
  final Map<String, List<String>> _seniorMember = {};
  late UserState userState = context.read<UserBloc>().state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initializeCameraController();
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  initializeCameraController() async {
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    setState(() {
      isCameraInit = true;
    });
  }

  /* Future<AgoraRtmChannel> _createChannel(String name) async {
    AgoraRtmChannel channel = await _client.createChannel(name);
    channel.onMemberJoined = (AgoraRtmMember member) async {
      print(
          "Member joined: " + member.userId + ', channel: ' + member.channelId);

      _seniorMember.values.forEach(
        (element) async {
          if (element.first == userState.user.username) {
            // retrieve the number of users in a channel from the _channelList
            for (int i = 0; i < _channelList.length; i++) {
              if (_channelList.keys.toList()[i] == myChannel) {
                setState(() {
                  x = _channelList.values.toList()[i];
                });
              }
            }

            String data = myChannel + ':' + x.toString();
            await _client.sendMessageToPeer(
                member.userId, AgoraRtmMessage.fromText(data));
          }
        },
      );
    };

    channel.onMemberLeft = (AgoraRtmMember member) async {
      print("Member left: " + member.userId + ', channel: ' + member.channelId);
      // await leaveCall(member.channelId, member.userId);
    };
    channel.onMessageReceived =
        (AgoraRtmMessage message, AgoraRtmMember member) async {
      var data = message.text.split(':');
      if (_channelList.keys.contains(data[0])) {
        setState(() {
          _channelList.update(data[0], (v) => int.parse(data[1]));
        });
        if (int.parse(data[1]) >= 2 && int.parse(data[1]) < 5) {
          // await _handleCameraAndMic(Permission.camera);
          //  await _handleCameraAndMic(Permission.microphone);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BroadcastPage(
                  channelName: 'buzz', isBroadcaster: true, user: userState),
            ),
          );
        }
      } else {
        setState(() {
          _channelList.putIfAbsent(data[0], () => int.parse(data[1]));
        });
      }
    };
    return channel;
  }*/

  changeMedia(int type) {
    setState(() {
      currentTimelineIndex = type;
    });
  }

  openGallery() async {
    final mediaAction =
        currentTimelineIndex == Constants.mediaIndexes[MediaType.Posts]
            ? 'Post'
            : 'Story';
    final permitted = await PhotoManager.requestPermission();
    if (!permitted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Gallery(mediaAction: mediaAction)),
    );
  }

  startLiveBroadcast() {
    /*  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
            channelName: 'buzz', isBroadcaster: true, user: userState
            // userName: userState.user.username
            ),
      ),
    );*/
  }

  takePicture() async {
    final mediaAction =
        currentTimelineIndex == Constants.mediaIndexes[MediaType.Posts]
            ? 'Post'
            : 'Story';
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and then get the location
      // where the image file is saved.
      final image = await _controller.takePicture();
      final file = await image.readAsBytes();
      final asset = AssetModel(file: File.fromRawPath(file));
      return;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => mediaAction == Constants.postTypes[PostType.Post]
                  ? DisplayMedia(selectedAssets: [
                      {'id': 0, 'asset': asset, 'type': AssetType.image}
                    ])
                  : DisplaySelectedStories(selectedAssets: [
                      {'id': 0, 'asset': asset, 'type': AssetType.image}
                    ])));
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: FutureBuilder<void>(
              future: isCameraInit ? _initializeControllerFuture : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(children: <Widget>[
                    cameraWidget(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[cameraOptions()],
                    ),
                    postSelectionWidget(),
                  ]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ))));
  }

  Widget cameraOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 5, 1, 40), //margin here
            child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: FittedBox(
                    child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  heroTag: null,
                  child: Icon(Icons.photo_library_outlined,
                      size: 40, color: Colors.grey),
                  //  backgroundColor: Colors.white,
                  elevation: 2,
                  onPressed: () => openGallery(),
                )))),
        Container(
            margin: EdgeInsets.fromLTRB(1, 5, 1, 40), //margin here
            child: SizedBox(
                height: 80.0,
                width: 80.0,
                child: FittedBox(
                    child: FloatingActionButton(
                  heroTag: null,
                  child: Icon(Icons.camera, size: 50, color: Colors.grey),
                  backgroundColor: Colors.transparent,
                  elevation: 2,
                  onPressed: () {
                    takePicture();
                  },
                )))),
        Container(
            margin: EdgeInsets.fromLTRB(1, 5, 5, 40), //margin here
            child: SizedBox(height: 40.0, width: 40.0, child: Center())),
      ],
    ); //;
  }

  Widget cameraWidget() {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 80,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: CameraPreview(_controller),
            )));
  }

  Widget postSelectionWidget() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 30,
            width: 120,
            margin: EdgeInsets.all(35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () =>
                      changeMedia(Constants.mediaIndexes[MediaType.Posts]!),
                  child: Text('Posts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(currentTimelineIndex ==
                                      Constants.mediaIndexes[MediaType.Posts]
                                  ? 1
                                  : 0.5),
                          fontSize: 13))),
              GestureDetector(
                  onTap: () =>
                      changeMedia(Constants.mediaIndexes[MediaType.Stories]!),
                  child: Text(
                    '   Stories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(currentTimelineIndex ==
                                    Constants.mediaIndexes[MediaType.Stories]!
                                ? 1
                                : 0.5),
                        fontSize: 13),
                  )),
            ])));
  }
}

class AssetModel {
  final dynamic file;
  AssetModel({required this.file});
}
