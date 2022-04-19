import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AppLikeButton extends StatefulWidget {
  final double size;
  final Color color;
  final int likeCount;
  final Function onLike;

  const AppLikeButton({
    Key? key,
    required this.color,
    required this.size,
    required this.onLike,
    required this.likeCount,
  }) : super(key: key);

  @override
  State<AppLikeButton> createState() => _AppLikeButtonState();
}

class _AppLikeButtonState extends State<AppLikeButton> {
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
            condition: isLiked,
            renderWidget: Icon(
              Icons.favorite,
              color: Colors.red,
              size: widget.size,
            ),
            fallbackWidget: Icon(
              CupertinoIcons.heart_fill,
              size: widget.size,
              color: widget.color,
            ));
      },
      likeCount: widget.likeCount + 1,
      countBuilder: (int? count, bool isLiked, String text) {
        Color color = isLiked ? Colors.red : Colors.grey[200]!;

        return ConditionalRenderDelegate(
            condition: count == 0,
            renderWidget: Center(),
            fallbackWidget: Text(
              text,
              style: TextStyle(color: color, fontSize: 10),
            ));
      },
      onTap: (bool isLiked) async {
        widget.onLike();
        return !isLiked;
      },
    );
  }
}
