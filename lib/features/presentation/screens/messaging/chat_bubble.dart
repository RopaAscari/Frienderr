import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:dash_chat_2/dash_chat_2.dart' as chat;
import 'package:frienderr/core/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/presentation/screens/messaging/video_player.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/popup_menu.dart';
import 'package:frienderr/features/presentation/screens/messaging/audio_player.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/screens/messaging/bubble_background.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    Key? key,
    required this.chatId,
    required this.isLast,
    required this.isMine,
    required this.message,
    required this.onReply,
    required this.messageBloc,
    required this.isNextSameAuthor,
    required this.isPreviousSameAuthor,
    required this.isBeforeDateSeparator,
  }) : super(key: key);

  final bool isMine;
  final bool isLast;
  final String chatId;
  final bool isNextSameAuthor;
  final MessageBloc messageBloc;
  final chat.ChatMessage message;
  final bool isPreviousSameAuthor;
  final bool isBeforeDateSeparator;
  final Function(chat.ChatMessage) onReply;

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  bool get _isMine => widget.isMine;
  bool get _isLast => widget.isLast;
  String get _chatId => widget.chatId;
  late AnimationController _controller;
  Function get onReply => widget.onReply;
  chat.ChatMessage get _message => widget.message;
  MessageBloc get _messageBloc => widget.messageBloc;
  bool get isNextSameAuthor => widget.isNextSameAuthor;
  bool get isBeforeDateSeparator => widget.isBeforeDateSeparator;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.3, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Alignment messageAlignment =
        _isMine ? Alignment.topRight : Alignment.topLeft;

    return FractionallySizedBox(
        widthFactor: 1,
        alignment: messageAlignment,
        child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 1) {
                // _controller.forward().whenComplete(() {
                //    _controller.reverse();
                //    onReply(_message);
                // });
              }
            },
            child: SlideTransition(
                position: animation,
                child: Align(
                  alignment: messageAlignment,
                  child: _buildMessageSeen(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: BubbleBackground(
                        colors: [
                          _isMine
                              ? const Color(0xFF19B7FF)
                              : const Color(0xFF6C7689),
                          _isMine
                              ? const Color(0xFF491CCB)
                              : const Color(0xFF3A364B),
                        ],
                        child: PopupMenuContainer<MessageAction>(
                          child: _determineMessageRender(),
                          items: [
                            PopupMenuItem(
                                value: MessageAction.delete,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Constants.messageDeleteIconFill,
                                      width: 29,
                                      height: 29,
                                      color: Colors.red[600],
                                    ),
                                    Text('  Delete message',
                                        style: TextStyle(
                                            color: Colors.red[600]!,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(1.4))),
                                  ],
                                )),
                          ],
                          onItemSelected: (value) async {
                            if (value == MessageAction.delete) {
                              _messageBloc.add(MessageEvent.deleteMessage(
                                  chatId: _chatId, messageId: _message.id));
                            }
                          },
                        ),
                      ),
                    ),
                  )),
                ))));
  }

  Widget _determineMessageRender() {
    if (_message.medias != null && _message.medias!.isNotEmpty) {
      if (_message.medias?.first.type == chat.MediaType.image) {
        return _buildFullScreenImage(_message.medias?.first.url as String);
      } else if (_message.medias?.first.type == chat.MediaType.video) {
        return _buildFullScreenVideo(_message.medias?.first.url as String);
      } else if (_message.medias?.first.type == chat.MediaType.audio) {
        return AudioPlayer(url: _message.medias?.first.url as String);
      }
    }

    return DefaultTextStyle.merge(
      style: TextStyle(
        fontSize: ResponsiveFlutter.of(context).fontSize(1.45),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(_message.text,
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(1.45))),
      ),
    );
  }

  Widget _buildFullScreenImage(String url) {
    return OpenContainer(
        openElevation: 10,
        closedElevation: 10,
        closedColor: Colors.transparent,
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext context, VoidCallback _) {
          return Container(
              decoration: const BoxDecoration(color: Colors.black),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: InteractiveViewer(
                child: CachedNetworkImage(imageUrl: url),
              ));
        },
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: Image.network(url));
        });
  }

  Widget _buildFullScreenVideo(String url) {
    return OpenContainer(
        openElevation: 0,
        closedElevation: 0,
        closedColor: Colors.transparent,
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext context, VoidCallback _) {
          final CachedVideoPlayerController _controller =
              CachedVideoPlayerController.network(url);

          _controller.initialize();

          return Container(
            decoration: const BoxDecoration(color: Colors.black),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
                builder: (context, constraints) => ConditionalRenderDelegate(
                    condition: _controller.value.isInitialized,
                    renderWidget: AspectRatio(
                      aspectRatio: constraints.maxWidth / constraints.maxHeight,
                      child: ChatVideoPlayer(url: url),
                    ),
                    fallbackWidget:
                        const LoadingIndicator(size: Size(40, 40)))),
          );
        },
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: ChatVideoPlayer(url: url));
        });
  }

  Widget _buildMessageSeen({required Widget child}) {
    return SizedBox(
        child: Column(
      crossAxisAlignment:
          _isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        child,
        ConditionalRenderDelegate(
            condition: _isMine && (!isNextSameAuthor || isBeforeDateSeparator),
            renderWidget: Row(
                mainAxisAlignment:
                    _isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () async {},
                      child: Padding(
                        child: SvgPicture.asset(Constants.messageSeenIconFill,
                            height: ResponsiveFlutter.of(context).fontSize(1.9),
                            width: ResponsiveFlutter.of(context).fontSize(1.9),
                            color: _message.status == chat.MessageStatus.read
                                ? Colors.blue[500]
                                : Colors.grey[500]),
                        padding: const EdgeInsets.only(left: 10),
                      )),
                  chat.DefaultAvatar(user: _message.user, size: 30),
                ]),
            fallbackWidget: const Center()),
      ],
    ));
  }
}
