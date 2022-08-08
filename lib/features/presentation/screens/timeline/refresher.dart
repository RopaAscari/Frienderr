import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class Refresher extends StatefulWidget {
  const Refresher(
      {Key? key, required this.scrollController, required this.postBloc})
      : super(key: key);

  final PostBloc postBloc;
  final ScrollController scrollController;
  @override
  State<Refresher> createState() => _RefresherState();
}

class _RefresherState extends State<Refresher> {
  bool showRefresher = false;
  PostBloc get _postBloc => widget.postBloc;
  ScrollController get _scrollController => widget.scrollController;

  @override
  void initState() {
    _postBloc.timeline.listen((querySnapshot) {
      /* setState(() {
        showRefresher = true;
      });*/
    });

    super.initState();
  }

  void _onRefresh() {
    _scrollController.animateTo(0.0,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 800));

    _postBloc.add(const PostEvent.fetchTimelinePosts(shouldLoad: false));

    setState(() {
      showRefresher = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalRenderDelegate(
        condition: showRefresher,
        fallbackWidget: const Center(),
        renderWidget: GestureDetector(
            onTap: _onRefresh,
            child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 30,
                    width: 70,
                    margin: const EdgeInsets.all(35),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Center(
                        child: Icon(Icons.refresh, color: Colors.black))))));
  }
}
