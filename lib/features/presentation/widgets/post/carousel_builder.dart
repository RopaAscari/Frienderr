import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/presentation/widgets/video_screen.dart';
import 'package:frienderr/features/presentation/widgets/image_loading_indicator.dart';
import 'package:frienderr/features/presentation/widgets/fullscreen_carosel.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class PostCarouselBuilder extends StatefulWidget {
  const PostCarouselBuilder(
      {Key? key, required this.post, this.height = 350, this.borderRadius = 10})
      : super(key: key);
  final Post post;
  final double? height;
  final double? borderRadius;

  @override
  State<PostCarouselBuilder> createState() => _PostCarouselBuilderState();
}

class _PostCarouselBuilderState extends State<PostCarouselBuilder> {
  int _currentIndex = 0;
  Post get _post => widget.post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCarousel(),
      ],
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
              itemCount: _post.content.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (i) => setState(() {
                    _currentIndex = i;
                  }),
              itemBuilder: (BuildContext context, int i) {
                return _mediaContainer(
                  _post.content[i],
                  _currentIndex,
                );
              }),
          _buildDotIndicator()
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    final int itemCount = _post.content.length;
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: itemCount,
              effect: ExpandingDotsEffect(
                dotWidth: 6,
                dotHeight: 4,
                activeDotColor: Colors.amber[500]!,
              ),
            )),
      ),
    );
  }

  Widget _mediaContainer(Content content, itemIndex) {
    final String type = content.type;
    final String media = content.media;
    final bool isVideo =
        type == Constants.mediaContainerTypes[MediaContainerType.Image];

    return ConditionalRenderDelegate(
      condition: isVideo,
      fallbackWidget: OpenContainer(
          openElevation: 0,
          closedElevation: 0,
          closedColor: Colors.transparent,
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (BuildContext context, VoidCallback _) {
            return FullScreenCarousel(post: _post);
          },
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: VideoScreen(
                      video: media,
                      onInitialized: (v) {},
                    )));
          }),
      renderWidget: OpenContainer(
          openElevation: 0,
          closedElevation: 0,
          closedColor: Colors.transparent,
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (BuildContext context, VoidCallback _) {
            return FullScreenCarousel(post: _post);
          },
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.borderRadius!),
                    topRight: Radius.circular(widget.borderRadius!)),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                        imageUrl: media,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            ((BuildContext ctx, String _, DownloadProgress __) {
                          return ImageLoadingIndicator(progress: __);
                        }))));
          }),
    );
  }
}
