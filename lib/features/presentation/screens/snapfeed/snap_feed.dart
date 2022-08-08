import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/snap_player/snaps.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

import '../../widgets/button_overlay.dart';

class SnapFeedScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  const SnapFeedScreen({Key? key, required this.blocGroup}) : super(key: key);

  @override
  State<SnapFeedScreen> createState() => _SnapFeedScreenState();
}

class _SnapFeedScreenState extends State<SnapFeedScreen>
    with AutomaticKeepAliveClientMixin<SnapFeedScreen> {
  BlocGroup get _blocGroup => widget.blocGroup;
  final PageController _pageController = PageController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _navigateToCamera() async {
    Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
      child:
          CameraScreen(mode: CameraSelectionMode.snap, blocGroup: _blocGroup),
    ));
  }

  Future<void> _onRefresh() {
    return Future.sync(
      () async {
        _blocGroup.snapBloc.add(const SnapEvent.initialize());
        await Future.delayed(const Duration(milliseconds: 2000));
        _refreshController.refreshCompleted();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: SmartRefresher(
            enablePullUp: false,
            enablePullDown: true,
            onRefresh: _onRefresh,
            controller: _refreshController,
            header: CustomHeader(
                builder: (BuildContext context, RefreshStatus? mode) {
              if (mode == RefreshStatus.refreshing) {
                return const Center(
                    child: LoadingIndicator(size: Size(40, 40)));
              }

              return const Center();
            }),
            child: BlocConsumer<SnapBloc, SnapState>(
                bloc: _blocGroup.snapBloc,
                listener: (
                  BuildContext context,
                  SnapState state,
                ) {
                  if (state.action == SnapListenableAction.created) {
                    log('created');
                    _pageController.jumpToPage(0);
                    _blocGroup.snapBloc.add(const SnapEvent.initialize());

                    getService<AppRouter>().context.dismissToast();
                  }

                  if (state.action == SnapListenableAction.creationFailure ||
                      state.action == SnapListenableAction.likeFailure ||
                      state.action == SnapListenableAction.unLikeFailure ||
                      state.action == SnapListenableAction.deteleFailure) {
                    getService<AppRouter>().context.showToast(
                        content: const Text('Something went wrong',
                            style: TextStyle(color: Colors.white)),
                        type: SnackBarType.error);
                  }
                },
                builder: (
                  BuildContext context,
                  SnapState state,
                ) {
                  return Stack(children: [
                    _determineQuickRender(state),
                    _headerWidget(state),
                  ]);
                })));
  }

  Widget _determinePaginationRender(SnapState state) {
    late final Widget widget;
    if (state.isPaginationLoading) {
      widget = const LoadingIndicator(size: Size(40, 40));
    } else if (state.paginationError != null) {
      widget = Text(
        state.paginationError!,
        style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.3)),
      );
    } else {
      widget = const Center();
    }

    return Positioned(left: 0, right: 0, bottom: 0, child: widget);
  }

  Widget _determineQuickRender(SnapState state) {
    switch (state.currentState) {
      case SnapStatus.loading:
        return _quickLoading();
      case SnapStatus.error:
        return _quickError(state.error ?? '');
      case SnapStatus.loaded:
        return _quickList(state);
      default:
        return const Center();
    }
  }

  Widget _quickList(SnapState state) {
    if (state.snaps.isEmpty) {
      return _emptyQuicks();
    }

    return Stack(
      children: [
        PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: state.controllers.length,
            onPageChanged: (i) {
              setState(() {
                currentIndex = i;
              });

              _blocGroup.snapBloc.add(SnapEvent.onSnapChange(index: i));

              if (i + 1 == state.snaps.length &&
                  !state.reachedMaximumThreshold) {
                _blocGroup.snapBloc.add(const SnapEvent.getPaginatedSnaps());
              }
            },
            itemBuilder: (
              BuildContext context,
              int itemIndex,
            ) {
              if (state.focusedIndex == itemIndex &&
                  state.controllers.isNotEmpty) {
                return Snaps(
                  blocGroup: _blocGroup,
                  snap: state.snaps[itemIndex],
                  pageController: _pageController,
                  controller: state.controllers[itemIndex],
                );
              } else {
                return const Center();
              }
            }),
        _determinePaginationRender(state)
      ],
    );
  }

  Widget _headerWidget(SnapState state) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Snaps',
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  fontWeight: FontWeight.normal)),
          GestureDetector(
            onTap: _navigateToCamera,
            child: ConditionalRenderDelegate(
                condition: state.snaps.isEmpty,
                renderWidget: ButtonOverlay(
                    child: SvgPicture.asset(Assets.icons.cameraIconOutlineSvg,
                        height: 20, width: 20, color: Colors.white)),
                fallbackWidget: const ButtonOverlay(
                    child: Icon(CupertinoIcons.camera_fill, size: 20))),
          ),
        ]));
  }

  Widget _emptyQuicks() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () => _navigateToCamera(),
            child: SvgPicture.asset(
              Constants.cameraIconOutline,
              width: 24,
              height: 24,
              color: Colors.white,
            )),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 7),
            child: Text("Be the first to post a snap",
                style: TextStyle(fontSize: 13)),
          ),
        )
      ],
    );
  }

  Widget _quickError(String error) {
    return ErrorDisplay(error: error);
  }

  Widget _quickLoading() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .80,
        child: const Center(
            child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }
}
