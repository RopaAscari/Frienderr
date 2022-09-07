import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    Key? key,
    required this.userId,
    required this.postId,
    required this.isSaved,
    required this.postBloc,
  }) : super(key: key);

  final String userId;
  final String postId;
  final bool isSaved;
  final PostBloc postBloc;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  int count = 0;
  bool _isSaved = false;

  String get _postId => widget.postId;
  String get _userId => widget.userId;
  PostBloc get _postBloc => widget.postBloc;

  @override
  void initState() {
    setState(() {
      _isSaved = widget.isSaved;
    });
    super.initState();
  }

  void _bookmarkPost() {
    _postBloc.add(PostEvent.savePost(
        savedPost: SavedPostDTO(
      userId: _userId,
      postId: _postId,
      type: PostType.post,
    )));

    setState(() {
      _isSaved = true;
    });
  }

  void _unBookmarkPost() {
    _postBloc.add(PostEvent.unSavePost(
      userId: _userId,
      postId: _postId,
    ));

    setState(() {
      _isSaved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConditionalRenderDelegate(
            condition: _isSaved,
            renderWidget: GestureDetector(
              onTap: _unBookmarkPost,
              child: const Icon(CupertinoIcons.bookmark_fill,
                  color: Colors.amber, size: 23),
            ),
            fallbackWidget: GestureDetector(
                onTap: _bookmarkPost,
                child: const Icon(CupertinoIcons.bookmark, size: 21))),
        //Text(' $count', style: TextStyle(color: Colors.grey[500]))
      ],
    );
  }
}
