import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class TypingIndicatorBuilder extends StatelessWidget {
  const TypingIndicatorBuilder(
      {Key? key,
      required this.child,
      required this.chatId,
      required this.participantId})
      : super(key: key);

  final Widget child;
  final String chatId;
  final String participantId;

  Stream<DocumentSnapshot<Map<String, dynamic>>> get _chatStream {
    return FirebaseFirestore.instance
        .collection(Collections.chats.name)
        .doc(chatId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _chatStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.error != null) {
            return const Center();
          } else {
            final chat = snapshot.data!.data() as Map<String, dynamic>;

            return ConditionalRenderDelegate(
              renderWidget: child,
              fallbackWidget: const Center(),
              condition: chat['typing'].contains(participantId),
            );
          }
        });
  }
}
