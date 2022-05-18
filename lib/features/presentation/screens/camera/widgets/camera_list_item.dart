import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return SizedBox(
        width: 200,
        height: 70,
        child: ListTile(
          leading: AnimatedContainer(
            height: 45,
            curve: Curves.bounceOut,
            padding: const EdgeInsets.all(10),
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.isSelected ? Colors.white : Colors.transparent,
            ),
            child: SvgPicture.asset(
              widget.icon,
              width: 27,
              height: 27,
              color: widget.isSelected
                  ? Colors.black.withOpacity(0.7)
                  : Colors.white,
            ),
          ),
          title: Text(widget.title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ));
  }
}
