import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/snaps.dart';

class SnapMasonicScreen extends StatelessWidget {
  final BlocGroup blocGroup;
  final List<Snap> snaps;
  final bool isProfileOwnerViewing;
  const SnapMasonicScreen({
    Key? key,
    required this.snaps,
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
                  final String thumbnail = snaps[index].thumbnail;
                  return OpenContainer(
                      openElevation: 0,
                      closedElevation: 0,
                      closedColor: Colors.transparent,
                      transitionType: ContainerTransitionType.fadeThrough,
                      openBuilder: (BuildContext context, VoidCallback _) {
                        final VideoPlayerController _controller =
                            VideoPlayerController.network(snaps[index].url);

                        return Snaps(
                          snap: snaps[index],
                          blocGroup: blocGroup,
                          controller: _controller,
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
            )));
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
            child: Text("Your snaps",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6))),
          ),
          const Center()
        ]));
  }
}
