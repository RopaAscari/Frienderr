import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

const colors = [
  Colors.black,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.deepPurple,
];

class ArtboardScreen extends StatefulWidget {
  const ArtboardScreen({Key? key, required this.mode, required this.blocGroup})
      : super(key: key);

  final BlocGroup blocGroup;
  final CameraSelectionMode mode;

  @override
  State<ArtboardScreen> createState() => _ArtboardScreenState();
}

class _ArtboardScreenState extends State<ArtboardScreen> {
  bool _isVisible = true;
  Color canvasColor = Colors.black;
  final GlobalKey<_ArtboardScreenState> _key =
      GlobalKey<_ArtboardScreenState>();
  final TextEditingController _controller = TextEditingController();

  void _convertArtboardToImage() async {
    setState(() {
      _isVisible = false;
    });

    var debugNeedsPaint = false;

    FocusScope.of(context).unfocus();

    RenderRepaintBoundary boundary =
        _key.currentContext?.findRenderObject() as RenderRepaintBoundary;

    if (kDebugMode) debugNeedsPaint = boundary.debugNeedsPaint;

    if (debugNeedsPaint) {
      await Future.delayed(const Duration(milliseconds: 20));
      return _convertArtboardToImage();
    }

    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();

    final tempDir = await getApplicationDocumentsDirectory();
    File file = await File(
            '${tempDir.path}/image-${DateTime.now().millisecondsSinceEpoch}.png')
        .create();
    file.writeAsBytesSync(pngBytes as Uint8List);

    final gallertAsset = [
      GalleryAsset(
        id: '0',
        asset: file,
        type: AssetType.image,
      )
    ];

    if (widget.mode == CameraSelectionMode.post) {
      getService<AppRouter>().push(PostMediaRoute(
        posts: gallertAsset,
        postBloc: widget.blocGroup.postBloc,
      ));
    } else if (widget.mode == CameraSelectionMode.story) {
      getService<AppRouter>().push(PreviewStoryRoute(
        selectedAssets: gallertAsset,
        storyBloc: widget.blocGroup.storyBloc,
      ));
    }

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            backgroundColor: canvasColor,
            floatingActionButton:
                _isVisible ? _buildFloatingActionButton() : Center(),
            // floatingActionButtonLocation: FloatingActionButtonLocation.
            body: Stack(alignment: Alignment.center, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: TextField(
                    controller: _controller,
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(3.2)),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Create',
                    ),
                  ))),
              _isVisible
                  ? Positioned(top: 50, right: 20, child: __buildPalette())
                  : Center()
            ])),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _convertArtboardToImage,
      backgroundColor: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
              onPressed: null,
              icon: Icon(Icons.arrow_forward_sharp, color: Colors.grey[700]!))),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(45.0),
      child: AppBar(
        elevation: 0,
        actions: const [],
        leading: _isVisible
            ? IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () => Navigator.pop(context),
              )
            : Center(),
        backgroundColor: canvasColor,
      ),
    );
  }

  Widget __buildPalette() {
    return SizedBox(
        width: 35,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: colors.length,
            separatorBuilder: (ctx, i) => const SizedBox(height: 20),
            itemBuilder: (BuildContext context, int idx) {
              final _isSelected = colors[idx] == canvasColor;
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      canvasColor = colors[idx];
                    });
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: _isSelected ? 2.0 : 0,
                          ),
                          borderRadius: BorderRadius.circular(100),
                          color: colors[idx])));
            }));
  }
}
