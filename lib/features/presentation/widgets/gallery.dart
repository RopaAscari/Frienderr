import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/asset_thumbnail.dart';

class Gallery extends StatefulWidget {
  final BlocGroup blocGroup;
  final CameraSelectionMode cameraMode;

  Gallery({
    Key? key,
    required this.cameraMode,
    required this.blocGroup,
  }) : super(key: key);

  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  int? _lastPage;
  int _currentPage = 0;
  List<AssetEntity> _assets = [];
  bool _isMutliSelecting = false;
  bool _hasSelectedMultiAssets = false;
  List<GalleryAsset> _selectedAssets = [];
  BlocGroup get _blocGroup => widget.blocGroup;
  ScrollController _scrollController = ScrollController();
  CameraSelectionMode get _cameraMode => widget.cameraMode;

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  bool get areAssetsSelected {
    return _selectedAssets.length > 0;
  }

  Future<void> _fetchAssets() async {
    List<AssetEntity> _allAssets = List.from(_assets);

    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        onlyAll: true, type: RequestType.all);

    if (albums.isEmpty) return;

    final AssetPathEntity recentAlbum = albums.last;

    final List<AssetEntity> _recentAssets =
        await recentAlbum.getAssetListPaged(page: _currentPage, size: 60);

    setState(() {
      _currentPage++;
      _assets = List.from(_allAssets)..addAll(_recentAssets);
    });
  }

  void _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (_currentPage != _lastPage) {
        _fetchAssets();
      }
    }
  }

  Future<void> _fetchSelectedAssets(GalleryAsset assets) async {
    _selectedAssets.add(assets);
    if (!_hasSelectedMultiAssets) {
      setState(() {
        _hasSelectedMultiAssets = true;
      });
      return;
    }
  }

  Future<void> _removeSelectedAssets(GalleryAsset asset) async {
    _selectedAssets.removeWhere((element) => element.id == asset.id);
    if (_selectedAssets.isEmpty) {
      setState(() {
        _hasSelectedMultiAssets = false;
      });
    }
  }

  Future<void> _navigateToPreviewScreen() async {
    late final List<GalleryAsset> assets;

    print('ex');

    if (_selectedAssets.isEmpty) {
      final File _file = await _assets.first.file as File;
      assets = [
        GalleryAsset(
            id: 0,
            asset: _file,
            type: _assets.first.type,
            duration: _assets.first.duration,
            thumbnail: _assets.first.thumbnailData as Uint8List)
      ];
    } else {
      assets = _selectedAssets;
    }

    if (_cameraMode == CameraSelectionMode.post) {
      getIt<AppRouter>().push(PreviewPostRoute(
          selectedAssets: assets, postBloc: _blocGroup.postBloc));
    } else if (_cameraMode == CameraSelectionMode.story) {
      getIt<AppRouter>().push(PreviewStoryRoute(
          selectedAssets: assets, storyBloc: _blocGroup.storyBloc));
    } else if (_cameraMode == CameraSelectionMode.snap) {
      final File file = assets.first.asset;
      getIt<AppRouter>()
          .push(PreviewQuickRoute(file: file, quickBloc: _blocGroup.quickBloc));
    }
  }

  void _toggleMultiSelection() {
    setState(() {
      _isMutliSelecting = !_isMutliSelecting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Scaffold(
                    floatingActionButton: _nextButton(),
                    appBar: AppBar(
                        leading: _backArrow(),
                        actions: [_selectMultipleButton()],
                        backgroundColor: Colors.black),
                    body: Stack(
                      children: <Widget>[
                        _assetGridWidget(),
                      ],
                    )))));
  }

  Widget _backArrow() {
    return IconButton(
        icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context));
  }

  Widget _selectMultipleButton() {
    return Padding(
      child: MaterialButton(
          height: 30,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.white)),
          onPressed: () => _toggleMultiSelection(),
          child: const Text('Select')),
      padding: const EdgeInsets.all(10),
    );
  }

  Widget _nextButton() {
    final Color color = !areAssetsSelected ? Colors.grey[700]! : Colors.white;
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
                height: 39,
                disabledTextColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: color)),
                onPressed: () {
                  if (areAssetsSelected) {
                    _navigateToPreviewScreen();
                  } else {
                    return null;
                  }
                },
                child: Text('Next', style: TextStyle(color: color)))));
  }

  Widget _assetGridWidget() {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          _handleScrollEvent(scroll);
          return false;
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: _assets.length,
          itemBuilder: (_, index) {
            return Padding(
                child: AssetThumbnail(
                  index: index,
                  asset: _assets[index],
                  cameraMode: _cameraMode,
                  isMutliSelecting: _isMutliSelecting,
                  fetchSelectedAssets: _fetchSelectedAssets,
                  removeSelectedAssets: _removeSelectedAssets,
                  currentSelectedIndex: _selectedAssets.indexWhere(
                      (asset) => asset.id.toString() == index.toString()),
                ),
                padding: const EdgeInsets.all(2));
          },
        ));
  }
}
