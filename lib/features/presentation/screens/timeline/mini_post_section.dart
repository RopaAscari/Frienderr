import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/widgets/gallery_picker/gallery_picker.dart';
import 'package:frienderr/features/presentation/widgets/mini_image_slider.dart';

class MiniPostSection extends StatefulWidget {
  const MiniPostSection({Key? key, required this.user, required this.postBloc})
      : super(key: key);

  final UserModel? user;
  final PostBloc postBloc;

  @override
  State<MiniPostSection> createState() => _MiniPostSectionState();
}

class _MiniPostSectionState extends State<MiniPostSection> {
  double _opacity = 0.5;
  List<GalleryAsset> _assets = [];
  UserModel? get _user => widget.user;
  PostBloc get _postBloc => widget.postBloc;
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
    _postBloc.add(PostEvent.createStatusPost(status: captionController.text));
    FocusScope.of(context).unfocus();
    captionController.clear();
    Navigator.pop(ctx, 'OK');
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
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[900]!.withOpacity(0.5)),
            boxShadow: const [
              BoxShadow(),
            ],
            color: Colors.grey[800]!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: child);
  }

  Widget _buildCamera() {
    return const Center();
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
                          print('picked');
                          setState(() {
                            _assets = assets;
                          });
                        },
                      ),
                    ));
                  },
                  child: SvgPicture.asset(Assets.icons.postIcon,
                      height: 24, width: 24, color: Colors.red[700])),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Assets.icons.emojiIcon
                      .image(height: 22, width: 22, color: Colors.green[700])),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(
                    CupertinoIcons.camera,
                    color: Colors.blue[400],
                    size: 24,
                  ))
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
            borderRadius: BorderRadius.circular(8),
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
                borderRadius: BorderRadius.circular(8.0),
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
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.4)),
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
