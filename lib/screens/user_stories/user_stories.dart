import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:story_view/controller/story_controller.dart';

class ViewUserStory extends StatefulWidget {
  final int timeElasped;
  final dynamic stories;
  final dynamic storyUser;
  final bool isOwnerViewing;
  ViewUserStory({
    Key? key,
    required this.stories,
    required this.storyUser,
    required this.timeElasped,
    required this.isOwnerViewing,
  }) : super(key: key);

  UserStoryState createState() => UserStoryState();
}

class UserStoryState extends State<ViewUserStory> {
  bool areStoriesReady = false;
  List<StoryItem> storyItems = [];
  dynamic get stories => widget.stories;
  final storyController = StoryController();
  dynamic get storyUser => widget.storyUser;
  dynamic get timeElasped => widget.timeElasped;
  bool get isOwnerViewing => widget.isOwnerViewing;

  @override
  void initState() {
    for (Map story in stories) {
      if (story['type'] == 'image') {
        storyItems.add(StoryItem.pageImage(
            url: story['media'], controller: storyController));
      } else {
        storyItems.add(
            StoryItem.pageVideo(story['media'], controller: storyController));
      }
    }
    List<StoryItem> reversedList = new List.from(storyItems.reversed);
    setState(() {
      storyItems = reversedList;
      areStoriesReady = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  storySlideUpAction() {
    storyController.pause();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Container(
              // decoration: BoxDecoration(color: Colors.white),
              child: Column(children: [
            Text('\nViewers',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 20))
          ])),
        );
      },
    ).whenComplete(() {
      storyController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(TimeElapsed().elapsedTimeDynamic(
                  new DateTime.fromMicrosecondsSinceEpoch(timeElasped)
                      .toString()))),
          actions: <Widget>[]),
      body: areStoriesReady
          ? StoryView(
              storyItems: storyItems,
              onStoryShow: (s) {
                // print("Completed a cycle ${s.duration}");
              },
              onComplete: () {
                //   print("Completed a cycle");
                Navigator.pop(context);
              },
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                } else {
                  isOwnerViewing ? storySlideUpAction() : null;
                }
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: storyController,
            )
          : CircularProgressIndicator(),
    );
  }
}
