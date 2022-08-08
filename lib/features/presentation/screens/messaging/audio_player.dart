import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:just_audio/just_audio.dart' as a;
import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:frienderr/features/presentation/screens/messaging/audio_visualizer.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer>
    with TickerProviderStateMixin {
  int pos = 0;
  int _duration = 0;
  int _barCount = 10;
  bool _isIntial = false;
  bool _isPlaying = false;
  final player = a.AudioPlayer();
  double _mSubscriptionDuration = 0;
  StreamSubscription? _mPlayerSubscription;
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  final List<AnimationController> animationControllers = [];

  final List<Color> _colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  final List<int> _durations = [
    200,
    2500,
    300,
    800,
    500,
    300,
    1120,
    850,
    150,
    900,
    300,
    1300,
    1000,
    150,
    750
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    stopPlayer(_mPlayer);
    _disposeControllers();
    _mPlayer.closePlayer();
    cancelPlayerSubscriptions();

    super.dispose();
  }

  void cancelPlayerSubscriptions() {
    if (_mPlayerSubscription != null) {
      _mPlayerSubscription!.cancel();
      _mPlayerSubscription = null;
    }
  }

  void _initializeControllers() {
    for (int i = 0; i < _durations.length; i++) {
      animationControllers.add(AnimationController(
          duration: Duration(milliseconds: _durations[i]), vsync: this));
    }
  }

  void _playControllers() {
    for (int i = 0; i < _durations.length; i++) {
      animationControllers[i].repeat(reverse: true);
    }
  }

  void _pauseControllers() {
    for (int i = 0; i < _durations.length; i++) {
      animationControllers[i].stop();
    }
  }

  void _disposeControllers() {
    for (int i = 0; i < _durations.length; i++) {
      animationControllers[i].removeListener(() {});
      animationControllers[i].removeStatusListener((status) {});
      animationControllers[i].stop();
      animationControllers[i].reset();
      animationControllers[i].dispose();
    }
  }

  Future<void> initialize() async {
    var duration = await player.setUrl(widget.url);
    setState(() {
      _duration = duration!.inSeconds;
    });
    await _mPlayer.openPlayer();
    _mPlayerSubscription = _mPlayer.onProgress!.listen((e) {
      setState(() {
        pos = e.position.inMilliseconds;
      });
    });
  }

  void _play() async {
    setState(() {
      _isPlaying = true;
      _isIntial = true;
    });
    _playControllers();
    await _mPlayer.startPlayer(
        fromURI: widget.url,
        codec: Codec.aacADTS,
        whenFinished: () {
          _pauseControllers();
          setState(() {
            _isPlaying = false;
          });
        });
  }

  void _pause() async {
    await _mPlayer.pausePlayer();
    _pauseControllers();
    setState(() {
      _isPlaying = false;
    });
  }

  Future<void> stopPlayer(FlutterSoundPlayer player) async {
    await player.stopPlayer();
  }

  Future<void> setSubscriptionDuration(
      double d) async // v is between 0.0 and 2000 (milliseconds)
  {
    _mSubscriptionDuration = d;
    setState(() {});
    await _mPlayer.setSubscriptionDuration(
      Duration(milliseconds: d.floor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 165,
        height: 57,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  if (_isPlaying) {
                    _pause();
                  } else {
                    _play();
                  }
                },
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 27)),
            ConditionalRenderDelegate(
                condition: _isIntial,
                renderWidget: MusicVisualizer(
                    colors: _colors,
                    duration: _durations,
                    barCount: _barCount,
                    animationController: animationControllers),
                fallbackWidget: Text(
                    '${((_duration) ~/ 60).toString().padLeft(2)}: ${((_duration)).toString().padLeft(2, '0')}',
                    style: TextStyle(
                        fontSize:
                            ResponsiveFlutter.of(context).fontSize(1.45))))
          ],
        ));
  }
}
