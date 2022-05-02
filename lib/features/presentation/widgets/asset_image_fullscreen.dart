import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AssetImageFullscreen extends StatefulWidget {
  final Future<File?> file;
  const AssetImageFullscreen({Key? key, required this.file}) : super(key: key);

  @override
  State<AssetImageFullscreen> createState() => _AssetImageFullscreenState();
}

class _AssetImageFullscreenState extends State<AssetImageFullscreen> {
  Future<File?> get file => widget.file;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy > 0) {
            //  Navigator.pop(context);
          }
        },
        child: FutureBuilder<File?>(
            builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return _errorDisplay();
                  }
                  final file = snapshot.data as File;
                  return _assetDisplay(file);
                case ConnectionState.none:
                  return Center();
                case ConnectionState.active:
                  return Center();
              }
            },
            future: file));
  }

  Widget _errorDisplay() {
    return Center(child: Text("Couldn't load asset"));
  }

  Widget _assetDisplay(File file) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: InteractiveViewer(
          maxScale: 2,
          minScale: 0.5,
          panEnabled: false,
          boundaryMargin: EdgeInsets.all(100),
          child: Center(child: Image.file(file, fit: BoxFit.contain))),
      decoration: BoxDecoration(color: Colors.black),
    );
  }
}
