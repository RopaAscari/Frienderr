import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/screens/camera/feature_list.dart';

class CameraListItem extends StatefulWidget {
  final String icon;
  final String title;
  final bool isSelected;
  const CameraListItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.isSelected = false})
      : super(key: key);

  @override
  State<CameraListItem> createState() => _CameraListItemState();
}

class _CameraListItemState extends State<CameraListItem> {
  final isMultiSelect = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(children: [
        AnimatedContainer(
            curve: Curves.bounceOut,
            padding: const EdgeInsets.all(5.8),
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.isSelected ? Colors.white : Colors.transparent,
            ),
            child: SvgPicture.asset(
              widget.icon,
              width: 18,
              height: 18,
              color: widget.isSelected
                  ? Colors.black.withOpacity(0.6)
                  : Colors.white,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(widget.title,
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(1.45),
              )),
        )
      ]),
    );
  }
}
