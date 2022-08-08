import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/data/filters.dart';
import 'package:frienderr/core/services/filter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/screens/post/post_media.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/fliter_selector.dart';
import 'package:frienderr/features/presentation/widgets/local_video_player.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

final helpers = Helpers();

class PreviewPostScreen extends StatefulWidget {
  const PreviewPostScreen({
    Key? key,
    required this.postBloc,
    required this.selectedAssets,
  }) : super(key: key);

  final PostBloc postBloc;
  final List<GalleryAsset> selectedAssets;

  @override
  _PreviewPostScreenState createState() => _PreviewPostScreenState();
}

class _PreviewPostScreenState extends State<PreviewPostScreen> {
  int currentIndex = 0;
  int reRenderCount = 0;
  late UserState userState;
  bool isPreviewReady = false;

  late Map currentMediaItem = {};
  int currentAssetIndex = 1000;

  List<GalleryAsset> selectedAssets = [];
  Color currentFilter = Colors.transparent;
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
    setState(() {
      reRenderCount = reRenderCount + 1;
    });
  }

  void _navigateToPostMedia() async {
    try {
      /*final _assets =
          await Stream.fromIterable(selectedAssets).asyncMap((asset) async {
        final _filteredAsset = await FilterService.applyFilter(
            asset.asset, currentFilter, BlendMode.color);
        return GalleryAsset(
          id: asset.id,
          type: asset.type,
          asset: _filteredAsset,
          duration: asset.duration,
          thumbnail: asset.thumbnail,
        );
      }).toList();*/

      getService<AppRouter>().push(PostMediaRoute(
        posts: selectedAssets,
        postBloc: _postBloc,
      ));
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: Stack(children: [
              _imagePreviewWidget(),
              _headerWidget(),
              /* Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: FliterSelector<dynamic>(
                    filters: colorFilters,
                    onFilterChanged: (filter) => setState(() {
                      currentFilter = filter;
                    }),
                  ))*/
            ]))));
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
      return const Center();
    }
  }

  Widget _headerWidget() {
    return Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => getService<AppRouter>().pop(),
                icon: const Icon(Icons.close),
                iconSize: 30),
            MaterialButton(
                height: 31,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.white)),
                onPressed: () => _navigateToPostMedia(),
                child: Text('Next',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: const AdaptiveTextSize()
                            .getAdaptiveTextSize(context, 10))))
          ],
        ));
  }

  Widget _imagePreviewWidget() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height, // constrain height
        child: PageView.builder(
            itemCount: selectedAssets.length,
            onPageChanged: (i) => setState(() {
                  currentIndex = i;
                  // widget.quickBloc.add(QuickEvent.onSnapChange(index: i));
                }),
            itemBuilder: (BuildContext context, int index) {
              final file = selectedAssets[index].asset;

              final isAssetImage =
                  selectedAssets[index].type == AssetType.image;

              return GestureDetector(
                  onTap: () => setState(() {
                        currentAssetIndex = index;
                      }),
                  child: ConditionalRenderDelegate(
                      condition: isAssetImage,
                      renderWidget: _imageDisplay(file, index),
                      fallbackWidget: _videDisplay(file, index)));
            }));
  }

  Widget _videDisplay(File bytes, int index) {
    return BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            decoration: BoxDecoration(
                /*border: Border.all(
                    width: 3.0,
                    style: currentAssetIndex == index
                        ? BorderStyle.solid
                        : BorderStyle.none,
                    color: Colors.amber.shade700),*/
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
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            decoration: BoxDecoration(
                /*border: Border.all(
                    width: 3.0,
                    style: currentAssetIndex == index
                        ? BorderStyle.solid
                        : BorderStyle.none,
                    color: Colors.amber.shade900),*/
                color: Colors.black.withOpacity(.2),
                borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.file(
              bytes,
              color: currentFilter,
              colorBlendMode: BlendMode.color,
            )));
  }
}
