import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/firebase.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({Key? key, required this.postId, required this.postBloc})
      : super(key: key);

  final String postId;
  final PostBloc postBloc;
  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  String get _postId => widget.postId;

  PostBloc get _postBloc => widget.postBloc;

  void _sharePost() async {
    try {
      final link = await getService<FirebaseServices>().createDynamicLink();
      await Share.share(link);
      _postBloc.add(PostEvent.sharePost(postId: _postId));
    } catch (e) {
      getService<AppRouter>().context.showToast(
          content: const Text("Unable to share post"),
          type: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _sharePost,
      child: SvgPicture.asset(Assets.icons.shareIconOutline,
          width: 21, height: 21, color: Colors.grey[400]),
    );
  }
}
