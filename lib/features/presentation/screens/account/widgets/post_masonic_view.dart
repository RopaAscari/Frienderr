import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frienderr/features/presentation/widgets/render_post_handler.dart';

class PostMasonicScreen extends StatelessWidget {
  final List<Post> posts;
  final BlocGroup blocGroup;
  final bool isProfileOwnerViewing;
  const PostMasonicScreen({
    Key? key,
    required this.posts,
    required this.blocGroup,
    required this.isProfileOwnerViewing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            pattern: [
              const QuiltedGridTile(1, 1),
            ],
            repeatPattern: QuiltedGridRepeatPattern.inverted,
          ),
          physics: const NeverScrollableScrollPhysics(),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              final thumbnail = posts[index].content[0].type == "video"
                  ? posts[index].content[0].metadata.thumbnail
                  : posts[index].content[0].media;

              return OpenContainer(
                  openElevation: 0,
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (BuildContext context, VoidCallback _) {
                    return RenderPostHandler(
                      post: posts[index],
                      blocGroup: blocGroup,
                      shouldInitialize: true,
                    );
                  },
                  closedBuilder:
                      (BuildContext context, VoidCallback openContainer) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          imageUrl: thumbnail!,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ));
                  });
            },
            childCount: posts.length,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 20)),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text("Your posts",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6))),
          ),
          const Center()
        ]));
  }
}
