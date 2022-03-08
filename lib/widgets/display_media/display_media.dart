import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/util/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/screens/post_media/post_media.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:frienderr/widgets/local_video_player/local_video_player.dart';

final helpers = new Helpers();

class DisplayMedia extends StatefulWidget {
  DisplayMedia({
    Key? key,
    required this.selectedAssets,
  }) : super(key: key);

  final List<dynamic> selectedAssets;

  DisplayMediaState createState() => DisplayMediaState();
}

class DisplayMediaState extends State<DisplayMedia> {
  int currentIndex = 0;
  int reRenderCount = 0;
  late UserState userState;
  bool isPreviewReady = false;
  late Map currentMediaItem = {};
  int currentAssetIndex = 1000;
  List<dynamic> selectedAssets = [];
  dynamic get selectedAssetS => widget.selectedAssets;

  @override
  initState() {
    setState(() {
      selectedAssets = selectedAssetS;
    });
    userState = context.read<UserBloc>().state;
    super.initState();
  }

  deleteAsset() {
    selectedAssets.removeAt(currentAssetIndex);
    this.setState(() {
      reRenderCount = reRenderCount + 1;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Center(
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                      headerWidget(),
                      Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: imagePreviewWidget()),
                      trashIcon()
                    ]))))));
  }

  Widget trashIcon() {
    if (selectedAssets.length != 1) {
      return Container(
          height: 55,
          width: 55,
          margin: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(40)),
          child: IconButton(
              onPressed: () => deleteAsset(),
              icon: Icon(Icons.delete,
                  size: 35, color: Theme.of(context).canvasColor)));
    } else {
      return Center();
    }
  }

  Widget headerWidget() {
    final UserModel user = BlocProvider.of<UserBloc>(context).state.user;
    return Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text('Cancel',
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.5))),
            ),
            GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => PostMedia(
                              user: user,
                              selectedAssets: selectedAssets,
                            ))),
                child: Text('Next',
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.5))))
          ],
        ));
  }

  Widget imagePreviewWidget() {
    return SizedBox(
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80, // constrain height
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: selectedAssets.length,
            itemBuilder: (_, int index) {
              final future = selectedAssets[index]['asset'].file;

              final isImage = selectedAssets[index]['type'] == AssetType.image;
              return FutureBuilder(
                  future: future,
                  builder: (BuildContext _, AsyncSnapshot<File> snapshot) {
                    final bytes = snapshot.data;

                    if (bytes == null)
                      return Center(child: CircularProgressIndicator());
                    return Container(
                        margin: const EdgeInsets.only(right: 25),
                        // width: MediaQuery.of(context).size.width,
                        child: isImage
                            ? GestureDetector(
                                onTap: () => this.setState(() {
                                      currentAssetIndex = index;
                                    }),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 3.0,
                                                style:
                                                    currentAssetIndex == index
                                                        ? BorderStyle.solid
                                                        : BorderStyle.none,
                                                color: Colors.amber.shade900),
                                            color: HexColor('#3F3F3F')
                                                .withOpacity(.4),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        height: 500,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.file(bytes))))
                            : GestureDetector(
                                onTap: () => this.setState(() {
                                      currentAssetIndex = index;
                                    }),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 3.0, style: currentAssetIndex == index ? BorderStyle.solid : BorderStyle.none, color: Colors.amber.shade700),
                                            //  color: Colors.black,
                                            borderRadius: BorderRadius.circular(25)),
                                        height: 500,
                                        width: MediaQuery.of(context).size.width,
                                        child: VideoPlayerScreen(
                                          video: bytes,
                                        )))));
                  });
            }));
  }
}
