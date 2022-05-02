import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AppLikeButton extends StatefulWidget {
  final double size;
  final Color color;
  final int likeCount;
  final bool hideCount;
  final Function onLike;

  const AppLikeButton({
    Key? key,
    required this.size,
    required this.color,
    required this.onLike,
    required this.hideCount,
    required this.likeCount,
  }) : super(key: key);

  @override
  State<AppLikeButton> createState() => _AppLikeButtonState();
}

class _AppLikeButtonState extends State<AppLikeButton> {
  int count = 0;
  bool isPostLiked = false;
  @override
  void initState() {
    this.setState(() {
      count = widget.likeCount;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: widget.size,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return ConditionalRenderDelegate(
            condition: isPostLiked,
            renderWidget: SvgPicture.asset(
              Constants.postLikeIconFill,
              width: 30,
              height: 30,
              color: Colors.red,
            ),
            fallbackWidget: SvgPicture.asset(
              Constants.postLikeIconOutline,
              width: 30,
              height: 30,
              color: Colors.grey[400],
            ));
      },
      likeCount: count,
      countBuilder: (int? count, bool isLiked, String text) {
        Color color = isPostLiked ? Colors.red : Colors.grey[200]!;

        return ConditionalRenderDelegate(
            condition: count == 0 || widget.hideCount,
            renderWidget: Center(),
            fallbackWidget: Text(
              text,
              style: TextStyle(color: color, fontSize: 10),
            ));
      },
      onTap: (bool isLiked) async {
        widget.onLike();

        setState(() {
          count++;
          isPostLiked = !isPostLiked;
        });
        return true;
      },
    );
  }
}
