import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'picker_delegate.dart';

const Color _themeColor = Color(0xfff2223a);

class GalleryPicker extends StatefulWidget {
  const GalleryPicker({super.key, required this.onPicked});

  final Function(List<GalleryAsset>) onPicked;

  @override
  State<GalleryPicker> createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<GalleryPicker> {
  final int maxAssets = 9;
  bool isDisplayingDetail = true;
  List<AssetEntity> entities = <AssetEntity>[];
  late final ThemeData theme = AssetPicker.themeData(_themeColor);

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _callPicker(context);
    });
    super.initState();
  }

  Future<void> _callPicker(BuildContext context) async {
    final PermissionState ps = await AssetPicker.permissionCheck();

    final DefaultAssetPickerProvider provider = DefaultAssetPickerProvider(
      maxAssets: maxAssets,
      selectedAssets: entities,
      requestType: RequestType.common,
    );

    final MultiAssetPickerBuilder builder = MultiAssetPickerBuilder(
      provider: provider,
      initialPermission: ps,
      pickerTheme: theme,
      locale: Localizations.maybeLocaleOf(context),
    );
    final List<AssetEntity>? result = await AssetPicker.pickAssetsWithDelegate(
      context,
      delegate: builder,
    );
    if (result != null) {
      entities = result;
      if (mounted) {
        setState(() {});
      }
    }

    List<GalleryAsset> galleryAssets = [];

    for (var asset in entities) {
      final File file = await asset.file as File;
      final Uint8List thumbnail = await asset.thumbnailData as Uint8List;

      galleryAssets.add(GalleryAsset(
        asset: file,
        id: asset.id,
        type: asset.type,
        thumbnail: thumbnail,
        duration: asset.duration,
      ));
    }

    widget.onPicked(galleryAssets);

    Navigator.pop(context);
  }

  Widget get selectedAssetsWidget {
    return AnimatedContainer(
      duration: kThemeChangeDuration,
      curve: Curves.easeInOut,
      height: entities.isNotEmpty
          ? isDisplayingDetail
              ? 120.0
              : 80.0
          : 40.0,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
            child: GestureDetector(
              onTap: () {
                if (entities.isNotEmpty) {
                  setState(() {
                    isDisplayingDetail = !isDisplayingDetail;
                  });
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Selected Assets'),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Text(
                      '${entities.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                  ),
                  if (entities.isNotEmpty)
                    Icon(
                      isDisplayingDetail
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      size: 18.0,
                    ),
                ],
              ),
            ),
          ),
          selectedAssetsListView,
        ],
      ),
    );
  }

  Widget get selectedAssetsListView {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: entities.length,
        itemBuilder: (BuildContext _, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(child: _selectedAssetWidget(index)),
                  AnimatedPositionedDirectional(
                    duration: kThemeAnimationDuration,
                    top: isDisplayingDetail ? 6.0 : -30.0,
                    end: isDisplayingDetail ? 6.0 : -30.0,
                    child: _selectedAssetDeleteButton(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _selectedAssetWidget(int index) {
    final AssetEntity asset = entities.elementAt(index);

    Future<void> _onTap() async {
      final List<AssetEntity>? result = await AssetPickerViewer.pushToViewer(
        context,
        currentIndex: index,
        previewAssets: entities,
        selectedAssets: entities,
        themeData: theme,
        maxAssets: maxAssets,
      );
      if (result != null) {
        entities = result;
        if (mounted) {
          setState(() {});
        }
      }
    }

    return GestureDetector(
      onTap: isDisplayingDetail ? _onTap : null,
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: _assetWidgetBuilder(asset),
        ),
      ),
    );
  }

  Widget _assetWidgetBuilder(AssetEntity asset) {
    return Image(image: AssetEntityImageProvider(asset), fit: BoxFit.cover);
  }

  Widget _selectedAssetDeleteButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          entities.removeAt(index);
          if (entities.isEmpty) {
            isDisplayingDetail = false;
          }
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: theme.canvasColor.withOpacity(0.5),
        ),
        child: Icon(
          Icons.close,
          color: theme.iconTheme.color,
          size: 18.0,
        ),
      ),
    );
  }

  Widget paddingText(String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SelectableText(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
