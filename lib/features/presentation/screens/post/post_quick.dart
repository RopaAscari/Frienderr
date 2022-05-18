import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:video_compress/video_compress.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';

class PostQuickScreen extends StatefulWidget {
  final File file;
  final QuickBloc quickBloc;
  const PostQuickScreen({Key? key, required this.file, required this.quickBloc})
      : super(key: key);

  @override
  State<PostQuickScreen> createState() => _PostQuickScreenState();
}

class _PostQuickScreenState extends State<PostQuickScreen> {
  File get _file => widget.file;
  QuickBloc get _quickBloc => widget.quickBloc;
  final Late<File> _thumbnailFile = Late();
  final TextEditingController _controller = TextEditingController();
  @override
  initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    final File thumbnailFile = await VideoCompress.getFileThumbnail(
        widget.file.path,
        quality: 50,
        position: -1);

    setState(() {
      _thumbnailFile.value = thumbnailFile;
    });
  }

  void _postQuick() {
    _quickBloc
        .add(QuickEvent.createQuick(caption: _controller.text, file: _file));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _appBar(),
            floatingActionButton: _floatingButton(),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ConditionalRenderDelegate(
                              condition: _thumbnailFile.isInitialized,
                              renderWidget: Image.file(_thumbnailFile.value,
                                  height: 250, width: 150),
                              fallbackWidget: const Center())),
                      SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width - 150,
                          child: TextField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Add caption',
                                contentPadding: EdgeInsets.only(left: 20)),
                            controller: _controller,
                          ))
                    ],
                  )),
            )));
  }

  Widget _floatingButton() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: AppButton(
            label: "Upload", isLoading: false, onPressed: () => _postQuick()));
  }

  AppBar _appBar() {
    return AppBar(
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Colors.grey[900]!, width: 1)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Post', style: TextStyle(fontSize: 19))),
        actions: <Widget>[
          IconButton(
              iconSize: 27,
              icon: const Icon(Icons.close),
              onPressed: () => getIt<AppRouter>().pop())
        ]);
  }
}
