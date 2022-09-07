import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/widgets/gallery_picker/gallery_picker.dart';
import 'package:frienderr/features/presentation/widgets/mini_image_slider.dart';

class MiniPostSection extends StatefulWidget {
  const MiniPostSection({Key? key, required this.user, required this.blocGroup})
      : super(key: key);

  final UserModel? user;
  final BlocGroup blocGroup;

  @override
  State<MiniPostSection> createState() => _MiniPostSectionState();
}

class _MiniPostSectionState extends State<MiniPostSection> {
  double _opacity = 0.5;
  List<GalleryAsset> _assets = [];
  UserModel? get _user => widget.user;
  BlocGroup get _blocGroup => widget.blocGroup;
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
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

  void _handlePost(BuildContext ctx) {
    if (_assets.isEmpty) {
      _blocGroup.postBloc
          .add(PostEvent.createStatusPost(status: captionController.text));
    } else {
      _blocGroup.postBloc.add(PostEvent.createPost(
          caption: captionController.text, assets: _assets));
    }

    FocusScope.of(context).unfocus();
    captionController.clear();
    Navigator.pop(ctx, 'OK');
  }

  void _showEmoji() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
              height: 250,
              child: EmojiPicker(
                textEditingController: captionController,
                config: Config(
                  columns: 7,
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: const Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  showRecentsTab: true,
                  recentsLimit: 28,
                  replaceEmojiOnLimitExceed: false,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                  //loadingIndicator: const SizedBox.shrink(),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                  //checkPlatformCompatibility: true,
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildContainer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(_user!.profilePic!),
            radius: 20,
          ),
          _buildTexField()
        ]),
        _buildPostActions(),
        _buildMiniImageSlider()
      ],
    ));
  }

  Widget _buildMiniImageSlider() {
    if (_assets.isEmpty) {
      return const Center();
    }
    return MiniImageSlider(assets: _assets);
  }

  void _buildPostDialog() {
    if (captionController.text.isEmpty) {
      return;
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Create Post',
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(1.6))),
        content: Text('Are you sure you want to create this post',
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(1.4))),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(ctx, 'OK');
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () => _handlePost(ctx),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[900]!.withOpacity(0.5)),
            boxShadow: const [
              BoxShadow(),
            ],
            color: Theme.of(context).canvasColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        child: child);
  }

  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
                      child: GalleryPicker(
                        onPicked: (assets) {
                          setState(() {
                            _assets = assets;
                          });
                        },
                      ),
                    ));
                  },
                  child: SvgPicture.asset(Assets.icons.postIcon,
                      height: 24, width: 24, color: Colors.red[700])),
              /* GestureDetector(
                  onTap: () {
                    _showEmoji();
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Assets.icons.emojiIcon.image(
                          height: 22, width: 22, color: Colors.green[700])))*/
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
                    child: CameraScreen(
                        mode: CameraSelectionMode.post, blocGroup: _blocGroup),
                  ));
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      CupertinoIcons.camera,
                      color: Colors.blue[400],
                      size: 24,
                    )),
              )
            ],
          ),
          _buildPostButton()
        ],
      ),
    );
  }

  Widget _buildPostButton() {
    return Opacity(
      opacity: _opacity,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              stops: const [0.0, 1.0],
              end: const Alignment(1.0, 0.0),
              begin: const Alignment(-0.95, 0.0),
              colors: [HexColor('#E09810'), HexColor('#FEDA43')],
            ),
          ),
          child: MaterialButton(
            height: 35,
            minWidth: 80,
            onPressed: _buildPostDialog,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
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
                fontSize: ResponsiveFlutter.of(context).fontSize(1.4)),
            controller: captionController,
            decoration: InputDecoration(
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.grey[600]!, fontSize: 13.5),
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
                labelText: "What's on your mind",
                contentPadding: const EdgeInsets.only(top: 30.0, left: 10.0))));
  }
}
