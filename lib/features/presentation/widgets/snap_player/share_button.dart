import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/firebase.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/button_overlay.dart';

class SnapShareButton extends StatefulWidget {
  const SnapShareButton({Key? key, required this.snap, required this.blocGroup})
      : super(key: key);
  final Snap snap;
  final BlocGroup blocGroup;
  @override
  State<SnapShareButton> createState() => _SnapShareButtonState();
}

class _SnapShareButtonState extends State<SnapShareButton> {
  @override
  Widget build(BuildContext context) {
    void _sharePost() async {
      try {
        final link = await getService<FirebaseServices>().createDynamicLink();
        await Share.share(link);
        //widget.blocGroup.postBloc.add(PostEvent.sharePost(postId: widget.sna));
      } catch (e) {
        getService<AppRouter>().context.showToast(
            content: const Text("Unable to share post"),
            type: SnackBarType.error);
      }
      ;
    }

    return GestureDetector(
      onTap: _sharePost,
      child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ButtonOverlay(
            child: SvgPicture.asset(
              Assets.icons.shareSnapIcon,
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          )),
    );
  }
}
