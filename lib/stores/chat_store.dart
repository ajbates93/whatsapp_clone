import 'package:mobx/mobx.dart';
import '../models/chat_model.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  @observable
  ObservableList<Chat> chats = ObservableList<Chat>.of([
    Chat(
      id: '1',
      name: 'Vicky Lavelle',
      lastMessage: "Well it's good luck at least",
      time: '09:24',
      avatarUrl: null,
      messageStatus: MessageStatus.read,
    ),
    Chat(
      id: '2',
      name: 'Joe Osman',
      lastMessage: 'Swell',
      time: '08:18',
      avatarUrl: null,
      unreadCount: 1,
    ),
    Chat(
      id: '3',
      name: 'Value Over Price',
      lastMessage: 'Rob: The music in this game',
      time: '05:06',
      avatarUrl: null,
      isGroup: true,
      isMuted: true,
    ),
    Chat(
      id: '4',
      name: 'FPL Draft',
      lastMessage: 'Max: Expect crowds',
      time: 'Yesterday',
      isGroup: true,
      avatarUrl: null,
    ),
    Chat(
      id: '5',
      name: 'Joshua Hall',
      lastMessage: 'What time shall we meet on Monday?',
      time: 'Yesterday',
      avatarUrl: null,
      messageStatus: MessageStatus.sent,
    ),
    Chat(
      id: '5',
      name: 'C028749 NCT Burley',
      lastMessage:
          'Sounds good to me! Does anyone have the notes that we made last time?',
      time: 'Yesterday',
      avatarUrl: null,
      isGroup: true,
      messageStatus: MessageStatus.delivered,
    ),
    Chat(
      id: '6',
      name: 'Fibbage 3',
      lastMessage: 'Kira: 😂😂',
      time: 'Yesterday',
      isGroup: true,
      avatarUrl: null,
    ),
    Chat(
      id: '7',
      name: 'Trail Club Tuesdays',
      lastMessage: '~ Essi Troughton: A pleasure as always!',
      time: 'Yesterday',
      avatarUrl: null,
      unreadCount: 6,
      isGroup: true,
      isMuted: true,
    ),
    Chat(
      id: '8',
      name: 'Ilkley Padel',
      lastMessage: "Roger: There's also later slots free both Weds an...",
      time: '24/06/25',
      isGroup: true,
      avatarUrl: null,
    ),
    Chat(
      id: '9',
      name: 'Dan Collings',
      lastMessage: "Oh jeez haha",
      time: '23/06/25',
      isGroup: false,
      avatarUrl: null,
      messageStatus: MessageStatus.read,
    ),
    Chat(
      id: '10',
      name: 'Mum',
      lastMessage:
          'Mum reacted 👍 to "Yep all good we`ve been just looking at"',
      time: '23/06/25',
      isGroup: true,
      avatarUrl: null,
    ),
    Chat(
      id: '11',
      name: 'Padel 🏓',
      lastMessage:
          'You: Ah yes. Well if anyone else is up for it we have a court at Ilkley this evening.',
      time: '23/06/25',
      isGroup: true,
      avatarUrl: null,
      messageStatus: MessageStatus.read,
    ),
  ]);

  @computed
  int get totalUnreadCount =>
      chats.fold(0, (sum, chat) => sum + (chat.unreadCount ?? 0));
}
