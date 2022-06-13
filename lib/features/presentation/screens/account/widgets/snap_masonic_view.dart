import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/presentation/widgets/quicks.dart';
import 'package:frienderr/features/presentation/widgets/render_posts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SnapMasonicView extends StatelessWidget {
  final BlocGroup blocGroup;
  final List<QuickEntity> snaps;
  final bool isProfileOwnerViewing;
  const SnapMasonicView({
    Key? key,
    required this.snaps,
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
          final String thumbnail = snaps[index].thumbnail;
          return OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              closedColor: Colors.transparent,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (BuildContext context, VoidCallback _) {
                final VideoPlayerController _controller =
                    VideoPlayerController.network(snaps[index].url);

                return Quicks(
                  controller: _controller,
                  quick: snaps[index],
                );
              },
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(thumbnail, fit: BoxFit.cover));
              });
        },
        childCount: snaps.length,
      ),
    );
  }
}
