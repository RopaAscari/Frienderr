import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/presentation/widgets/gallery.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

const mediaOptions = ['Posts', 'Stories', 'Quicks'];

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  double progress = 0;
  late File thumbnail;
  bool isRecording = false;
  bool isCameraInit = false;
  bool isCameraFront = false;
  late Timer recordingTimer;
  int currentTimelineIndex = 0;
  bool _isTthumbnailInitialzed = false;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late Future<File?> _initializeThumbnailFuture;
  late UserState userState = context.read<UserBloc>().state;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchAssetThumbnail();
      _initializeCameraController();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<File> _fetchAssetThumbnail() async {
    const offset = 0;
    final albums = await PhotoManager.getAssetPathList(type: RequestType.all);
    final recentAlbum = albums.first;
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1, // end at a very big index (to get all the assets)
    );

    final file = await recentAssets[offset].file as File;

    _initializeThumbnailFuture = recentAssets[offset].file;

    setState(() {
      _isTthumbnailInitialzed = true;
    });

    return file;
  }

  void _initializeCameraController() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {
      isCameraInit = true;
      isCameraFront = false;
    });
  }

  void _initializeDuration() async {
    final timer = new Timer.periodic(
      Duration(milliseconds: 100),
      (Timer timer) => setState(
        () {
          progress = timer.tick / 1000;
        },
      ),
    );

    setState(() {
      recordingTimer = timer;
    });
  }

  void _initializeFrontCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras[1];

    _controller.dispose().then((value) {
      _controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller.initialize();
      this.setState(() {
        isCameraFront = true;
      });
    });
  }

  void _startVideoRecording() async {
    this.setState(() {
      isRecording = true;
    });
    _initializeDuration();
    _controller.startVideoRecording();
  }

  void _stopVideoRecording() async {
    this.setState(() {
      isRecording = false;
    });
    recordingTimer.cancel();
    final XFile file = await _controller.stopVideoRecording();
  }

  void _takePicture() async {
    try {
      final image = await _controller.takePicture();
      final file = await image.readAsBytes();
      final test = File.fromRawPath(file);
      // final asset = AssetModel(file: new Future(() => File.fromRawPath(file)));
      return;
    } catch (e) {
      print(e);
    }
  }

  void _changeMedia(int type) {
    setState(() {
      currentTimelineIndex = type;
    });
  }

  void _openGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4'],
    );
    return;
    final mediaAction =
        currentTimelineIndex == Constants.mediaIndexes[MediaType.Posts]
            ? 'Post'
            : 'Story';
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Gallery(mediaAction: mediaAction)),
    );
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
                  return Column(children: [
                    Stack(children: <Widget>[
                      _cameraWidget(),
                      _recordingDuration(),
                      _captureButton(),
                      _postSelectionWidget(),
                    ]),
                    _cameraOptions(),
                  ]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ))));
  }

  Widget _recordingDuration() {
    return Positioned(
        top: 100,
        width: MediaQuery.of(context).size.width,
        child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 500),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            sizeCurve: Curves.easeInOut,
            firstChild: Center(
                child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width * .70,
                      child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Colors.amber[600]!),
                          value: progress))),
            )),
            secondChild: Center(),
            crossFadeState: isRecording
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond));
  }

  Widget _captureButton() {
    return Positioned(
      bottom: 0,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Constants.noFlashIconOutline,
                    height: 35,
                    width: 35,
                    color: Colors.white,
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstCurve: Curves.easeInOut,
                    secondCurve: Curves.easeInOut,
                    sizeCurve: Curves.easeInOut,
                    firstChild: _recordingAnimation(),
                    secondChild: _captureVector(),
                    crossFadeState: isRecording
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  SvgPicture.asset(
                    Constants.filterIconOutline,
                    height: 30,
                    width: 30,
                    color: Colors.white,
                  )
                ]),
            margin: EdgeInsets.fromLTRB(1, 5, 1, 40),
          )),
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _captureVector() {
    return GestureDetector(
      child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.4)),
          child: SvgPicture.asset(
            Constants.recordingIcon,
            height: 70,
            width: 70,
          )),
      onTap: () {
        _takePicture();
      },
      onTapDown: (TapDownDetails details) {
        _startVideoRecording();
      },
      onTapUp: (TapUpDetails details) {
        _stopVideoRecording();
      },
    );
  }

  Widget _recordingAnimation() {
    return SizedBox(
        height: 150.0,
        width: 150.0,
        child: FlareActor(Constants.recordingAnimation,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "record"));
  }

  Widget _cameraOptions() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                    onTap: () {
                      _openGallery();
                    },
                    child: ClipRRect(
                      child: SizedBox(
                          width: 45,
                          height: 45,
                          child: FutureBuilder<File?>(
                              future: _isTthumbnailInitialzed
                                  ? _initializeThumbnailFuture
                                  : null,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.data == null) {
                                    return Center();
                                  } else {
                                    return Image.file(snapshot.data as File);
                                  }
                                } else if (snapshot.hasError) {
                                  return Center(); // error
                                } else {
                                  return CircularProgressIndicator(); // loading
                                }
                              })),
                      borderRadius: BorderRadius.circular(7),
                    ))),
            Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(CupertinoIcons.camera_rotate),
                    onPressed: () {
                      if (isCameraFront) {
                        _initializeCameraController();
                      } else {
                        _initializeFrontCamera();
                      }
                    }))
          ],
        )); //;
  }

  Widget _cameraWidget() {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .85,
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

  Widget _postSelectionWidget() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 25,
            width: 100,
            margin: EdgeInsets.all(35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor),
            child: CarouselSlider.builder(
                itemCount: mediaOptions.length,
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: false,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  height: MediaQuery.of(context).size.height,
                  onPageChanged: (i, v) => setState(() {}),
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        mediaOptions[itemIndex],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ));
                })));
  }
}

class AssetModel {
  final dynamic file;
  AssetModel({required this.file});
}
