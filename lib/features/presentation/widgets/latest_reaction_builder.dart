import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/presentation/widgets/reaction_button/reaction_button.dart';

class LatestReactionBuilder extends StatefulWidget {
  const LatestReactionBuilder({Key? key, required this.reactions})
      : super(key: key);

  final List<PostReaction> reactions;

  @override
  State<LatestReactionBuilder> createState() => _LatestReactionBuilderState();
}

class _LatestReactionBuilderState extends State<LatestReactionBuilder> {
  String _determineReaction(PostReaction reaction) {
    switch (reaction.reaction) {
      case Reactions.like:
        return Assets.images.likePng.path;

      case Reactions.love:
        return Assets.images.heart.path;

      case Reactions.care:
        return Assets.images.care.path;

      case Reactions.lol:
        return Assets.images.lol.path;

      case Reactions.sad:
        return Assets.images.sadPng.path;

      case Reactions.angry:
        return Assets.images.angryPng.path;

      default:
        return Assets.images.likePng.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext ctx, int index) {
            if (widget.reactions.isEmpty) {
              return const Center();
            }
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.3)),
              child: Image.asset(_determineReaction(widget.reactions[0]),
                  height: 12, width: 12),
            );
          }),
    );
  }
}
