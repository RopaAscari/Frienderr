import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/widgets/display_media/display_media.dart';
import 'package:frienderr/widgets/display_selected_stories/display_selected_stories.dart';

class AssetThumbnail extends StatefulWidget {
  const AssetThumbnail(
      {Key? key,
      required this.asset,
      required this.index,
      required this.mediaAction,
      required this.isMutliSelecting,
      required this.fetchSelectedAssets,
      required this.currentSelectedIndex,
      required this.removeSelectedAssets})
      : super(key: key);

  final int index;
  final AssetEntity asset;
  final String mediaAction;
  final bool isMutliSelecting;
  final int currentSelectedIndex;
  final ValueSetter<dynamic> fetchSelectedAssets;
  final ValueSetter<dynamic> removeSelectedAssets;

  AssetThumbnailState createState() => AssetThumbnailState();
}

class AssetThumbnailState extends State<AssetThumbnail> {
  dynamic selectedAsset;
  int get index => widget.index;
  List<dynamic> selectedAssets = [];
  AssetEntity get asset => widget.asset;
  String get mediaAction => widget.mediaAction;
  bool get isMutliSelecting => widget.isMutliSelecting;
  int get currentSelectedIndex => widget.currentSelectedIndex;
  ValueSetter<dynamic> get fetchSelectedAssets => widget.fetchSelectedAssets;
  ValueSetter<dynamic> get removeSelectedAssets => widget.removeSelectedAssets;

  @override
  void didChangeDependencies() {
    print('IS MULISELCTED $isMutliSelecting');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Uint8List>(
      future: asset.thumbData as Future<Uint8List>,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return Center(child: CircularProgressIndicator());
        // If there's data, display it as an image
        return GestureDetector(
          onTap: () {
            if (isMutliSelecting) {
              if (selectedAsset != index) {
                setState(() {
                  selectedAsset = index;
                  fetchSelectedAssets({
                    'id': index,
                    'asset': asset,
                    'type': asset.type,
                  });
                });
              } else {
                setState(() {
                  selectedAsset = null;
                  removeSelectedAssets({
                    'id': index,
                    'asset': asset,
                    'type': asset.type,
                  });
                });
              }
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          mediaAction == Constants.postTypes[PostType.Post]
                              ? DisplayMedia(selectedAssets: [
                                  {
                                    'id': index,
                                    'asset': asset,
                                    'type': asset.type,
                                  }
                                ])
                              : DisplaySelectedStories(selectedAssets: [
                                  {
                                    'id': index,
                                    'asset': asset,
                                    'type': asset.type,
                                  }
                                ])));
            }
          },
          onLongPress: () {},
          child: Opacity(
              opacity: isMutliSelecting ? .8 : 1,
              child: Stack(children: [
                // Wrap the image in a Positioned.fill to fill the space
                Positioned.fill(child: Image.memory(bytes, fit: BoxFit.cover)),

                if (isMutliSelecting)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: selectedAsset != index
                            ? IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle,
                                  size: 30,
                                  color: Colors.grey[350],
                                ))
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                    height: 25,
                                    width: 25,
                                    /* child: Center(
                                        child: Text(
                                      '$currentSelectedIndex',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),*/
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100))),
                              )

                        /* IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check_circle_sharp,
                                  size: 30,
                                  color: Colors.orange[700],
                                ))*/
                        ),
                  ),
                // Display a Play icon if the asset is a video
                if (asset.type == AssetType.video)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ])),
        );
      },
    ));
  }
}
