import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:frienderr/core/data/filters.dart';
import 'package:frienderr/features/presentation/widgets/fliter_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';

class DeepArCamera extends StatefulWidget {
  final CameraDeepArController controller;
  const DeepArCamera({Key? key, required this.controller}) : super(key: key);

  @override
  _DeepArCameraState createState() => _DeepArCameraState();
}

class _DeepArCameraState extends State<DeepArCamera> {
  int currentEffect = 0;
  bool isRecording = false;
  CameraMode cameraMode = CameraMode.filter;
  DisplayMode displayMode = DisplayMode.camera;

  CameraDeepArController get deepArController => widget.controller;

  List get effectList {
    switch (cameraMode) {
      case CameraMode.mask:
        return masks;

      case CameraMode.effect:
        return effects;

      case CameraMode.filter:
        return filters;

      default:
        return masks;
    }
  }

  List masks = [
    "none",
    "assets/deep_ar/aviators",
    "assets/deep_ar/bigmouth",
    "assets/deep_ar/lion",
    "assets/deep_ar/dalmatian",
    "assets/deep_ar/bcgseg",
    "assets/deep_ar/look2",
    "assets/deep_ar/fatify",
    "assets/deep_ar/flowers",
    "assets/deep_ar/grumpycat",
    "assets/deep_ar/koala",
    "assets/deep_ar/mudmask",
    "assets/deep_ar/obama",
    "assets/deep_ar/pug",
    "assets/deep_ar/slash",
    "assets/deep_ar/sleepingmask",
    "assets/deep_ar/smallface",
    "assets/deep_ar/teddycigar",
    "assets/deep_ar/tripleface",
    "assets/deep_ar/twistedface",
  ];
  List effects = [
    "none",
    "assets/deep_ar/fire",
    "assets/deep_ar/heart",
    "assets/deep_ar/blizzard",
    "assets/deep_ar/rain",
  ];
  List filters = [
    "none",
    "assets/deep_ar/drawingmanga",
    "assets/deep_ar/sepia",
    "assets/deep_ar/bleachbypass",
    "assets/deep_ar/realvhs",
    "assets/deep_ar/filmcolorperfection"
  ];

  @override
  void initState() {
    super.initState();
    CameraDeepArController.checkPermissions();
    deepArController.setEventHandler(DeepArEventHandler(onCameraReady: (v) {
      setState(() {});
    }, onSnapPhotoCompleted: (v) {
      setState(() {});
    }, onVideoRecordingComplete: (v) {
      setState(() {});
    }, onSwitchEffect: (v) {
      setState(() {});
    }));
  }

  @override
  void dispose() {
    //deepArController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DeepArPreview(deepArController),
      Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 50.0,
          child: FliterSelector<dynamic>(
              filters: maskFilters,
              onFilterChanged: (filter) async {
                if (!deepArController.value.isInitialized) return;
                // currentEffect = filter;
                deepArController.switchEffect(cameraMode, filter);
                setState(() {});
              }))
    ]);
  }
}
