import 'dart:async';
import 'dart:ui' as ui;
import 'package:frienderr/core/services/route_builder.dart';
import 'package:frienderr/features/presentation/screens/messaging/attachment_button.dart';
import 'package:frienderr/features/presentation/screens/messaging/input_toolbar.dart';
import 'package:frienderr/features/presentation/widgets/gallery_picker/gallery_picker.dart';
import 'package:frienderr/features/presentation/widgets/user_avatar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/presentation/widgets/gallery.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/messaging/chat_bubble.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/screens/messaging/audio_recorder.dart';
import 'package:frienderr/features/presentation/screens/messaging/typing_indicator.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';
import 'package:frienderr/features/presentation/screens/messaging/typing_indicator_builder.dart';

class MessagingScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final MessagingMetaDataEntity metadata;

  // ignore: use_key_in_widget_constructors
  const MessagingScreen(
      {required this.metadata, required this.blocGroup, Key? key});

  @override
  MessagingState createState() => MessagingState();
}

class MessagingState extends State<MessagingScreen> {
  int i = 0;
  Timer? _debounce;
  bool _isTyping = false;
  bool _isReplying = false;
  late final ChatUser _user;
  bool _isRecording = false;
  bool _isLocked = false;
  final List<ChatUser> _typingUsers = [];
  String get _chatId => _metadata.chatId;
  final Late<ChatMessage?> _replyMessage = Late();
  final List<ChatMessage> _m = <ChatMessage>[];
  List<ChatMessage> _messages = <ChatMessage>[];
  String get _uid => widget.metadata.chatUser.id;
  String get _pid => widget.metadata.chatRecipient.id;
  MessagingMetaDataEntity get _metadata => widget.metadata;
  final DateFormat _dateFormat = DateFormat.yMMMMd('en_US');
  final GlobalKey<AudioRecorderState> _globalKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<MessagingState> _chatViewKey = GlobalKey<MessagingState>();

  @override
  initState() {
    _user = ChatUser(
      id: _uid,
      customProperties: {},
      firstName: _metadata.chatUser.username,
      profileImage: _metadata.chatUser.profilePic,
    );
    final chat = ChatDTO(
      typing: [],
      id: _chatId,
      unread: {_uid: 0, _pid: 0},
      participants: [_uid, _pid],
      dateUpdated: DateTime.now().microsecondsSinceEpoch,
    );

    setState(() {
      _typingUsers.add(ChatUser(id: _pid));
    });

    widget.blocGroup.chatBloc.add(ChatEvent.instantiateChat(chat: chat));

    super.initState();

    _controller.addListener(() {
      if (!_isTyping) {
        _isTyping = true;
        widget.blocGroup.chatBloc
            .add(ChatEvent.startTyping(uid: _uid, chatId: _chatId));
      }

      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 700), () {
        _isTyping = false;
        widget.blocGroup.chatBloc
            .add(ChatEvent.stopTyping(uid: _uid, chatId: _chatId));
      });

      _messageStream.listen((event) {});
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // print('depencies changed');
    super.didChangeDependencies();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get _messageStream {
    return FirebaseFirestore.instance
        .collection(Collections.chats)
        .doc(_chatId)
        .collection(Collections.messages)
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> get _chatStream {
    return FirebaseFirestore.instance
        .collection(Collections.chats)
        .doc(_chatId)
        .snapshots();
  }

  Future<void> _onSend(ChatMessage message) async {
    widget.blocGroup.messageBloc.add(
        MessageEvent.sendMessage(pid: _pid, chatId: _chatId, message: message));
  }

  void _systemMessage() {
    Timer(const Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          _messages = [..._messages, _m[i]];
        });
        i++;
      }
      Timer(const Duration(milliseconds: 300), () {});
    });
  }

  void _openGallery() async {
    Navigator.of(context).push(RouteBuilder.createAnimatedRoute(
      child: GalleryPicker(
        onPicked: (assets) {
          List<MultimediaMessage> _multimediaMessages = assets.map((asset) {
            return MultimediaMessage(
              asset: asset,
              message: ChatMessage(
                id: Helpers.generateId(25),
                user: ChatUser(
                  id: _metadata.chatUser.id,
                  firstName: _metadata.chatUser.username,
                  profileImage: _metadata.chatUser.profilePic,
                ),
                createdAt: DateTime.now(),
              ),
            );
          }).toList();

          widget.blocGroup.messageBloc.add(MessageEvent.sendMultimediaMessages(
              pid: _pid, chatId: _chatId, messages: _multimediaMessages));
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(fit: StackFit.expand, children: [
              BlocConsumer<MessageBloc, MessageState>(
                  bloc: widget.blocGroup.messageBloc,
                  listener: (BuildContext context, MessageState state) {
                    if (state.action ==
                        MessageListenableAction.sendMessageSuccess) {}
                  },
                  builder: (BuildContext context, MessageState state) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: _messageStream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            );
                          } else {
                            List<DocumentSnapshot> items = snapshot.data!.docs;

                            List<ChatMessage> messages = items.map((i) {
                              return ChatMessage.fromJson(i.data()! as dynamic);
                            }).toList();

                            return DashChat(
                              onSend: _onSend,
                              key: _chatViewKey,
                              messages: messages,
                              currentUser: _user,
                              typingUsers: const [],
                              emptyMessageBuilder: _buildEmptyMessage(),
                              inputOptions: InputOptions(
                                inputMaxLines: 5,
                                sendOnEnter: true,
                                textController: _controller,
                                inputToolbarStyle: BoxDecoration(
                                    border: Border(
                                  top: BorderSide(
                                    width: 0.8,
                                    color: Colors.grey[900]!,
                                  ),
                                )),
                                inputToolbarMargin:
                                    const EdgeInsets.only(top: 10),
                                inputToolbarPadding:
                                    const EdgeInsets.only(top: 0, bottom: 5),
                                textInputAction: TextInputAction.send,
                                sendButtonBuilder: (onSend) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                          onTap: () async {
                                            onSend();
                                          },
                                          child: SvgPicture.asset(
                                            Constants.messageSendIconFill,
                                            width: 22,
                                            height: 22,
                                            color: HexColor('#FA5B8E'),
                                          )));
                                },
                                leading: <Widget>[
                                  ConditionalRenderDelegate(
                                      condition: !_isRecording,
                                      fallbackWidget: const Center(),
                                      renderWidget: AttachmentButton(
                                          onPressed: _openGallery))
                                ],
                                trailing: <Widget>[
                                  Row(
                                    children: [
                                      ConditionalRenderDelegate(
                                          condition: !_isRecording,
                                          fallbackWidget: const Center(),
                                          renderWidget: IconButton(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            color: Colors.grey[400]!,
                                            icon: const Icon(
                                                CupertinoIcons.camera,
                                                size: 22),
                                            onPressed: () {},
                                          )),
                                      AudioRecorder(
                                        key: _globalKey,
                                        onRecordingEnd: (_file) {
                                          setState(() {
                                            _isLocked = false;
                                            _isRecording = false;
                                          });
                                          final _message = ChatMessage(
                                            id: Helpers.generateId(25),
                                            user: ChatUser(
                                              customProperties: {},
                                              id: _metadata.chatUser.id,
                                              firstName:
                                                  _metadata.chatUser.username,
                                              profileImage:
                                                  _metadata.chatUser.profilePic,
                                            ),
                                            createdAt: DateTime.now(),
                                          );
                                          widget.blocGroup.messageBloc.add(
                                              MessageEvent.sendAudioMessage(
                                                  pid: _pid,
                                                  file: _file,
                                                  chatId: _chatId,
                                                  message: _message));
                                        },
                                        onRecordingStart: () {
                                          setState(() {
                                            _isRecording = true;
                                          });
                                        },
                                        onRecordingCancel: () {
                                          setState(() {
                                            _isLocked = false;
                                            _isRecording = false;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                                inputDecoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    hintText: _isRecording
                                        ? "Slide to cancel"
                                        : "Type a message",
                                    hintStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    labelStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                      //  borderSide: BorderSide(color: Colors.grey[800]!),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    prefixIcon: _isRecording
                                        ? DragTarget<RecordingState>(
                                            onLeave: (value) => true,
                                            onAccept: (value) => _globalKey
                                                .currentState
                                                ?.cancelRecorder(),
                                            onWillAccept: (value) => true,
                                            builder:
                                                (context, candidates, rejects) {
                                              return GestureDetector(
                                                  onTap: () async {
                                                    _globalKey.currentState
                                                        ?.stopRecorder();
                                                  },
                                                  child: Icon(
                                                      Icons.delete_rounded,
                                                      color: candidates
                                                              .isNotEmpty
                                                          ? Colors.red[800]
                                                          : Colors.grey[400],
                                                      size: 30));
                                            })
                                        : null,
                                    focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.grey[800]!),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    border: OutlineInputBorder(
                                      //   borderSide: BorderSide(color: Colors.grey[800]!),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    fillColor: _isRecording
                                        ? Colors.transparent
                                        : Colors.transparent
                                    //HexColor('#0D0E0E').withOpacity(0.7),
                                    ),
                              ),
                              messageOptions: MessageOptions(
                                showTime: true,
                                showCurrentUserAvatar: true,
                                timeFormat: DateFormat('HH:mm'),
                                messageRowBuilder: (ChatMessage _message,
                                    ChatMessage? _previousMessage,
                                    ChatMessage? _nextMessage,
                                    bool _isAfterDateSeparator,
                                    bool _isBeforeDateSeparator) {
                                  bool _isLast = false;
                                  if (_message.status != MessageStatus.read &&
                                      _message.user.id != _uid) {
                                    widget.blocGroup.messageBloc.add(
                                        MessageEvent.seenMessage(
                                            chatId: _chatId,
                                            messageId: _message.id));
                                  }

                                  bool isPreviousSameAuthor = false;
                                  bool isNextSameAuthor = false;
                                  if (_previousMessage != null &&
                                      _previousMessage.user.id ==
                                          _message.user.id) {
                                    isPreviousSameAuthor = true;
                                  }
                                  if (_nextMessage != null &&
                                      _nextMessage.user.id ==
                                          _message.user.id) {
                                    isNextSameAuthor = true;
                                  }

                                  return ChatBubble(
                                    chatId: _chatId,
                                    message: _message,
                                    onReply: (message) {
                                      setState(() {
                                        _isReplying = true;
                                        _replyMessage.value = message;
                                      });
                                    },
                                    isNextSameAuthor: isNextSameAuthor,
                                    isBeforeDateSeparator:
                                        _isBeforeDateSeparator,
                                    isPreviousSameAuthor: isPreviousSameAuthor,
                                    messageBloc: widget.blocGroup.messageBloc,
                                    isMine: _message.user.id ==
                                        _metadata.chatUser.id,
                                    isLast: _isLast,
                                  );
                                },
                              ),
                              messageListOptions: MessageListOptions(
                                  dateSeparatorBuilder: (date) {
                                    return Text(_dateFormat.format(date),
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.35),
                                            color: Colors.grey[500]));
                                  },
                                  chatFooterBuilder: Column(
                                    children: [
                                      ConditionalRenderDelegate(
                                        condition: _isRecording,
                                        renderWidget: Column(
                                          children: [
                                            SiriWave(
                                              controller: SiriWaveController(),
                                              options: SiriWaveOptions(
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                              style: SiriWaveStyle.ios_9,
                                            ),
                                            ConditionalRenderDelegate(
                                                condition:
                                                    !_isLocked && _isRecording,
                                                renderWidget: DragTarget<
                                                        RecordingState>(
                                                    onLeave: (value) => true,
                                                    onAccept: (value) {
                                                      _globalKey.currentState
                                                          ?.lockRecorder();
                                                      setState(() {
                                                        _isLocked = true;
                                                      });
                                                    },
                                                    onWillAccept: (value) =>
                                                        true,
                                                    builder: (context,
                                                        candidates, rejects) {
                                                      return SvgPicture.asset(
                                                        Constants
                                                            .messageLockIcon,
                                                        width: 27,
                                                        height: 27,
                                                        color: candidates
                                                                .isNotEmpty
                                                            ? Colors.purple[800]
                                                            : Colors.white,
                                                      );
                                                    }),
                                                fallbackWidget: const Center())
                                          ],
                                        ),
                                        fallbackWidget: const Center(),
                                      ),
                                      TypingIndicatorBuilder(
                                          chatId: _chatId,
                                          participantId: _pid,
                                          child: const CustomTypingIndicator()),
                                      ConditionalRenderDelegate(
                                          condition: _isReplying,
                                          renderWidget: ListTile(
                                              leading: Container(
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    stops: const [0.0, 1.0],
                                                    end: const Alignment(
                                                        1.0, 0.0),
                                                    begin: const Alignment(
                                                        -0.95, 0.0),
                                                    colors: [
                                                      HexColor('#FA5B8E'),
                                                      HexColor('#FCA28E')
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                              tileColor: HexColor('#0D0E0E')
                                                  .withOpacity(0.7),
                                              title: _determineReplyTitle(),
                                              subtitle:
                                                  _determineReplySubtitle(),
                                              trailing: IconButton(
                                                  icon: const Icon(Icons.close,
                                                      size: 20),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isReplying = false;
                                                      // _replyMessage.value = null;
                                                    });
                                                  })),
                                          fallbackWidget: const Center()),
                                    ],
                                  ),
                                  typingBuilder: (user) {
                                    return const CustomTypingIndicator();
                                  }),
                              scrollToBottomOptions:
                                  const ScrollToBottomOptions(),
                              quickReplyOptions: QuickReplyOptions(
                                quickReplyBuilder: (r) {
                                  return DefaultQuickReply(
                                    quickReply: r,
                                    quickReplyOptions: QuickReplyOptions(
                                        quickReplyPadding:
                                            const EdgeInsets.all(9),
                                        quickReplyStyle: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.teal[200]!),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        quickReplyTextStyle:
                                            TextStyle(color: Colors.teal[200])),
                                  );
                                },
                                onTapQuickReply: (QuickReply reply) {},
                              ),
                            );
                          }
                        });
                  }),
              _buildAppBar()
            ])));
  }

  Widget _buildEmptyMessage() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            maxRadius: 60,
            backgroundImage: CachedNetworkImageProvider(
                _metadata.chatRecipient.profilePic as String)),
        Text('\nSay hi to ${_metadata.chatRecipient.username} 👋',
            style: const TextStyle(fontSize: 16))
      ],
    ));
  }

  Widget _buildAppBar() {
    return Positioned(
        top: 0,
        child: ClipRect(
            child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 0,
                  sigmaY: 0,
                ),
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    color: Theme.of(context).canvasColor,
                    width: MediaQuery.of(context).size.width,
                    child: _chatHeader(_metadata.chatRecipient)))));
  }

  Widget _determineReplyTitle() {
    if (!_replyMessage.isInitialized) {
      return const Center();
    }

    final _isMine = _replyMessage.value!.user.id == _uid;
    final _title = _isMine ? 'You ' : _replyMessage.value!.user.firstName ?? '';

    return Text('$_title\n');
  }

  Widget _determineReplySubtitle() {
    if (!_replyMessage.isInitialized) {
      return const Center();
    }
    if (_replyMessage.value!.medias!.isNotEmpty) {
      if (_replyMessage.value!.medias?[0].type == MediaType.image) {
        return SizedBox(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    _replyMessage.value!.medias?[0].url as String)));
      } else {
        return SizedBox(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(_replyMessage
                    .value!.medias?[0].metadata?.thumbnail as String)));
      }
    }

    return Text(_replyMessage.value?.text ?? '');
  }

  Widget _chatHeader(UserDTO user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            icon: Icon(Icons.arrow_back,
                size: ResponsiveFlutter.of(context).fontSize(3)),
            onPressed: () {
              getService<AppRouter>().pop();
            }),
        Center(
          child: SizedBox(
            width: 180,
            child: ListTile(
              dense: false,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: UserAvatar(
                  blocGroup: widget.blocGroup,
                  avatarUserId: user.id,
                  profilePic: user.profilePic),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text('${user.username}',
                    style: TextStyle(
                        fontSize:
                            ResponsiveFlutter.of(context).fontSize(1.45))),
              ),
              subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: ConditionalRenderDelegate(
                      condition: user.presence as bool,
                      renderWidget: Row(children: [
                        Text('Online ',
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.3))),
                        const Icon(Icons.circle, size: 11, color: Colors.green)
                      ]),
                      fallbackWidget: Row(children: [
                        Text('Offline ',
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(1.3))),
                        const Icon(Icons.circle, size: 11, color: Colors.amber)
                      ]))),
            ),
          ),
        ),
        Icon(CupertinoIcons.info,
            size: ResponsiveFlutter.of(context).fontSize(3))
      ]),
    );
  }
}
