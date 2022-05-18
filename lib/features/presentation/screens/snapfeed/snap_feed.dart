import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/widgets/error.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/quicks.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';

class SnapFeed extends StatefulWidget {
  final BlocGroup blocGroup;
  const SnapFeed({Key? key, required this.blocGroup}) : super(key: key);

  @override
  State<SnapFeed> createState() => _SnapFeedState();
}

class _SnapFeedState extends State<SnapFeed>
    with AutomaticKeepAliveClientMixin<SnapFeed> {
  BlocGroup get _blocGroup => widget.blocGroup;

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

  Future<Object?> _navigateToCamera() async {
    return await getIt<AppRouter>().push(
        CameraRoute(mode: CameraSelectionMode.snap, blocGroup: _blocGroup));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: BlocConsumer<QuickBloc, QuickState>(
            bloc: _blocGroup.quickBloc,
            listener: (
              BuildContext context,
              QuickState state,
            ) {
              if (state.action == QuickListenableAction.created) {
                _blocGroup.quickBloc.add(const QuickEvent.initialize());

                getIt<AppRouter>().context.dismissToast();
              }

              if (state.action == QuickListenableAction.creationFailure ||
                  state.action == QuickListenableAction.likeFailure ||
                  state.action == QuickListenableAction.unLikeFailure ||
                  state.action == QuickListenableAction.deteleFailure) {
                getIt<AppRouter>().context.showToast(
                    content: const Text('Something went wrong',
                        style: TextStyle(color: Colors.white)),
                    type: SnackBarType.error);
              }
            },
            builder: (
              BuildContext context,
              QuickState state,
            ) {
              return Stack(children: [
                _determineQuickRender(state),
                _headerWidget(state),
              ]);
            }));
  }

  Widget _determineQuickRender(QuickState state) {
    switch (state.currentState) {
      case QuickStatus.loading:
        return _quickLoading();
      case QuickStatus.error:
        return _quickError(state.error ?? '');
      case QuickStatus.loaded:
        return _quickList(state);
      default:
        return const Center();
    }
  }

  Widget _quickList(QuickState state) {
    if (state.quicks.isEmpty) {
      return _emptyQuicks();
    }

    return CarouselSlider.builder(
        itemCount: state.controllers.length,
        options: CarouselOptions(
          initialPage: 0,
          autoPlay: false,
          viewportFraction: 1,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
          height: MediaQuery.of(context).size.height,
          onPageChanged: (i, v) => setState(() {
            currentIndex = i;

            _blocGroup.quickBloc.add(QuickEvent.onSnapChange(index: i));
          }),
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          if (state.focusedIndex == itemIndex && state.controllers.isNotEmpty) {
            return Quicks(
              quick: state.quicks[itemIndex],
              controller: state.controllers[itemIndex],
            );
          } else {
            return const Center();
          }
        });
  }

  Widget _headerWidget(QuickState state) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Snaps',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal)),
          ConditionalRenderDelegate(
              condition: state.quicks.isEmpty,
              renderWidget: IconButton(
                  onPressed: () => null,
                  icon: const Icon(CupertinoIcons.camera,
                      color: Colors.transparent, size: 25)),
              fallbackWidget: IconButton(
                  onPressed: () => _navigateToCamera(),
                  icon: const Icon(CupertinoIcons.camera,
                      color: Colors.white, size: 25))),
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
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 7),
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
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: LoadingIndicator(size: Size(40, 40)))));
  }
}
