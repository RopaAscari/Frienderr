import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:frienderr/features/presentation/screens/messaging/audio_timer.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AudioRecorder extends StatefulWidget {
  const AudioRecorder(
      {Key? key,
      required this.onRecordingStart,
      required this.onRecordingEnd,
      required this.onRecordingCancel})
      : super(key: key);
  final Function onRecordingStart;
  final Function(File) onRecordingEnd;
  final Function() onRecordingCancel;
  @override
  AudioRecorderState createState() => AudioRecorderState();
}

class AudioRecorderState extends State<AudioRecorder>
    with SingleTickerProviderStateMixin {
  int _duration = 0;
  double _decibel = 0;
  bool _isLocked = false;
  bool _isRecording = false;
  Codec _codec = Codec.aacMP4;
  bool _mplaybackReady = false;
  String _mPath = 'tau_file.mp4';
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  StreamSubscription? _recorderSubscription;
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _mRecorder!.closeRecorder();
    _mRecorder = null;
    _cancelRecorderSubscriptions();
    super.dispose();
  }

  Future<void> _initialize() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;

    _recorderSubscription = _mRecorder!.onProgress!.listen((e) {
      setState(() {
        _duration = e.duration.inMilliseconds;
        if (e.decibels != null) {
          _decibel = e.decibels as double;
        }
      });
    });

    setState(() {
      _mRecorderIsInited = true;
    });
  }

  void _cancelRecorderSubscriptions() {
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  void _startRecorder() {
    setState(() {
      _isRecording = true;
    });
    widget.onRecordingStart();
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
    )
        .then((value) {
      setState(() {});
    });
  }

  void lockRecorder() async {
    setState(() {
      _isLocked = true;
    });
  }

  void cancelRecorder() async {
    final String? file = await _mRecorder!.stopRecorder();

    _mRecorder!.deleteRecord(fileName: file ?? '');
    setState(() {
      _isRecording = false;
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      widget.onRecordingEnd(File(value as String));
      setState(() {
        _isRecording = false;
        _mplaybackReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConditionalRenderDelegate(
            condition: _isRecording,
            renderWidget: const OtpTimer(),
            // ignore: prefer_const_constructors
            fallbackWidget: Center()),
        ConditionalRenderDelegate(
          condition: !_isLocked || !_isRecording,
          renderWidget: LongPressDraggable<RecordingState>(
            data: RecordingState.onRecord,
            feedback: SvgPicture.asset(
              Constants.messageUnlockIcon,
              width: 30,
              height: 30,
              color: Colors.grey[400]!,
            ),
            onDragStarted: () {
              _startRecorder();
            },
            onDragEnd: (d) {
              if (!_isLocked) {
                stopRecorder();
              }
            },
            child: Container(
                padding: EdgeInsets.all(_isRecording ? 10 : 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _isRecording ? Colors.white : Colors.transparent),
                child: Icon(
                  CupertinoIcons.mic,
                  size: 23,
                  color: _isRecording ? Colors.red[600]! : Colors.grey[400]!,
                )),
          ),
          fallbackWidget: GestureDetector(
              onTap: () async {
                setState(() {
                  _isLocked = false;
                });
                stopRecorder();
              },
              child: Container(
                padding: EdgeInsets.all(_isRecording ? 10 : 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _isRecording ? Colors.white : Colors.transparent),
                child: Icon(
                  Icons.send,
                  size: 27,
                  color: Colors.red[600]!,
                ),
              )),
        )
      ],
    );
  }
}
