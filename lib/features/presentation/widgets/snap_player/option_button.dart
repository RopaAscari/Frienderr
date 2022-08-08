import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/widgets/button_overlay.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';
import 'package:frienderr/features/presentation/widgets/post/popup_items.dart';

class SnapOptionButton extends StatefulWidget {
  const SnapOptionButton(
      {Key? key, required this.snap, required this.blocGroup})
      : super(key: key);
  final Snap snap;
  final BlocGroup blocGroup;

  @override
  State<SnapOptionButton> createState() => _SnapOptionButtonState();
}

class _SnapOptionButtonState extends State<SnapOptionButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuContainer<PostActions>(
      child: const Padding(
          padding: EdgeInsets.only(top: 60),
          child: ButtonOverlay(
            child: Icon(Icons.more_horiz, size: 20),
          )),
      items: widget.snap.user.id == widget.blocGroup.userBloc.state.user.id
          ? userPostPopupItems
          : postPopupItems,
      onItemSelected: (value) async {
        if (value == PostActions.delete) {
          widget.blocGroup.snapBloc
              .add(SnapEvent.deleteQuick(snapId: widget.snap.id));
        }
      },
    );
    ;
  }
}
