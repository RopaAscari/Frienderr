import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final String imageFile;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageFile,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
