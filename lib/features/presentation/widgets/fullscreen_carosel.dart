import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/presentation/widgets/post/carousel_builder.dart';

class FullScreenCarousel extends StatefulWidget {
  const FullScreenCarousel({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<FullScreenCarousel> createState() => _FullScreenCarouselState();
}

class _FullScreenCarouselState extends State<FullScreenCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.black, //Theme.of(context).canvasColor,
        body: SingleChildScrollView(
          child: Center(
            child: PostCarouselBuilder(
                borderRadius: 0,
                post: widget.post,
                height: MediaQuery.of(context).size.height * .8),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).canvasColor,
      automaticallyImplyLeading: false,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        /* Text("${widget.post.user.username}'s posts",
            style: const TextStyle(fontSize: 12)),*/
        const Center()
      ]),
    );
  }
}
