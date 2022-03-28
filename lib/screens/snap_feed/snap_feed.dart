import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frienderr/widgets/quicks/quicks.dart';
import 'package:frienderr/blocs/quick/quick_bloc.dart';
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';

class SnapFeed extends StatefulWidget {
  final QuickBloc quickBloc;
  const SnapFeed({Key? key, required this.quickBloc}) : super(key: key);

  @override
  State<SnapFeed> createState() => _SnapFeedState();
}

class _SnapFeedState extends State<SnapFeed>
    with AutomaticKeepAliveClientMixin<SnapFeed> {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<QuickBloc, QuickState>(
        bloc: widget.quickBloc,
        listener: (
          BuildContext context,
          QuickState state,
        ) {},
        builder: (
          BuildContext context,
          QuickState state,
        ) {
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
                  widget.quickBloc.add(QuickEvent.onSnapChange(index: i));
                }),
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                if (state.focusedIndex == itemIndex &&
                    state.controllers.length > 0) {
                  return Quicks(
                    controller: state.controllers[itemIndex],
                  );
                } else {
                  return Center();
                }
              });
        });
  }
}
