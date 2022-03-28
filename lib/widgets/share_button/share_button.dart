import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/constants/constants.dart';

class ShareButton extends StatelessWidget {
  final double size;
  final Color color;
  final Function onShare;
  final int sharerCount;

  const ShareButton(
      {Key? key,
      required this.size,
      required this.color,
      required this.onShare,
      required this.sharerCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onShare(),
        child: Row(
          children: [
            SvgPicture.asset(Constants.shareIcon,
                width: size,
                height: size,
                color: color,
                semanticsLabel: 'Share Icon'),
            Text(' ${sharerCount.toString()}',
                style: TextStyle(color: color, fontSize: 12))
          ],
        ));
  }
}
