import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoadingIndicator extends StatefulWidget {
  final DownloadProgress? progress;
  const ImageLoadingIndicator({Key? key, this.progress}) : super(key: key);

  @override
  State<ImageLoadingIndicator> createState() => _ImageLoadingIndicatorState();
}

class _ImageLoadingIndicatorState extends State<ImageLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40,
        height: 40,
        child: Center(
            child: CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: Colors.grey[800],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.amber,
                ))));
  }
}
