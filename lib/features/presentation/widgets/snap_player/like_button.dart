import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/widgets/button_overlay.dart';

class SnapLikeButton extends StatefulWidget {
  const SnapLikeButton(
      {Key? key,
      required this.blocGroup,
      required this.snap,
      required this.animationController})
      : super(key: key);

  final Snap snap;
  final BlocGroup blocGroup;
  final AnimationController animationController;

  @override
  State<SnapLikeButton> createState() => _SnapLikeButton();
}

class _SnapLikeButton extends State<SnapLikeButton> {
  Snap get _snap => widget.snap;
  BlocGroup get _blocGroup => widget.blocGroup;
  String get _userid => widget.blocGroup.userBloc.state.user.id;
  AnimationController get _animationController => widget.animationController;

  int _count = 0;
  bool _isLiked = false;
  Color _color = Colors.grey[500]!.withOpacity(0.5);

  @override
  void initState() {
    setState(() {
      _count = _snap.likes;
      _isLiked = _snap.isLiked;
      _color = _snap.isLiked
          ? const Color.fromARGB(255, 246, 56, 56)
          : Colors.grey[500]!.withOpacity(0.5);
    });

    super.initState();
  }

  void _likeSnap() async {
    setState(() {
      _count++;
      _isLiked = true;
      _color = const Color.fromARGB(255, 246, 56, 56);
    });
    _blocGroup.snapBloc
        .add(SnapEvent.likeSnap(userId: _userid, snapId: _snap.id));

    _animationController.forward();

    await HapticFeedback.heavyImpact();
  }

  void _unLikeSnap() async {
    setState(() {
      _count--;
      _isLiked = false;
      _color = Colors.grey[500]!.withOpacity(0.5);
    });
    _blocGroup.snapBloc
        .add(SnapEvent.unLikeSnap(userId: _userid, snapId: _snap.id));

    await HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 19),
        child: GestureDetector(
            onTap: () {
              if (_isLiked) {
                _unLikeSnap();
              } else {
                _likeSnap();
              }
            },
            child: Column(
              children: [
                ButtonOverlay(
                    color: _color,
                    child: const Icon(Icons.favorite,
                        color: Colors.white, size: 22)),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text('$_count',
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(1.2))),
                )
              ],
            )));
  }
}
