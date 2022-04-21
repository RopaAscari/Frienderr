import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cached_network_image/cached_network_image.dart';

class PostMedia extends StatefulWidget {
  PostMedia({
    Key? key,
    required this.user,
    required this.selectedAssets,
  }) : super(key: key);

  final UserModel user;
  final List<dynamic> selectedAssets;

  PostMediaState createState() => PostMediaState();
}

class PostMediaState extends State<PostMedia> {
  bool isPrivate = false;
  bool isPosting = false;
  UserModel get user => widget.user;
  dynamic get selectedAssets => widget.selectedAssets;
  final TextEditingController caption = TextEditingController();
  final CollectionReference post =
      FirebaseFirestore.instance.collection('posts');
  @override
  initState() {
    super.initState();
  }

  toggleStoryPosting() {
    setState(() {
      isPosting = !isPosting;
    });
    FocusScope.of(context).unfocus();
  }

  postStory() async {
    toggleStoryPosting();
    final dir = await path_provider.getTemporaryDirectory();

    String thumb = '';
    List metadata = [];

    final content =
        await Stream.fromIterable(selectedAssets).asyncMap((item) async {
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/posts/$timestamp');

      final Reference thumbnailRef =
          FirebaseStorage.instance.ref().child('/thumbnail/$timestamp');
      final targetPath = dir.absolute.path + "/temp.jpg";
      return item['asset'].file.then((File value) async {
        var fileClone;
        /* final result = await FlutterImageCompress.compressAndGetFile(
          value.absolute.path,
          targetPath,
          quality: 30,
          rotate: 0,
        );*/
        // if (result == null) {
        fileClone = value;
        //  } else {
        //  fileClone = result;
        //  }

        await storageRef.putFile(
          fileClone,
          SettableMetadata(
            contentType:
                item['type'] == AssetType.image ? 'image/jpg' : 'video/mp4',
          ),
        );

        final url = await storageRef.getDownloadURL();

        if (item['type'] == AssetType.video) {
          /* If  String thumbs = await thumbanils.Thumbnails.getThumbnail(
              // reates the specified path if it doesnt exist
              videoFile: value.path,
              imageType: thumbanils.ThumbFormat.PNG,
              quality: 30);*/

          //  final File file = await new File(thumbs).create(recursive: true);

          /* await thumbnailRef.putFile(
            file,
            SettableMetadata(
              contentType: 'image/jpg',
            ),
          );*/

          thumb = await thumbnailRef.getDownloadURL();

          return {
            'media': url,
            'thumbnail': thumb,
            'metadata': metadata,
            'type': item['type'] == AssetType.image ? 'image' : 'video'
          };
        }

        return {
          'media': url,
          'thumbnail': thumb,
          'metadata': metadata,
          'type': item['type'] == AssetType.image ? 'image' : 'video'
        };
      });
    }).toList();

    print('USERNAME ${user.id}');

    final Map<String, dynamic> posts = {
      'id': Helpers().generateId(25),
      'likes': 0,
      'commentCount': 0,
      'userLikes': [],
      'shares': 0,
      'content': content,
      'caption': caption.text,
      'user': {
        'id': user.id,
        'username': user.username,
        'profilePic': user.profilePic
      },
      'dateCreated': DateTime.now().microsecondsSinceEpoch,
    };

    try {
      await post.doc(posts['id']).set(posts);

      await FirebaseFirestore.instance
          .collection('postCount')
          .doc('count')
          .update({'count': FieldValue.increment(1)});

      toggleStoryPosting();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Center(),
          ));
    } catch (err) {
      toggleStoryPosting();
    }
  }

  @override
  Widget build(BuildContext _) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Column(children: [
                  headerWidget(),
                  imageSlider(),
                  captionFieldWidget(),
                  switchTileWidget(),
                  postOptionsWidget(),
                  loadingWidget()
                ]))));
  }

  Widget loadingWidget() {
    return isPosting
        ? Container(
            margin: const EdgeInsets.only(top: 100),
            child: CupertinoActivityIndicator())
        : Center();
  }

  Widget switchTileWidget() {
    return Padding(
        padding: const EdgeInsets.all(15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Private post',
            style: TextStyle(
                fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
          ),
          CupertinoSwitch(
            value: isPrivate,
            onChanged: (value) {
              setState(() {
                isPrivate = value;
              });
            },
          ),
        ]));
  }

  Widget headerWidget() {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 30, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    size: AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
                onPressed: () => Navigator.pop(context)),
            Text(
              'New Post',
              style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
            )
          ],
        ));
  }

  Widget imageSlider() {
    return SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: selectedAssets.length,
            itemBuilder: (context, index) {
              return Container(
                height: 40,
                width: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Card(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.amber.shade900, width: 1.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: FutureBuilder<Uint8List>(
                      future: selectedAssets[index]['asset'].thumbData
                          as Future<Uint8List>,
                      builder: (_, snapshot) {
                        final bytes = snapshot.data;
                        if (bytes == null) return Container();
                        return Image.memory(bytes, fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
              );
            }));
  }

  Widget captionFieldWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          style: TextStyle(
              fontSize: AdaptiveTextSize().getAdaptiveTextSize(context, 10)),
          controller: caption,
          maxLines: 7,
          decoration: new InputDecoration(
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintText: ' Caption',
              contentPadding: const EdgeInsets.all(10)),
        ),
      ),
    );
  }

  Widget postOptionsWidget() {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => isPosting ? null : postStory(),
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 20,
              margin: const EdgeInsets.only(top: 5),
              child: Center(
                  child: Text('Post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: theme == Constants.darkTheme
                              ? Colors.black
                              : Colors.white))),
              decoration: BoxDecoration(
                  color: isPosting
                      ? Theme.of(context).buttonColor.withOpacity(0.6)
                      : Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(5)))),
    );
  }
}
