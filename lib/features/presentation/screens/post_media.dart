import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';

class PostMedia extends StatefulWidget {
  PostMedia({
    Key? key,
    required this.posts,
    required this.postBloc,
    // required this.timelineBloc,
  }) : super(key: key);

  final PostBloc postBloc;
  final List<GalleryAsset> posts;
  // final TimelineBloc timelineBloc;

  PostMediaState createState() => PostMediaState();
}

class PostMediaState extends State<PostMedia> {
  bool isPrivate = false;
  bool isPosting = false;
  PostBloc get _postBloc => widget.postBloc;
  List<GalleryAsset> get _posts => widget.posts;
  final TextEditingController caption = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  void _post() async {
    _postBloc.add(PostEvent.createPost(caption: caption.text, assets: _posts));
  }

  @override
  Widget build(BuildContext _) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Column(children: [
                  _headerWidget(),
                  _imageSlider(),
                  _captionFieldWidget(),
                  _switchTileWidget(),
                  _postOptionsWidget(),
                  _loadingWidget()
                ]))));
  }

  Widget _loadingWidget() {
    return isPosting
        ? Container(
            margin: const EdgeInsets.only(top: 100),
            child: CupertinoActivityIndicator())
        : Center();
  }

  Widget _switchTileWidget() {
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

  Widget _headerWidget() {
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

  Widget _imageSlider() {
    return SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _posts.length,
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
                      child: ConditionalRenderDelegate(
                        condition: _posts[index].asset.type == AssetType.image,
                        renderWidget: FutureBuilder<File?>(
                          future: _posts[index].asset.file,
                          builder: (_, snapshot) {
                            final file = snapshot.data;
                            if (file == null) return Container();
                            return Image.file(file, fit: BoxFit.cover);
                          },
                        ),
                        fallbackWidget: FutureBuilder<Uint8List?>(
                          future: _posts[index].asset.thumbnailData,
                          builder: (_, snapshot) {
                            final bytes = snapshot.data;
                            if (bytes == null) return Container();
                            return Image.memory(bytes, fit: BoxFit.cover);
                          },
                        ),
                      )),
                ),
              );
            }));
  }

  Widget _captionFieldWidget() {
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

  Widget _postOptionsWidget() {
    final theme = BlocProvider.of<ThemeBloc>(context).state.theme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => _post(),
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
