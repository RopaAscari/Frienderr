import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/screens/comment/comment_screen.dart';

class CommentButton extends StatefulWidget {
  const CommentButton({
    Key? key,
    required this.post,
    required this.user,
    required this.onDelete,
    required this.onComment,
  }) : super(key: key);

  final Post post;

  final UserModel user;
  final Function() onDelete;
  final Function() onComment;
  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  Post get _post => widget.post;
  UserModel get _user => widget.user;
  int _count = 0;

  @override
  void initState() {
    setState(() {
      _count = _post.comments;
    });
    super.initState();
  }

  void _onComment() {
    widget.onComment();
    setState(() {
      _count++;
    });
  }

  void _onDelete() {
    widget.onDelete();
    setState(() {
      _count--;
    });
  }

  void _viewPostComments() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Padding(
                padding: MediaQuery.of(ctx).viewInsets,
                child: CommentScreen(
                  user: _user,
                  post: _post,
                  onDelete: _onDelete,
                  onComment: _onComment,
                  type: CommentType.post,
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _viewPostComments,
      child: Row(
        children: [
          SvgPicture.asset(Assets.icons.commentIconOutline,
              width: 23, height: 23, color: Colors.grey[400]),
          Text(' $_count',
              style: TextStyle(fontSize: 11.5, color: Colors.grey[500]))
        ],
      ),
    );
  }
}
