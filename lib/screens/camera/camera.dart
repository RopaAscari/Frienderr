import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/widgets/gallery/gallery.dart';
import 'package:frienderr/widgets/display_media/display_media.dart';
import 'package:frienderr/widgets/display_selected_stories/display_selected_stories.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  int x = 0;
  int count = 1;
  bool muted = false;
  String myChannel = '';
  bool isCameraInit = false;
  int currentTimelineIndex = 0;
  List<dynamic> userStories = [];
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
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
    _controller.dispose();
    super.dispose();
  }

  initializeCameraController() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {
      isCameraInit = true;
    });
  }

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

  takePicture() async {
    final mediaAction =
        currentTimelineIndex == Constants.mediaIndexes[MediaType.Posts]
            ? 'Post'
            : 'Story';
    try {
      await _initializeControllerFuture;

      final image = await _controller.takePicture();
      final file = await image.readAsBytes();
      final test = File.fromRawPath(file);
      print('PATH ${test.path}');
      final asset = AssetModel(file: new Future(() => File.fromRawPath(file)));
      return;
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    final bool isDarkTheme =
        BlocProvider.of<ThemeBloc>(context).state.theme == Constants.darkTheme;

    return SafeArea(
        child: Scaffold(
            backgroundColor: isDarkTheme ? Colors.black : Colors.white,
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
        margin: EdgeInsets.only(bottom: 10),
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
