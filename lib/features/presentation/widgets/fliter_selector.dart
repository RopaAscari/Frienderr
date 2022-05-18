import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:frienderr/features/presentation/delegates/carousel_flow_delegate.dart';

class FliterSelector<T> extends StatefulWidget {
  final List<FilterSelectorItem<T>> filters;
  final void Function(T selected) onFilterChanged;
  final EdgeInsets padding;
  const FliterSelector({
    Key? key,
    required this.filters,
    required this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 0.0),
  }) : super(key: key);

  @override
  State<FliterSelector> createState() => _FliterSelectorState();
}

class _FliterSelectorState extends State<FliterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  int get filterCount => widget.filters.length;

  //Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page].value as dynamic);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 150,
        width: MediaQuery.of(context).size.width,
        child: Scrollable(
          controller: _controller,
          axisDirection: AxisDirection.right,
          physics: const PageScrollPhysics(),
          viewportBuilder: (context, viewportOffset) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final itemSize =
                    constraints.maxWidth * _viewportFractionPerItem;
                viewportOffset
                  ..applyViewportDimension(constraints.maxWidth)
                  ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _buildCarousel(
                      viewportOffset: viewportOffset,
                      itemSize: itemSize,
                    ),
                    _buildSelectionRing(itemSize)
                  ],
                );
              },
            );
          },
        ));
  }

  Widget _buildCarousel({
    required ViewportOffset viewportOffset,
    required double itemSize,
  }) {
    return Container(
      height: itemSize,
      margin: widget.padding,
      child: Flow(
        delegate: CarouselFlowDelegate(
          viewportOffset: viewportOffset,
          filtersPerScreen: _filtersPerScreen,
        ),
        children: [
          for (int i = 0; i < filterCount; i++)
            FilterItem(
                onFilterSelected: () => _onFilterTapped(i),
                item: widget.filters[i]),
        ],
      ),
    );
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(width: 6.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.item,
    this.onFilterSelected,
  }) : super(key: key);

  final FilterSelectorItem item;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              item.display,
              // color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}

class FilterSelectorItem<T> {
  T value;
  String display;
  FilterSelectorItem({
    required this.value,
    required this.display,
  });
}
