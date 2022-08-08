import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class CreatePostButton extends StatefulWidget {
  final PostBloc postBloc;
  final ScrollController scrollController;
  const CreatePostButton(
      {Key? key, required this.scrollController, required this.postBloc})
      : super(key: key);

  @override
  State<CreatePostButton> createState() => _CreatePostButtonState();
}

class _CreatePostButtonState extends State<CreatePostButton> {
  double _opacity = 0.5;
  bool _shouldHide = true;
  PostBloc get _postBloc => widget.postBloc;
  TextEditingController captionController = TextEditingController();
  ScrollController get _scrollController => widget.scrollController;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    captionController.addListener(() {
      if (captionController.text.isEmpty) {
        setState(() {
          _opacity = 0.5;
        });
      } else {
        setState(() {
          _opacity = 1;
        });
      }
    });
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset > 500) {
      setState(() {
        _shouldHide = false;
      });
    } else {
      setState(() {
        _shouldHide = true;
      });
    }
  }

  void _createPost(BuildContext ctx) {
    _postBloc.add(PostEvent.createStatusPost(status: captionController.text));
    FocusScope.of(context).unfocus();
    captionController.clear();
    Navigator.pop(ctx, 'OK');
  }

  Future<dynamic> _openCreatePost() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return SizedBox(
            height: MediaQuery.of(ctx).size.height * .90,
            child: Padding(
                padding: MediaQuery.of(ctx).viewInsets,
                child: Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.black,
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(ctx)),
                            Text("Create post",
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.4))),
                            _buildPostButton(ctx)
                          ]),
                    ),
                    body: Column(children: [_buildTexField()]))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalRenderDelegate(
        condition: _shouldHide,
        renderWidget: const Center(),
        fallbackWidget: GestureDetector(
          onTap: _openCreatePost,
          child: Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: const Alignment(-0.95, 0.0),
                end: const Alignment(1.0, 0.0),
                colors: [HexColor('#E09810'), HexColor('#FEDA43')],
                stops: const [0.0, 1.0],
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ));
  }

  Widget _buildPostButton(BuildContext ctx) {
    return Opacity(
      opacity: _opacity,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              stops: const [0.0, 1.0],
              end: const Alignment(1.0, 0.0),
              begin: const Alignment(-0.95, 0.0),
              colors: [HexColor('#E09810'), HexColor('#FEDA43')],
            ),
          ),
          child: MaterialButton(
            height: 30,
            minWidth: 45,
            onPressed: () => _createPost(ctx),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: const BorderSide(color: Colors.transparent)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text('Post',
                style: TextStyle(
                    color: Colors.white,
                    //   fontWeight: FontWeight.bold,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.55))),
          )),
    );
  }

  Widget _buildTexField() {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 150,
        height: 45,
        child: TextField(
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(1.3)),
            controller: captionController,
            decoration: InputDecoration(
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.3)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  // borderSide: new BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Write Message',
                contentPadding: const EdgeInsets.only(top: 30.0, left: 10.0))));
  }
}
