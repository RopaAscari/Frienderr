import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AssetImageFullscreen extends StatefulWidget {
  final File file;
  const AssetImageFullscreen({Key? key, required this.file}) : super(key: key);

  @override
  State<AssetImageFullscreen> createState() => _AssetImageFullscreenState();
}

class _AssetImageFullscreenState extends State<AssetImageFullscreen> {
  File get file => widget.file;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy > 0) {
                Navigator.pop(context);
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(
                  maxScale: 2,
                  minScale: 0.5,
                  panEnabled: false,
                  boundaryMargin: const EdgeInsets.all(100),
                  child: Center(child: Image.file(file, fit: BoxFit.contain))),
              decoration: const BoxDecoration(color: Colors.black),
            )),
      ),
    );
  }
}
