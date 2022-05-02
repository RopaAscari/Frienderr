import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';

final helpers = new Helpers();

class DisplaySelectedStories extends StatefulWidget {
  DisplaySelectedStories({
    Key? key,
    required this.storyBloc,
    required this.selectedAssets,
  }) : super(key: key);

  final StoryBloc storyBloc;
  final List<GalleryAsset> selectedAssets;

  DisplaySelectedStoriesState createState() => DisplaySelectedStoriesState();
}

class DisplaySelectedStoriesState extends State<DisplaySelectedStories> {
  int currentIndex = 0;
  bool isPreviewReady = false;
  late Map currentMediaItem = {};
  StoryBloc get _storyBloc => widget.storyBloc;
  List<GalleryAsset> get _selectedAssets => widget.selectedAssets;

  late UserState userState =
      Provider.of<UserBloc>(context, listen: false).state;

  @override
  initState() {
    _getImageFromFuture();
    super.initState();
  }

  Future<void> _getImageFromFuture() async {
    _selectedAssets[0].asset.file.then((value) {
      setState(() {
        currentMediaItem = {'file': value, 'type': _selectedAssets[0].type};
        isPreviewReady = true;
      });
    });
  }

  void _selectAsset(dynamic asset, int index) {
    asset['asset'].file.then((value) {
      setState(() {
        currentIndex = index;
        currentMediaItem = {'file': value, 'type': asset['type']};
      });
    });
  }

  void _determineStoryAction() {
    if (_storyBloc.state.stories.userStory.doesUserHaveStories) {
      _storyBloc.add(StoryEvent.updateStory(assets: _selectedAssets));
    } else {
      _storyBloc.add(StoryEvent.createStory(assets: _selectedAssets));
    }
  }
  /*determineStoryAction() async {
    List metadata = [];

    showActionSheet();

    final content =
        await Stream.fromIterable(selectedAssets).asyncMap((item) async {
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/stories/$timestamp');

      return item.asset.file.then((value) async {
        if (item.type == AssetType.video) {}
        // print('value $value');
        await storageRef.putFile(
          value as File,
          SettableMetadata(
            contentType:
                item.type == AssetType.image ? 'image/jpg' : 'video/mp4',
          ),
        );

        final url = await storageRef.getDownloadURL();
        return {
          'id': helpers.generateId(25),
          'media': url,
          'views': [],
          'metadata': metadata,
          'dateCreated': DateTime.now().microsecondsSinceEpoch,
          'type': item.type == AssetType.image ? 'image' : 'video'
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
            builder: (context) => Center(),
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
            builder: (context) => Center(),
          ));
    } catch (err) {}
  }*/

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
                        video: currentMediaItem['file'],
                        // shouldPlay: true,
                      )
                : Container()),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => _determineStoryAction(),
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
                          itemCount: _selectedAssets.length,
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
                                  child: FutureBuilder<File?>(
                                    future: _selectedAssets[index].asset.file,
                                    builder: (_, snapshot) {
                                      final bytes = snapshot.data;
                                      if (bytes == null) return Container();
                                      return GestureDetector(
                                          onTap: () {
                                            _selectAsset(
                                                _selectedAssets[index], index);
                                          },
                                          child: Image.file(bytes,
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
