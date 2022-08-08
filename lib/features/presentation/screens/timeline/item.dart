import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/presentation/widgets/image_loading_indicator.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';
import 'package:time_elapsed/time_elapsed.dart';

class Item extends StatefulWidget {
  final Post post;
  const Item({Key? key, required this.post}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Post get _post => widget.post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 550,
                child: CachedNetworkImage(
                    imageUrl: _post.content[0].media,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        ((BuildContext ctx, String _, DownloadProgress __) {
                      return ImageLoadingIndicator(progress: __);
                    })))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade200.withOpacity(0.5)),
                        child: Row(
                          children: [
                            _buildUserAvatar(),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildUserName(),
                                  _buildTimeElapsed()
                                ],
                              ),
                            )
                          ],
                        )))),
          ),
          _buildOptionIcon()
        ]),
      ]),
    );
  }

  Widget _buildUserAvatar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
            radius: 22,
            backgroundImage:
                CachedNetworkImageProvider(_post.user.profilePic!)),
      ),
    );
  }

  Widget _buildUserName() {
    return Text(_post.user.username,
        style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveFlutter.of(context).fontSize(1.6)));
  }

  Widget _buildTimeElapsed() {
    final _timeElasped = TimeElapsed.fromDateTime(
        DateTime.fromMillisecondsSinceEpoch(_post.dateCreated));

    return Text(
      _timeElasped,
      style: TextStyle(
          color: Colors.black,
          fontSize: ResponsiveFlutter.of(context).fontSize(1.25)),
    );
  }

  Widget _buildOptionIcon() {
    return PopupMenuContainer<int>(
      child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      items: [
        PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                SvgPicture.asset(
                  Constants.messageDeleteIconFill,
                  width: 29,
                  height: 29,
                  color: Colors.red[600],
                ),
                Text('  Delete ',
                    style: TextStyle(color: Colors.red[600]!, fontSize: 18)),
              ],
            )),
      ],
      onItemSelected: (value) async {},
    );
  }
}
