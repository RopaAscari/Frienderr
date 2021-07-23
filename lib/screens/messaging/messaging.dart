import 'dart:io';
import 'dart:async';
import 'package:frienderr/blocs/chat_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/events/chat_event.dart';
import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/messaging/messaging.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Messaging extends StatefulWidget {
  final MessagingMetaData metaData;

  Messaging({required this.metaData});

  @override
  MessagingState createState() => MessagingState();
}

class MessagingState extends State<Messaging> {
  late final ChatUser user;
  late UserState userState;
  MessagingMetaData get metaData => widget.metaData;
  String get chatId => metaData.chatId == ''
      ? '${metaData.chatUser.id}-${metaData.chatRecipient.id}'
      : metaData.chatId;

  final ChatBloc chatBloc = new ChatBloc();

  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  final CollectionReference chats =
      FirebaseFirestore.instance.collection('chats');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('chats');

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  initState() {
    userState = context.read<UserBloc>().state;
    user = ChatUser(
      uid: metaData.chatUser.id,
      name: metaData.chatUser.username,
      // avatar: metaData.chatUser.profilePic,
      color: Colors.white,
      containerColor: HexColor('#242222'),
    );
    resetLatestMessageCount();
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  Future<bool> checkIfUserChatExists(String userId, String recipientId) async {
    try {
      // Get reference to Firestore collection
      final chatExistence = await chats
          .doc(userId)
          .collection('user_chats')
          .doc(recipientId)
          .get();

      return chatExistence.exists;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> checkIfRecepientChatExists(
      String userId, String recipientId) async {
    try {
      // Get reference to Firestore collection
      final chatExistence = await chats
          .doc(recipientId)
          .collection('user_chats')
          .doc(userId)
          .get();

      return chatExistence.exists;
    } catch (e) {
      throw e;
    }
  }

  determineChatInstantiation(
      dynamic user, dynamic recipient, ChatMessage message) async {
    final chatId = '${user.id}-${recipient.id}';

    final participants = [
      {
        'id': user.id,
        'username': user.username,
        'profilePic': user.profilePic,
      },
      {
        'id': recipient.id,
        'username': recipient.username,
        'profilePic': recipient.profilePic,
      }
    ];

    final chatMetadata = {
      'id': chatId,
      'participants': participants,
      'latestMessage': {
        'message': new ChatMessage(
            text: message.text,
            user: ChatUser(
              uid: user.id,
              name: user.username,
              avatar: user.profilePic,
              containerColor: HexColor('#242222'),
            )).toJson(),
        'date': DateTime.now().microsecondsSinceEpoch,
        'count': 0
      }
    };

    if (!await checkIfUserChatExists(user.id, recipient.id)) {
      print('is instatitating user');
      instantiateUserChat(user, recipient, chatMetadata);
    }

    if (!await checkIfRecepientChatExists(user.id, recipient.id)) {
      print('is instatitating recipient');
      instantiateReciepientChat(user, recipient, chatMetadata);
    }
  }

  resetLatestMessageCount() async {
    await chats
        .doc(metaData.chatUser.id)
        .collection('user_chats')
        .doc(metaData.chatRecipient.id)
        .update({
      'latestMessage.count': 0,
    });
  }

  instantiateReciepientChat(
      dynamic user, dynamic recipient, dynamic chatMetadata) async {
    await chats
        .doc(metaData.chatRecipient.id)
        .collection('user_chats')
        .doc(metaData.chatUser.id)
        .set(chatMetadata);
  }

  instantiateUserChat(
      dynamic user, dynamic recipient, dynamic chatMetadata) async {
    await chats
        .doc(metaData.chatUser.id)
        .collection('user_chats')
        .doc(metaData.chatRecipient.id)
        .set(chatMetadata);
  }

  sendToReciepint(ChatMessage message) async {
    final Map latestMessage = {
      'message': message.toJson(),
      'date': new DateTime.now().microsecondsSinceEpoch,
      'count': 1,
    };

    await chats
        .doc(metaData.chatRecipient.id)
        .collection('user_chats')
        .doc(metaData.chatUser.id)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());

    await chats
        .doc(metaData.chatRecipient.id)
        .collection('user_chats')
        .doc(metaData.chatUser.id)
        .update({'latestMessage': latestMessage});
  }

  sendToUser(ChatMessage message) async {
    final Map latestMessage = {
      'message': message.toJson(),
      'date': new DateTime.now().microsecondsSinceEpoch,
      'count': 0,
    };

    await chats
        .doc(metaData.chatUser.id)
        .collection('user_chats')
        .doc(metaData.chatRecipient.id)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());

    await chats
        .doc(metaData.chatUser.id)
        .collection('user_chats')
        .doc(metaData.chatRecipient.id)
        .update({'latestMessage': latestMessage});
  }

  void onSend(ChatMessage message) async {
    try {
      // print('instantiaitng...');
      await determineChatInstantiation(
          metaData.chatUser, metaData.chatRecipient, message);

      ///if (!await checkIfChatExists(metaData.chatId)) {

      // }
      await sendToUser(message);
      await sendToReciepint(message);
    } catch (e) {
      print('Error occured while sending messages');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic appUser =
        BlocProvider.of<UserBloc>(context, listen: true).state.user;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: chatHeader(metaData.chatRecipient),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chats')
              .doc(appUser.id)
              .collection('user_chats')
              .doc(metaData.chatRecipient.id)
              .collection('messages')
              .orderBy("createdAt")
              .snapshots(),
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
              var messages = items
                  .map((i) => ChatMessage.fromJson(i.data()! as dynamic))
                  .toList();
              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                /* messageDecorationBuilder: (ChatMessage msg, bool isUser) {
                  return BoxDecoration(
                    color: isUser ? Colors.red : Colors.blue, // example
                  );
                } as dynamic,*/
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 14.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Theme.of(context).canvasColor,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState!.scrollController
                      ..animateTo(
                        _chatViewKey.currentState!.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      systemMessage();
                      Timer(Duration(milliseconds: 600), () {
                        systemMessage();
                      });
                    } else {
                      systemMessage();
                    }
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      final picker = ImagePicker();
                      PickedFile? result = await picker.getImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 400,
                        maxWidth: 400,
                      );

                      if (result != null) {
                        final Reference storageRef =
                            FirebaseStorage.instance.ref().child("chat_images");

                        final taskSnapshot = await storageRef.putFile(
                          File(result.path),
                          SettableMetadata(
                            contentType: 'image/jpg',
                          ),
                        );

                        String url = await taskSnapshot.ref.getDownloadURL();

                        ChatMessage message =
                            ChatMessage(text: "", user: user, image: url);

                        FirebaseFirestore.instance
                            .collection('chats')
                            .doc(chatId)
                            .collection('messages')
                            .add(message.toJson());
                      }
                    },
                  )
                ],
              );
            }
          }),
    );
  }

  Widget chatHeader(user) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .snapshots(),
        builder: (context, snapshot) {
          dynamic userS = snapshot.data;

          if (userS == null) {
            return Center();
          }

          return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    maxRadius: 16,
                    backgroundImage:
                        CachedNetworkImageProvider(user.profilePic)),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${user.username}',
                              style: TextStyle(fontSize: 16)),
                          userS['presence']
                              ? Row(children: [
                                  Text('Online ',
                                      style: TextStyle(fontSize: 12)),
                                  Icon(Icons.circle,
                                      size: 11, color: Colors.green)
                                ])
                              : Row(children: [
                                  Text('Offline ',
                                      style: TextStyle(fontSize: 12)),
                                  Icon(Icons.circle,
                                      size: 11, color: Colors.amber)
                                ]),
                        ]))
              ]);
        });
  }
}

/* import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frienderr/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Chat extends StatefulWidget {
  late final dynamic user;
  late final dynamic chatId;
  late final dynamic recipient;

  Chat({
    Key? key,
    required this.user,
    required this.chatId,
    required this.recipient,
  }) : super(key: key);

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  dynamic get chatUser => widget.user;
  dynamic get chatID => widget.chatId;
  dynamic get chatRecipient => widget.recipient;
  String get chatId =>
      chatID == null ? '${chatUser.id}-${chatRecipient['id']}' : chatID;

  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  final CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    user = ChatUser(
      uid: chatUser.id,
      name: chatUser.username,
      avatar: chatUser.profilePic,
      containerColor: HexColor('#242222'),
    );
    super.initState();
  }

  ChatUser user = ChatUser(
    name: '',
    uid: "",
    avatar: "",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  Future<bool> checkIfChatExists(String chatId) async {
    try {
      // Get reference to Firestore collection
      final chatExistence = await chatsCollection.doc(chatId).get();
      return chatExistence.exists;
    } catch (e) {
      throw e;
    }
  }

  instantiateChatInstance(dynamic user, dynamic recipient) async {
    final participants = [
      {
        'id': user.id,
        'status': user.status,
        'username': user.username,
        'profilePic': user.profilePic,
      },
      {
        'id': recipient['id'],
        'status': recipient['status'],
        'username': recipient['username'],
        'profilePic': recipient['profilePic'],
      }
    ];

    final chatMetadata = {
      'participants': participants,
      'latestMessage': {'message': '', 'date': 0}
    };

    chatsCollection.doc(chatId).set(chatMetadata).then((value) async {
      for (Map participant in participants) {
        await users.doc(participant['id']).update({
          'chats': FieldValue.arrayUnion([chatId])
        });
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  void onSend(ChatMessage message) async {
    if (!await checkIfChatExists(chatID)) {
      instantiateChatInstance(chatUser, chatRecipient);
    }
    //  print(message.toJson());
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());

    await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
      'latestMessage': {
        'message': message.toJson(),
        'date': new DateTime.now(),
      }
    });

    /* setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    } */
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .orderBy("createdAt")
              .snapshots(),
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
              var messages = items
                  .map((i) => ChatMessage.fromJson(i.data()! as dynamic))
                  .toList();
              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.black,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState!.scrollController
                      ..animateTo(
                        _chatViewKey.currentState!.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      systemMessage();
                      Timer(Duration(milliseconds: 600), () {
                        systemMessage();
                      });
                    } else {
                      systemMessage();
                    }
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      final picker = ImagePicker();
                      PickedFile? result = await picker.getImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 400,
                        maxWidth: 400,
                      );

                      if (result != null) {
                        final Reference storageRef =
                            FirebaseStorage.instance.ref().child("chat_images");

                        final taskSnapshot = await storageRef.putFile(
                          File(result.path),
                          SettableMetadata(
                            contentType: 'image/jpg',
                          ),
                        );

                        String url = await taskSnapshot.ref.getDownloadURL();

                        ChatMessage message =
                            ChatMessage(text: "", user: user, image: url);

                        FirebaseFirestore.instance
                            .collection('chats')
                            .doc(chatId)
                            .collection('messages')
                            .add(message.toJson());
                      }
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
*/
