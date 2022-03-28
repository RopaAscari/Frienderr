import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/constants/constants.dart';

class CommentButton extends StatelessWidget {
  final double size;
  final Color color;
  final int commentCount;
  final Function onComment;
  const CommentButton(
      {Key? key,
      required this.size,
      required this.color,
      required this.onComment,
      required this.commentCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onComment(),
        child: Row(children: [
          SvgPicture.asset(Constants.commentIconFill,
              width: size,
              height: size,
              color: color,
              semanticsLabel: 'Comment Icon'),
          Text(' ${commentCount.toString()}',
              style: TextStyle(color: color, fontSize: 12))
        ]));
  }
}
