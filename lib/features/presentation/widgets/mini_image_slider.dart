import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';

class MiniImageSlider extends StatefulWidget {
  const MiniImageSlider({Key? key, required this.assets}) : super(key: key);

  final List<GalleryAsset> assets;

  @override
  State<MiniImageSlider> createState() => _MiniImageSliderState();
}

class _MiniImageSliderState extends State<MiniImageSlider> {
  double _determineWidth() {
    if (widget.assets.isEmpty) {
      return 60;
    }
    return widget.assets.length * 60;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: _determineWidth(),
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (ctx, i) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.assets.length,
            itemBuilder: (BuildContext context, int i) {
              return Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                          width: 45,
                          height: 60,
                          child: Image.file(widget.assets[i].asset))),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {})),
                ],
              );
            }));
  }
}
