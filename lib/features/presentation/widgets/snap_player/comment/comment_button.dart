import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/button_overlay.dart';
import 'package:frienderr/features/presentation/screens/comment/comment_screen.dart';

class SnapCommentButton extends StatefulWidget {
  const SnapCommentButton(
      {Key? key,
      required this.snap,
      required this.blocGroup,
      required this.controller})
      : super(key: key);

  final Snap snap;
  final BlocGroup blocGroup;
  final VideoPlayerController controller;

  @override
  State<SnapCommentButton> createState() => _SnapCommentButtonState();
}

class _SnapCommentButtonState extends State<SnapCommentButton> {
  int _count = 0;
  Snap get _snap => widget.snap;
  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  VideoPlayerController get _controller => widget.controller;

  @override
  @override
  void initState() {
    setState(() {
      _count = _snap.comments;
    });
    super.initState();
  }

  void _onDelete() {
    setState(() {
      _count--;
    });
  }

  void _onComment() {
    setState(() {
      _count++;
    });
  }

  void _viewComments() {
    _controller.pause();
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
                  snap: _snap,
                  onDelete: _onDelete,
                  onComment: _onComment,
                  type: CommentType.snap,
                )),
          );
        }).whenComplete(() => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: _viewComments,
              child: ButtonOverlay(
                child: SvgPicture.asset(
                  Assets.icons.snapCommentIcon,
                  width: 19,
                  height: 19,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: Text('$_count',
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.2))))
          ],
        ));
  }
}
