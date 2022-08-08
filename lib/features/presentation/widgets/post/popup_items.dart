import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';

final List<PopupMenuItem<PostActions>> userPostPopupItems = [
  PopupMenuItem(
      value: PostActions.delete,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delete',
              style: TextStyle(color: Colors.grey[100]!, fontSize: 13)),
          const Icon(CupertinoIcons.delete, size: 19),
        ],
      )),
  PopupMenuItem(
      value: PostActions.report,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Report',
              style: TextStyle(color: Colors.grey[100]!, fontSize: 13)),
          const Icon(CupertinoIcons.flag, size: 19),
        ],
      )),
];

final List<PopupMenuItem<PostActions>> postPopupItems = [
  PopupMenuItem(
      value: PostActions.report,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Report',
              style: TextStyle(color: Colors.grey[100]!, fontSize: 13)),
          const Icon(CupertinoIcons.flag, size: 19),
        ],
      )),
];
