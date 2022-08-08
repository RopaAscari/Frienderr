import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/post/post.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class RenderPostHandler extends StatefulWidget {
  const RenderPostHandler(
      {Key? key,
      this.post,
      required this.blocGroup,
      required this.shouldInitialize})
      : super(key: key);

  final Post? post;
  final BlocGroup blocGroup;
  final bool shouldInitialize;

  @override
  State<RenderPostHandler> createState() => _RenderPostHandlerState();
}

class _RenderPostHandlerState extends State<RenderPostHandler> {
  late Post post;
  bool _hasError = false;
  bool _shouldInitialize = false;
  Post? get _post => widget.post;
  BlocGroup get _blocGroup => widget.blocGroup;

  @override
  initState() {
    Post postItem;
    if (_post == null) {
      postItem = const Post(type: TimelinePostType.post);
    } else {
      postItem = _post!;
    }

    setState(() {
      post = postItem;
      _shouldInitialize = widget.shouldInitialize;
    });

    if (_shouldInitialize) {
      _blocGroup.postBloc.add(PostEvent.getPost(postId: post.id));
    }
    super.initState();
  }

  void _listenableHandler(BuildContext context, PostState state) {
    if (state.action == PostListenableAction.rehydratedPostSuccess) {
      setState(() {
        _shouldInitialize = false;
        post = state.rehydratedPost!;
      });
    }

    if (state.action == PostListenableAction.rehydratedPostFailure) {
      setState(() {
        _hasError = true;
        // _shouldInitialize = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: _buildAppBar(),
        body: BlocListener<PostBloc, PostState>(
          bloc: widget.blocGroup.postBloc,
          listener: _listenableHandler,
          child: ConditionalRenderDelegate(
              condition: _shouldInitialize,
              renderWidget: ConditionalRenderDelegate(
                  condition: _hasError,
                  renderWidget: const Center(
                      child: Text(
                    "An error occured",
                    style: TextStyle(fontSize: 12),
                  )),
                  fallbackWidget: const Center(
                      child: LoadingIndicator(size: Size(40, 40)))),
              fallbackWidget: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: PostItem(post: post, blocGroup: _blocGroup))),
        ));
  }

  AppBar _buildAppBar() {
    String _header = ""; // "${post.user.username}'s post";
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 20)),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text(_header,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6))),
          ),
          const Center()
        ]));
  }
}
