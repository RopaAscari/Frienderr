import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostMasonicView extends StatelessWidget {
  final BlocGroup blocGroup;
  final List<PostEntity> posts;
  final bool isProfileOwnerViewing;
  const PostMasonicView({
    Key? key,
    required this.posts,
    required this.blocGroup,
    required this.isProfileOwnerViewing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
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
                return RenderPost(
                  post: posts[index],
                  postBloc: blocGroup.postBloc,
                  isPostOwner: isProfileOwnerViewing,
                );
              },
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        Image.network(thumbnail as String, fit: BoxFit.cover));
              });
        },
        childCount: posts.length,
      ),
    );
  }
}
