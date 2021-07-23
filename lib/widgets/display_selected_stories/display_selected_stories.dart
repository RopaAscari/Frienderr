import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/util/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/widgets/video_screen/video_screen.dart';

final helpers = new Helpers();

class DisplaySelectedStories extends StatefulWidget {
  DisplaySelectedStories({
    Key? key,
    required this.selectedAssets,
  }) : super(key: key);

  final List<dynamic> selectedAssets;

  DisplaySelectedStoriesState createState() => DisplaySelectedStoriesState();
}

class DisplaySelectedStoriesState extends State<DisplaySelectedStories> {
  int currentIndex = 0;
  bool isPreviewReady = false;
  late Map currentMediaItem = {};
  dynamic get selectedAssets => widget.selectedAssets;
  final CollectionReference story =
      FirebaseFirestore.instance.collection('stories');
  late UserState userState =
      Provider.of<UserBloc>(context, listen: false).state;

  @override
  initState() {
    getImageFromFuture();
    super.initState();
  }

  getImageFromFuture() async {
    selectedAssets[0]['asset'].file.then((value) {
      setState(() {
        currentMediaItem = {'file': value, 'type': selectedAssets[0]['type']};
        isPreviewReady = true;
      });
    });
  }

  selectAsset(dynamic asset, int index) {
    asset['asset'].file.then((value) {
      setState(() {
        currentIndex = index;
        currentMediaItem = {'file': value, 'type': asset['type']};
      });
    });
  }

  showActionSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.grey[700],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Uploading ',
                      style: TextStyle(fontSize: 20),
                    ),
                    CircularProgressIndicator()
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  determineStoryAction() async {
    List metadata = [];

    showActionSheet();

    final content =
        await Stream.fromIterable(selectedAssets).asyncMap((item) async {
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/stories/$timestamp');

      return item['asset'].file.then((value) async {
        if (item['type'] == AssetType.video) {}
        // print('value $value');
        await storageRef.putFile(
          value,
          SettableMetadata(
            contentType:
                item['type'] == AssetType.image ? 'image/jpg' : 'video/mp4',
          ),
        );

        final url = await storageRef.getDownloadURL();
        return {
          'id': helpers.generateId(25),
          'media': url,
          'views': [],
          'metadata': metadata,
          'dateCreated': DateTime.now().microsecondsSinceEpoch,
          'type': item['type'] == AssetType.image ? 'image' : 'video'
        };
      });
    }).toList();

    final shouldUpdate = await checkIfDocExists(userState.user.id);
    if (shouldUpdate) {
      updateStory(content);
    } else {
      final Map<String, dynamic> stories = {
        'id': userState.user.id,
        'content': content,
        'user': {
          'username': userState.user.username,
          'profilePic': userState.user.profilePic
        },
        'dateCreated': DateTime.now().microsecondsSinceEpoch,
      };
      postStory(stories);
    }
  }

  postStory(dynamic stories) async {
    try {
      await story.doc(userState.user.id).set(stories);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainTab(),
          ));
    } catch (err) {}
  }

  updateStory(dynamic content) async {
    try {
      await story
          .doc(userState.user.id)
          .update({'content': FieldValue.arrayUnion(content)});
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainTab(),
          ));
    } catch (err) {}
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await story.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            child: isPreviewReady
                ? currentMediaItem['type'] == AssetType.image
                    ? Image.file(currentMediaItem['file'])
                    : VideoScreen(
                        videoFile: currentMediaItem['file'],
                        shouldPlay: true,
                      )
                : Container()),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => determineStoryAction(),
                child: Container(
                    height: 35,
                    width: 65,
                    margin: const EdgeInsets.only(top: 25),
                    child: Center(
                        child: Text('Post',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: theme == Constants.darkTheme
                                    ? Colors.black
                                    : Colors.white))),
                    decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(20))))),
        Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context)))),
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Flex(direction: Axis.horizontal, children: [
                  new Expanded(
                      child: ListView.builder(
                          itemExtent: 90.0,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedAssets.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: currentIndex == index
                                              ? Colors.red
                                              : Colors.transparent,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: FutureBuilder<Uint8List>(
                                    future: selectedAssets[index]['asset']
                                        .thumbData as Future<Uint8List>,
                                    builder: (_, snapshot) {
                                      final bytes = snapshot.data;
                                      if (bytes == null) return Container();
                                      return GestureDetector(
                                          onTap: () {
                                            selectAsset(
                                                selectedAssets[index], index);
                                          },
                                          child: Image.memory(bytes,
                                              fit: BoxFit.cover));
                                    },
                                  ),
                                ),
                              ),
                            );
                          }))
                ])))
      ],
    ));
  }
}
