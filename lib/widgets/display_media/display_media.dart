import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/util/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/widgets/video_screen/video_screen.dart';

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
  late UserState userState;
  bool isPreviewReady = false;
  late Map currentMediaItem = {};
  dynamic get selectedAssets => widget.selectedAssets;
  final TextEditingController caption = TextEditingController();
  final CollectionReference post =
      FirebaseFirestore.instance.collection('posts');
  @override
  initState() {
    userState = context.read<UserBloc>().state;
    super.initState();
  }

  showActionSheet() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[CupertinoActivityIndicator()],
            ),
          ),
        );
      },
    );
  }

  postStory() async {
    List metadata = [];

    showActionSheet();

    final content =
        await Stream.fromIterable(selectedAssets).asyncMap((item) async {
      final timestamp = DateTime.now().microsecondsSinceEpoch.toString();

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('/posts/$timestamp');

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
          'media': url,
          'metadata': metadata,
          'type': item['type'] == AssetType.image ? 'image' : 'video'
        };
      });
    }).toList();

    final Map<String, dynamic> posts = {
      'id': helpers.generateId(25),
      'likes': 0,
      'commentCount': 0,
      'userLikes': [],
      'shares': 0,
      'content': content,
      'caption': caption.text,
      'user': {
        'id': userState.user.id,
        'username': userState.user.username,
        'profilePic': userState.user.profilePic
      },
      'dateCreated': DateTime.now().microsecondsSinceEpoch,
    };

    try {
      await post.doc(posts['id']).set(posts);
      await FirebaseFirestore.instance
          .collection('postCount')
          .doc('count')
          .update({'count': FieldValue.increment(1)});
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainTab(),
          ));
    } catch (err) {}
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  imagePreviewWidget(),
                  captionFieldWidget(),
                  postOptionsWidget(),
                ])));
  }

  Widget imagePreviewWidget() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .70, // constrain height
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: selectedAssets.length,
            itemBuilder: (_, int index) {
              final future = selectedAssets[index]['asset'].file;
              final isImage = selectedAssets[index]['type'] == AssetType.image;
              return FutureBuilder(
                  future: future,
                  builder: (BuildContext _, AsyncSnapshot snapshot) {
                    final bytes = snapshot.data;
                    if (bytes == null)
                      return Center(child: CircularProgressIndicator());
                    return Container(
                        margin: const EdgeInsets.only(right: 25),
                        // width: MediaQuery.of(context).size.width,
                        child: isImage
                            ? FittedBox(
                                child: Image.file(bytes),
                                fit: BoxFit.cover,
                              )
                            : VideoScreen(
                                videoFile: bytes,
                                shouldPlay: true,
                              ));
                  });
            }));
  }

  Widget captionFieldWidget() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: caption,
          maxLines: 5,
          decoration: InputDecoration.collapsed(
            hintText: "Enter a caption",
          ),
        ),
      )),
    );
  }

  Widget postOptionsWidget() {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;

    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  showActionSheet();
                  //  postStory();
                },
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
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(5)))),
          ],
        ));
  }
}
