import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/data/filters.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/filter.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/widgets/fliter_selector.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class PreviewStoryScreen extends StatefulWidget {
  PreviewStoryScreen({
    Key? key,
    required this.storyBloc,
    required this.selectedAssets,
  }) : super(key: key);

  final StoryBloc storyBloc;
  final List<GalleryAsset> selectedAssets;

  @override
  _PreviewStoryScreenState createState() => _PreviewStoryScreenState();
}

class _PreviewStoryScreenState extends State<PreviewStoryScreen> {
  int currentIndex = 0;
  bool isPreviewReady = false;
  late GalleryAsset currentMediaItem;
  Color currentFilter = Colors.transparent;
  StoryBloc get _storyBloc => widget.storyBloc;

  final User? _user = FirebaseAuth.instance.currentUser;
  List<GalleryAsset> get _selectedAssets => widget.selectedAssets;

  late UserState userState =
      Provider.of<UserBloc>(context, listen: false).state;

  @override
  initState() {
    _initalizeFirstStory();
    super.initState();
  }

  Future<void> _initalizeFirstStory() async {
    setState(() {
      currentMediaItem = _selectedAssets.first;
    });
  }

  void _selectAsset(GalleryAsset asset, int index) {
    setState(() {
      currentIndex = index;
      currentMediaItem = asset;
    });
  }

  void _determineStoryAction() async {
    getIt<AppRouter>().context.showLoadingIndicator();
    final _assets =
        await Stream.fromIterable(_selectedAssets).asyncMap((asset) async {
      final _filteredAsset = await FilterService.applyFilter(
          asset.asset, currentFilter, BlendMode.color);
      return GalleryAsset(
        id: asset.id,
        type: asset.type,
        asset: _filteredAsset,
        duration: asset.duration,
        thumbnail: asset.thumbnail,
      );
    }).toList();

    if (_storyBloc.state.stories.userStory.doesUserHaveStories) {
      _storyBloc
          .add(StoryEvent.updateStory(userId: _user!.uid, assets: _assets));
    } else {
      _storyBloc.add(StoryEvent.createStory(assets: _assets));
    }

    getIt<AppRouter>().context.dismissLoadingIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        _storyDisplay(),
        _postButton(),
        _backButton(),
        _storyImageList(),
        _filterSelector()
      ],
    )));
  }

  Widget _backButton() {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context))));
  }

  Widget _storyImageList() {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: ListView.builder(
                      itemExtent: 90.0,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedAssets.length,
                      itemBuilder: (context, index) {
                        return _miniItem(index);
                      }))
            ])));
  }

  Widget _miniItem(int index) {
    return Container(
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                        currentIndex == index ? Colors.red : Colors.transparent,
                    width: 2),
                borderRadius: BorderRadius.circular(5)),
            child: GestureDetector(
                onTap: () {
                  _selectAsset(_selectedAssets[index], index);
                },
                child: Image.file(
                  _selectedAssets[index].asset,
                  fit: BoxFit.cover,
                ))),
      ),
    );
  }

  Widget _storyDisplay() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ConditionalRenderDelegate(
          condition: currentMediaItem.type == AssetType.image,
          renderWidget: Image.file(
            currentMediaItem.asset,
            color: currentFilter,
            colorBlendMode: BlendMode.color,
          ),
          fallbackWidget: const Center(

              // shouldPlay: true,
              )),
    );
  }

  Widget _filterSelector() {
    return Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 80.0,
        child: FliterSelector<dynamic>(
          filters: colorFilters,
          onFilterChanged: (filter) => setState(() {
            currentFilter = filter;
          }),
        ));
  }

  Widget _postButton() {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
            onTap: () => _determineStoryAction(),
            child: Container(
                height: 35,
                width: 65,
                margin: const EdgeInsets.only(top: 25),
                child: const Center(
                    child: Text('Post',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black))),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)))));
  }
}
