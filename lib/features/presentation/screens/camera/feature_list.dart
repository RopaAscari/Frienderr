import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';

class FeatureListItem {
  final String icon;
  final String title;
  final CameraFeatureMode mode;
  const FeatureListItem({
    required this.icon,
    required this.mode,
    required this.title,
  });
}

class SelectionModeItem {
  final String icon;
  final String title;
  final CameraSelectionMode mode;
  const SelectionModeItem({
    required this.icon,
    required this.mode,
    required this.title,
  }) : super();
}

const List<FeatureListItem> featureList = [
  FeatureListItem(
    title: "Flash",
    mode: CameraFeatureMode.flash,
    icon: 'assets/icons/flash_icon.svg',
  ),
  /*FeatureListItem(
    title: "Filters",
    mode: CameraFeatureMode.filter,
    icon: 'assets/icons/filter_icon.svg',
  ),
  FeatureListItem(
    title: "Timer",
    mode: CameraFeatureMode.timer,
    icon: 'assets/icons/timer_icon.svg',
  )*/
];

const List<SelectionModeItem> selectionModes = [
  SelectionModeItem(
    title: "Post",
    mode: CameraSelectionMode.post,
    icon: 'assets/icons/post_icon.svg',
  ),
  SelectionModeItem(
    title: "Story",
    mode: CameraSelectionMode.story,
    icon: 'assets/icons/story_icon.svg',
  ),
  SelectionModeItem(
    title: "Snap",
    mode: CameraSelectionMode.snap,
    icon: 'assets/icons/quick_icon.svg',
  )
];

const List<FeatureListItem> subFeatureList = [
  FeatureListItem(
    title: "Artboard",
    mode: CameraFeatureMode.artboard,
    icon: 'assets/icons/artboard_icon.svg',
  ),
];
