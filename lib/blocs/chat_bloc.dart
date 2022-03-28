import 'package:bloc/bloc.dart';
import 'package:frienderr/state/chat_state.dart';
import 'package:frienderr/events/chat_event.dart';
import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository = new ChatRepository();
  ChatBloc() : super(ChatState()) {
    on<GetChats>((event, emit) async {
      try {
        emit(LoadingChats());

        final List<ChatModel> chats = await chatRepository.fetchChats(event.id);

        if (chats.length == 0) {
          emit(ChatsEmpty());
          return;
        }

        emit(ChatsLoaded(chats: chats));
      } catch (e) {}
    });

    on<OpenChat>((event, emit) async {
      chatRepository.openChat(
          event.metaData, event.context, event.chats, event.index);
    });

    on<UpdateChats>((event, emit) async {
      try {
        final List<ChatModel> chats = event.chats;
        //print('CHATS ${chats[0].latestMessage.message}');
        emit(ChatsLoaded(chats: chats));
      } catch (e) {
        emit(ChatError(error: 'Something went wrong'));
      }
    });
  }
}
