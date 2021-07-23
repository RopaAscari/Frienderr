import 'package:bloc/bloc.dart';
import 'package:frienderr/state/chat_state.dart';
import 'package:frienderr/events/chat_event.dart';
import 'package:frienderr/repositories/chat_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository = new ChatRepository();
  ChatBloc() : super(ChatState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    try {
      if (event is GetChats) {
        yield LoadingChats();

        final chats = await chatRepository.fetchChats(event.id);

        if (chats.length == 0) {
          yield ChatsEmpty();
          return;
        }
        print('chats $chats');
        yield ChatsLoaded(chats: chats);
      }

      if (event is OpenChat) {
        chatRepository.openChat(
            event.metaData, event.context, event.chats, event.index);
      }
      if (event is UpdateChats) {
        final chats = event.chats;
        //print('CHATS ${chats[0].latestMessage.message}');
        yield ChatsLoaded(chats: chats);
      }
    } catch (e) {
      yield ChatError(error: 'Something went wrong');
    }
  }
}
