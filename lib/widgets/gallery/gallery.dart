import 'package:frienderr/constants/constants.dart';
import 'package:frienderr/enums/enums.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/widgets/asset_thumbnail/asset_thumbnail.dart';
import 'package:frienderr/widgets/display_media/display_media.dart';
import 'package:frienderr/widgets/display_selected_stories/display_selected_stories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class Gallery extends StatefulWidget {
  final dynamic mediaAction;
  Gallery({Key? key, required this.mediaAction}) : super(key: key);

  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  dynamic get mediaAction => widget.mediaAction;
  // This will hold all the assets we fetched
  List<AssetEntity> assets = [];
  bool isMutliSelecting = false;
  List<dynamic> selectedAssets = [];
  @override
  void initState() {
    fetchAssets();
    super.initState();
  }

  fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);

    if (albums.length == 0) return;

    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI

    setState(() => assets = recentAssets);
  }

  fetchSelectedAssets(dynamic assets) {
    selectedAssets.add(assets);
  }

  removeSelectedAssets(dynamic assets) {
    selectedAssets.removeWhere((element) => element['id'] == assets['id']);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: <Widget>[
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // A grid view with 3 items per row
            crossAxisCount: 3,
          ),
          itemCount: assets.length,
          itemBuilder: (_, index) {
            return AssetThumbnail(
                index: index,
                asset: assets[index],
                mediaAction: mediaAction,
                currentSelectedIndex: selectedAssets
                    .indexWhere((asset) => asset['id'] == assets[index].id),
                isMutliSelecting: isMutliSelecting,
                fetchSelectedAssets: fetchSelectedAssets,
                removeSelectedAssets: removeSelectedAssets);
          },
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: FloatingActionButton(
                      heroTag: null,
                      backgroundColor: HexColor('#EE6115'),
                      child: Icon(Icons.photo_library_outlined,
                          size: 30, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          isMutliSelecting = !isMutliSelecting;
                        });
                      },
                    )))),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: FloatingActionButton(
                      disabledElevation: 10,
                      heroTag: null,
                      backgroundColor: selectedAssets.length == 0
                          ? HexColor('#EE6115').withOpacity(0.5)
                          : HexColor('#EE6115'),
                      child: Icon(Icons.arrow_forward,
                          size: 30,
                          color: selectedAssets.length == 0
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white),
                      onPressed: () => selectedAssets.length == 0
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => mediaAction ==
                                          Constants.postTypes[PostType.Post]
                                      ? DisplayMedia(
                                          selectedAssets: selectedAssets)
                                      : DisplaySelectedStories(
                                          selectedAssets: selectedAssets)),
                            ),
                    )))),
      ],
    )));
  }
}
