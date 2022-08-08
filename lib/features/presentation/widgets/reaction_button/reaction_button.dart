import 'dart:async';
import 'package:frienderr/features/presentation/widgets/latest_reaction_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart' as react;
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

abstract class Reactions {
  static const lol = 'Lol';
  static const sad = 'Sad';
  static const like = 'Like';
  static const love = 'Love';
  static const care = 'Care';

  static const angry = 'Angry';
  static const unreact = 'Angry';
}

final assetList = [
  Assets.images.likePng.path,
  Assets.images.heart.path,
  Assets.images.care.path,
  Assets.images.lol.path,
  Assets.images.sadPng.path,
  Assets.images.angryPng.path,
];

final _reactions = [
  react.Reaction<String>(
    value: Reactions.like,
    previewIcon: Lottie.asset(
      Assets.lottie.thumbs,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.likePng.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.love,
    previewIcon: Lottie.asset(
      Assets.lottie.heart,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.heart.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.lol,
    previewIcon: Lottie.asset(
      Assets.lottie.lol,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.lol.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.care,
    previewIcon: Lottie.asset(
      Assets.lottie.care,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.care.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.sad,
    previewIcon: Lottie.asset(
      Assets.lottie.sad,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.sadPng.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.angry,
    previewIcon: Lottie.asset(
      Assets.lottie.angry,
      width: 40.0,
      height: 40.0,
    ),
    icon: SvgPicture.asset(
      Assets.images.angryPng.path,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
  react.Reaction<String>(
    value: Reactions.unreact,
    previewIcon: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        width: 80,
        height: 25,
        child: MaterialButton(
            height: 25,
            color: Colors.grey[900]!,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.grey[700]!)),
            onPressed: () {},
            child: const Text('unreact',
                style: TextStyle(color: Colors.white, fontSize: 11.5))),
      ),
    ),
    icon: SvgPicture.asset(
      Assets.icons.likeIconOutline,
      width: 22,
      height: 22,
      color: Colors.white,
    ),
  ),
];

class ReactionButton extends StatefulWidget {
  const ReactionButton({
    Key? key,
    required this.onUpdate,
    required this.onUnReact,
    required this.onReaction,
    required this.reactionCount,
    required this.initialReaction,
    required this.animationController,
    required this.latestReactions,
  }) : super(key: key);

  final int reactionCount;
  final Function onUnReact;
  final Function(String) onUpdate;
  final Function(String) onReaction;
  final PostReaction? initialReaction;
  final List<PostReaction>? latestReactions;
  final AnimationController animationController;
  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton>
    with SingleTickerProviderStateMixin {
  int count = 0;
  bool _isReacted = false;
  String _asset = assetList[0];
  String currentReaction = Reactions.like;
  late AnimationController _loveController;
  int get _reactionCount => widget.reactionCount;
  PostReaction? get _initialReaction => widget.initialReaction;

  @override
  initState() {
    _initializeReaction();
    super.initState();
  }

  void _initializeReaction() {
    late String asset;
    late String reacted;

    if (_initialReaction?.postId == null) {
      return;
    }

    switch (_initialReaction!.reaction) {
      case Reactions.like:
        reacted = Reactions.like;
        asset = Assets.images.likePng.path;

        break;
      case Reactions.love:
        reacted = Reactions.love;
        asset = Assets.images.heart.path;

        break;
      case Reactions.care:
        reacted = Reactions.care;
        asset = Assets.images.care.path;

        break;
      case Reactions.lol:
        reacted = Reactions.lol;
        asset = Assets.images.lol.path;

        break;
      case Reactions.sad:
        reacted = Reactions.sad;
        asset = Assets.images.sadPng.path;

        break;
      case Reactions.angry:
        reacted = Reactions.angry;
        asset = Assets.images.angryPng.path;

        break;
    }

    setState(() {
      _asset = asset;
      _isReacted = true;
      count = _reactionCount;
      currentReaction = reacted;
    });

    _loveController = AnimationController(vsync: this);
  }

  void _handleAnimation() {
    widget.animationController.reset();
    widget.animationController.forward(from: 0.0);
    Timer(const Duration(milliseconds: 1500), () {
      widget.animationController.value = 0.0;
    });
  }

  /*void _onSelect() async {
    if (_isReacted) {
      setState(() {
        count--;
        _isReacted = false;
        //currentReaction = _reactions[0];
        _asset = Assets.images.likePng.path;
      });
      widget.onUnReact();
    } else {
      setState(() {
        count++;
        _isReacted = true;
        // currentReaction = _reactions[0];
        _asset = Assets.images.likePng.path;
      });

      widget.onReaction(Reactions.like);

      await HapticFeedback.heavyImpact();

      Timer(const Duration(milliseconds: 400), () {
        _handleAnimation();
      });
    }
  }*/

  void _onReactionSelected(String? reaction) {
    HapticFeedback.heavyImpact();

    if (reaction == null) {
      return;
    }

    if (reaction == Reactions.unreact) {
      setState(() {
        count--;
        _isReacted = false;
        currentReaction = '';
      });
      widget.onUnReact();
      return;
    }

    late String asset;
    late String reacted;

    switch (reaction) {
      case Reactions.like:
        reacted = Reactions.like;
        asset = Assets.images.likePng.path;

        break;
      case Reactions.love:
        reacted = Reactions.love;
        asset = Assets.images.heart.path;

        break;
      case Reactions.care:
        reacted = Reactions.care;
        asset = Assets.images.care.path;

        break;
      case Reactions.lol:
        reacted = Reactions.lol;
        asset = Assets.images.lol.path;

        break;
      case Reactions.sad:
        reacted = Reactions.sad;
        asset = Assets.images.sadPng.path;

        break;
      case Reactions.angry:
        reacted = Reactions.angry;
        asset = Assets.images.angryPng.path;

        break;
    }

    if (_isReacted) {
      setState(() {
        _asset = asset;
        currentReaction = reaction;
      });
      widget.onUpdate(reacted);
    } else {
      setState(() {
        _asset = asset;
        count = count + 1;
        _isReacted = true;
        currentReaction = reaction;
      });
      widget.onReaction(reacted);
    }

    Timer(const Duration(milliseconds: 400), () {
      _handleAnimation();
    });
  }

  void _viewReactions() async {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext ctx) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                  padding: MediaQuery.of(ctx).viewInsets,
                  child: CustomScrollView(slivers: [
                    _buildAppBar(),
                  ])));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: [
                    react.ReactionButton<String>(
                      boxRadius: 20,
                      reactions: _reactions,
                      onReactionChanged: _onReactionSelected,
                      boxColor: Colors.black.withOpacity(0.8),
                      boxDuration: const Duration(milliseconds: 200),
                      itemScaleDuration: const Duration(milliseconds: 200),
                      initialReaction: react.Reaction<String>(
                        value: null,
                        icon: _buildInitialReaction(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, top: 3),
                      child: Text(currentReaction,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(1.4))),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _viewReactions,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: widget.latestReactions!.isEmpty ? 0 : 5.0),
                      child: LatestReactionBuilder(
                          reactions: widget.latestReactions ?? []),
                    ),
                    Text('$count reactions',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.25))),
                  ],
                ),
              ),
            ]));
  }

  Widget _buildInitialReaction() {
    return ConditionalRenderDelegate(
      condition: _isReacted,
      renderWidget: Image.asset(_asset, height: 22, width: 22),
      fallbackWidget: SvgPicture.asset(
        Assets.icons.likeIconOutline,
        width: 22,
        height: 22,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        floating: true,
        leading: const Center(),
        title: null,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
        expandedHeight: 55,
        flexibleSpace: PreferredSize(
            preferredSize: const Size.fromHeight(45.0),
            child: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.1),
                title: Text(
                  'Reactions',
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.5)),
                ))));
  }
}
