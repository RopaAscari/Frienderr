import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/presentation/widgets/image_loading_indicator.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final String imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.black, //Theme.of(context).canvasColor,
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageFile,
          placeholder: (context, url) =>
              const Center(child: ImageLoadingIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
