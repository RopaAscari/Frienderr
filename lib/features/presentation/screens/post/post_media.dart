import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class PostMediaScreen extends StatefulWidget {
  const PostMediaScreen({
    Key? key,
    required this.posts,
    required this.postBloc,
    // required this.timelineBloc,
  }) : super(key: key);

  final PostBloc postBloc;
  final List<GalleryAsset> posts;
  // final TimelineBloc timelineBloc;

  @override
  _PostMediaScreenState createState() => _PostMediaScreenState();
}

class _PostMediaScreenState extends State<PostMediaScreen> {
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
                body: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Column(children: [
                    _headerWidget(),
                    _imageSlider(),
                    _captionFieldWidget(),
                    // _captionFieldWidget_switchTileWidget(),
                    _postButton(),
                    _loadingWidget()
                  ]),
                ))));
  }

  Widget _loadingWidget() {
    return isPosting
        ? Container(
            margin: const EdgeInsets.only(top: 100),
            child: const CupertinoActivityIndicator())
        : const Center();
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
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.only(top: 30, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back,
                    size: ResponsiveFlutter.of(context).fontSize(2.5)),
                onPressed: () => Navigator.pop(context)),
            Text(
              'New Post',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.5)),
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
                          condition: _posts[index].type == AssetType.image,
                          renderWidget: Image.file(_posts[index].asset,
                              fit: BoxFit.cover),
                          fallbackWidget: Image.memory(
                              _posts[index].thumbnail ?? Uint8List(0),
                              fit: BoxFit.cover))),
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
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13.5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              hintText: ' Caption',
              contentPadding: const EdgeInsets.all(10)),
        ),
      ),
    );
  }

  Widget _postButton() {
    return SizedBox(
        child: AppButton(
          label: "Post",
          isLoading: false,
          onPressed: _post,
          disabled: isPosting,
          margin: const EdgeInsets.only(top: 24),
        ),
        height: 70);
  }
}
