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
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/asset_image_fullscreen.dart';
import 'package:frienderr/features/presentation/widgets/asset_video_fullscreen.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/presentation/widgets/gallery.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

const mediaOptions = ['Posts', 'Stories', 'Quicks'];

class CameraScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final CameraSelectionMode mode;

  CameraScreen({Key? key, required this.mode, required this.blocGroup})
      : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  double progress = 0;
  late File thumbnail;
  bool isRecording = false;
  late Timer recordingTimer;
  int currentTimelineIndex = 0;
  bool _isThumbnailInitialzed = false;
  late CameraSelectionMode _cameraMode;

  late Future<File?> _initializeThumbnailFuture;
  CameraBloc get _cameraBloc => widget.blocGroup.cameraBloc;
  late CameraFeatures _cameraFeatures = CameraFeatures.idle;

  bool get isStory {
    return _cameraMode == CameraSelectionMode.story;
  }

  bool get isPost {
    return _cameraMode == CameraSelectionMode.post;
  }

  bool get isQuick {
    return _cameraMode == CameraSelectionMode.quick;
  }

  bool get isMultiSelect {
    return _cameraFeatures == CameraFeatures.mutliselect;
  }

  @override
  void initState() {
    _cameraMode = widget.mode;

    _cameraBloc.add(CameraEvent.initializeCamera());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchAssetThumbnail();
    });
    super.initState();
  }

  @override
  void dispose() {
    _cameraBloc.add(CameraEvent.disposeCamera());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
      _isThumbnailInitialzed = true;
    });

    return file;
  }

  void _initializeDuration() async {
    final _timer = new Timer.periodic(
      Duration(milliseconds: 100),
      (Timer _timer) => setState(
        () {
          progress = _timer.tick / 1000;
        },
      ),
    );

    setState(() {
      recordingTimer = _timer;
    });
  }

  Future<void> _displayPhotoMediaTaken(Future<File?> file) async {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AssetImageFullscreen(file: file);
        });
  }

  Future<void> _displayVideoMediaTaken(Future<File?> file) async {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AssetVideoFullscreen(file: file);
        });
  }

  void _startVideoRecording(CameraController controller) async {
    this.setState(() {
      isRecording = true;
    });
    _initializeDuration();
    controller.startVideoRecording();
  }

  void _stopVideoRecording(CameraController controller) async {
    this.setState(() {
      isRecording = false;
    });
    recordingTimer.cancel();
    final XFile file = await controller.stopVideoRecording();

    final futureFile = Future(() => File(file.path));
    _displayVideoMediaTaken(futureFile);
  }

  void _takePicture(CameraController controller) async {
    try {
      final image = await controller.takePicture();

      final futureFile = Future(() => File(image.path));
      _displayPhotoMediaTaken(futureFile);
      return;
    } catch (e) {
      print(e);
    }
  }

  void _openGallery() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => Gallery(
                cameraMode: _cameraMode, blocGroup: widget.blocGroup))));
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<CameraBloc, CameraState>(
        listenWhen: (CameraState prevState, CameraState currentState) {
          return true;
        },
        listener: (BuildContext context, CameraState state) {
          if (state.action == CameraListenableAction.flashToggledOn ||
              state.action == CameraListenableAction.flashToggledOff) {
            setState(() {});
          }
        },
        builder: (BuildContext context, CameraState state) {
          switch (state.currentState) {
            case CameraStatus.initializing:
              return _cameraInitializing();
            case CameraStatus.error:
              return _cameraError();
            case CameraStatus.initialized:
              return _cameraInitialized(state);

            default:
              return Center();
          }
        },
        bloc: _cameraBloc,
      ),
    ));
  }

  Widget _cameraInitialized(CameraState state) {
    final CameraController _controller = state.controller as CameraController;

    return Column(children: [
      Stack(children: <Widget>[
        _cameraWidget(_controller),
        _cameraFeatureList(_controller),
        _cameraModes(_controller),
        _recordingDuration(),
        _captureButton(_controller),
        _headerWidget(_controller),
        _cameraOptions(_controller),
      ]),
    ]);
  }

  Widget _cameraInitializing() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _cameraError() {
    return Center(child: Text('Could not initialize camera!'));
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

  Widget _cameraModes(CameraController controller) {
    return Positioned(
        top: MediaQuery.of(context).size.height * .40,
        left: 20,
        child: Column(children: [_postMode(), _storyMode(), _quickMode()]));
  }

  Widget _cameraFeatureList(CameraController controller) {
    return Positioned(
        top: MediaQuery.of(context).size.height * .20,
        right: 20,
        child: Column(children: [
          GestureDetector(
            child: Padding(
              child: Row(children: [
                AnimatedContainer(
                    height: 45,
                    curve: Curves.bounceOut,
                    padding: const EdgeInsets.all(7),
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isMultiSelect
                          ? Colors.white.withOpacity(0.8)
                          : Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      Constants.multiSelectIcon,
                      width: 35,
                      height: 35,
                      color: isMultiSelect ? Colors.grey[800] : Colors.white,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text('Multiselect',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold)))
              ]),
              padding: const EdgeInsets.only(top: 30),
            ),
            onTap: () =>
                setState(() => _cameraFeatures = CameraFeatures.mutliselect),
          ),
          GestureDetector(
            child: Padding(
              child: Row(children: [
                AnimatedContainer(
                    height: 45,
                    curve: Curves.bounceOut,
                    padding: const EdgeInsets.all(7),
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isMultiSelect
                          ? Colors.white.withOpacity(0.8)
                          : Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      Constants.filterIconOutline,
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text('Filters',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold)))
              ]),
              padding: const EdgeInsets.only(top: 30),
            ),
            onTap: () =>
                setState(() => _cameraFeatures = CameraFeatures.mutliselect),
          ),
        ]));
  }

  Widget _postMode() {
    return GestureDetector(
      child: Padding(
        child: AnimatedContainer(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isPost ? Colors.white.withOpacity(0.8) : Colors.transparent,
          ),
          child: Row(children: [
            SvgPicture.asset(
              Constants.postIcon,
              width: 35,
              height: 35,
              color: isPost ? Colors.grey[600] : Colors.white,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Text('Post',
                    style: TextStyle(
                      fontSize: 18,
                      color: isPost ? Colors.grey[800] : Colors.white,
                    )))
          ]),
          curve: Curves.bounceOut,
          padding: const EdgeInsets.all(7),
          duration: const Duration(milliseconds: 100),
        ),
        padding: const EdgeInsets.only(top: 30),
      ),
      onTap: () => setState(() => _cameraMode = CameraSelectionMode.post),
    );
  }

  Widget _storyMode() {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AnimatedContainer(
              height: 45,
              curve: Curves.bounceOut,
              padding: const EdgeInsets.all(7),
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: isStory
                      ? Colors.white.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(children: [
                SvgPicture.asset(
                  Constants.storyIcon,
                  width: 35,
                  height: 35,
                  color: isStory ? Colors.grey[600] : Colors.white,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text('Story',
                        style: TextStyle(
                          color: isStory ? Colors.grey[800] : Colors.white,
                          fontSize: 18,
                        )))
              ]))),
      onTap: () => setState(() => _cameraMode = CameraSelectionMode.story),
    );
  }

  Widget _quickMode() {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AnimatedContainer(
              height: 45,
              curve: Curves.bounceOut,
              padding: const EdgeInsets.all(7),
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: isQuick
                      ? Colors.white.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(children: [
                SvgPicture.asset(
                  Constants.quickIcon,
                  width: 35,
                  height: 35,
                  color: isQuick ? Colors.grey[600] : Colors.white,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Snap',
                        style: TextStyle(
                          fontSize: 18,
                          color: isQuick ? Colors.grey[800] : Colors.white,
                        )))
              ])),
        ),
        onTap: () => setState(() => _cameraMode = CameraSelectionMode.quick));
  }

  Widget _captureButton(CameraController controller) {
    return Positioned(
      bottom: 10,
      child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstCurve: Curves.easeInOut,
                    secondCurve: Curves.easeInOut,
                    sizeCurve: Curves.easeInOut,
                    firstChild: _recordingAnimation(),
                    secondChild: _captureVector(controller),
                    crossFadeState: isRecording
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  Center()
                ]),
            margin: EdgeInsets.fromLTRB(1, 5, 1, 40),
          )),
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _captureVector(CameraController controller) {
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
        _takePicture(controller);
      },
      onTapDown: (TapDownDetails details) {
        _startVideoRecording(controller);
      },
      onTapUp: (TapUpDetails details) {
        _stopVideoRecording(controller);
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

  Widget _cameraOptions(CameraController controller) {
    return Positioned(
        bottom: 15,
        child: SizedBox(
            // height: MediaQuery.of(context).size.height * .12,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _galleryPreviewDisplay(),
                    _changeLensButton(controller)
                  ],
                )))); //;
  }

  Widget _galleryPreviewDisplay() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: GestureDetector(
            onTap: () {
              _openGallery();
            },
            child: ClipRRect(
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(
                    //  width: 2,
                    //  color: Colors.white,
                    // )),
                  ),
                  child: FutureBuilder<File?>(
                      future: _isThumbnailInitialzed
                          ? _initializeThumbnailFuture
                          : null,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data == null) {
                            return Center();
                          } else {
                            return Image.file(snapshot.data as File);
                          }
                        } else if (snapshot.hasError) {
                          return Center(); // error
                        } else {
                          return Center(); // loading
                        }
                      })),
              borderRadius: BorderRadius.circular(15),
            )));
  }

  Widget _changeLensButton(CameraController controller) {
    return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .75),
        child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                iconSize: 30,
                icon: Icon(CupertinoIcons.camera_rotate),
                onPressed: () {
                  if (controller.description.lensDirection ==
                      CameraLensDirection.front) {
                    _cameraBloc.add(CameraEvent.changeLens(
                        direction: CameraLensDirection.back));
                  } else if (controller.description.lensDirection ==
                      CameraLensDirection.back) {
                    _cameraBloc.add(CameraEvent.changeLens(
                        direction: CameraLensDirection.front));
                  }
                })));
  }

  Widget _cameraWidget(CameraController controller) {
    return Container(
        //margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 50,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: CameraPreview(controller),
            )));
  }

  Widget _headerWidget(CameraController controller) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    onPressed: () => Navigator.pop(context),
                  ),
                  ConditionalRenderDelegate(
                    condition: controller.value.flashMode == FlashMode.off,
                    renderWidget: IconButton(
                      icon: Icon(Icons.flash_off),
                      iconSize: 35,
                      onPressed: () => _cameraBloc.add(
                          CameraEvent.changeFlashMode(mode: FlashMode.torch)),
                    ),
                    fallbackWidget: IconButton(
                      icon: Icon(Icons.flash_on),
                      iconSize: 35,
                      onPressed: () => _cameraBloc.add(
                          CameraEvent.changeFlashMode(mode: FlashMode.off)),
                    ),
                  )
                ])));
  }
}
