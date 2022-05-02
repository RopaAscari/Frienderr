import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/screens/post_media.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/widgets/local_video_player.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

final helpers = new Helpers();

class DisplayMedia extends StatefulWidget {
  DisplayMedia({
    Key? key,
    required this.postBloc,
    required this.selectedAssets,
  }) : super(key: key);

  final PostBloc postBloc;
  final List<GalleryAsset> selectedAssets;

  DisplayMediaState createState() => DisplayMediaState();
}

class DisplayMediaState extends State<DisplayMedia> {
  int currentIndex = 0;
  int reRenderCount = 0;
  late UserState userState;
  bool isPreviewReady = false;

  late Map currentMediaItem = {};
  int currentAssetIndex = 1000;
  List<GalleryAsset> selectedAssets = [];
  PostBloc get _postBloc => widget.postBloc;
  dynamic get selectedAssetS => widget.selectedAssets;

  @override
  initState() {
    setState(() {
      selectedAssets = selectedAssetS;
    });
    userState = context.read<UserBloc>().state;
    super.initState();
  }

  void _deleteAsset() {
    selectedAssets.removeAt(currentAssetIndex);
    this.setState(() {
      reRenderCount = reRenderCount + 1;
    });
  }

  void _navigateToPostMedia() {
    final UserModel user = BlocProvider.of<UserBloc>(context).state.user;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) => PostMedia(
                  postBloc: _postBloc,
                  posts: selectedAssets,
                )));
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                  _headerWidget(),
                  Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: _imagePreviewWidget()),
                  _trashIcon()
                ])))));
  }

  Widget _trashIcon() {
    if (selectedAssets.length != 1) {
      return GestureDetector(
          onTap: () => _deleteAsset(),
          child: Padding(
              child: Image.asset(
                Constants.trashIcon,
                width: 60,
                height: 60,
              ),
              padding: const EdgeInsets.only(top: 25)));
    } else {
      return Center();
    }
  }

  Widget _headerWidget() {
    return Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              height: 31,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.white)),
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',
                  style: TextStyle(
                      fontSize:
                          AdaptiveTextSize().getAdaptiveTextSize(context, 10))),
            ),
            MaterialButton(
                height: 31,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () => _navigateToPostMedia(),
                child: Text('Next',
                    style: TextStyle(
                        fontSize: AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10))))
          ],
        ));
  }

  Widget _imagePreviewWidget() {
    return SizedBox(
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80, // constrain height
        child: CarouselSlider.builder(
            itemCount: selectedAssets.length,
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: false,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              height: MediaQuery.of(context).size.height,
              onPageChanged: (i, v) => setState(() {
                currentIndex = i;
                // widget.quickBloc.add(QuickEvent.onSnapChange(index: i));
              }),
            ),
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              final future = selectedAssets[index].asset.file;

              final isAssetImage =
                  selectedAssets[index].type == AssetType.image;
              return FutureBuilder(
                  future: future,
                  builder: (BuildContext _, AsyncSnapshot<File?> snapshot) {
                    final bytes = snapshot.data;

                    if (bytes == null)
                      return Center(child: CircularProgressIndicator());
                    return Container(
                        margin: const EdgeInsets.only(right: 15, left: 15),
                        child: GestureDetector(
                            onTap: () => this.setState(() {
                                  currentAssetIndex = index;
                                }),
                            child: ConditionalRenderDelegate(
                                condition: isAssetImage,
                                renderWidget: _imageDisplay(bytes, index),
                                fallbackWidget: _videDisplay(bytes, index))));
                  });
            }));
  }

  Widget _videDisplay(File bytes, int index) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 3.0,
                    style: currentAssetIndex == index
                        ? BorderStyle.solid
                        : BorderStyle.none,
                    color: Colors.amber.shade700),
                //  color: Colors.black,
                borderRadius: BorderRadius.circular(25)),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: VideoPlayerScreen(
              video: bytes,
            )));
  }

  Widget _imageDisplay(File bytes, int index) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 3.0,
                    style: currentAssetIndex == index
                        ? BorderStyle.solid
                        : BorderStyle.none,
                    color: Colors.amber.shade900),
                color: HexColor('#3F3F3F').withOpacity(.2),
                borderRadius: BorderRadius.circular(10)),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Image.file(bytes)));
  }
}
