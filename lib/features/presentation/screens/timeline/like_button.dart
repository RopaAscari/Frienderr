import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart' as like;

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key, required this.onLike}) : super(key: key);

  final Function(void) onLike;
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void _determineLikeAction(int count) {
    if (_isLiked) {
      setState(() {
        _isLiked = false;
      });
    } else {
      setState(() {
        _isLiked = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return like.LikeButton(
      size: 32,
      circleColor: const like.CircleColor(
          start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const like.BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        if (!isLiked) {
          return const Icon(
            CupertinoIcons.heart,
            color: Colors.black,
            size: 32,
          );
        } else {
          return const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 32,
          );
        }
      },
      likeCount: 0,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = isLiked ? Colors.red : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "",
            style: TextStyle(color: color),
          );
        } else {
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        }
        return result;
      },
    );
  }
}
