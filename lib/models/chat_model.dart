enum MessageStatus { sent, delivered, read }

class Chat {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final String? avatarUrl;
  final MessageStatus? messageStatus;
  final bool isMuted;
  final bool isGroup;
  final int? unreadCount;

  Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.avatarUrl,
    this.messageStatus,
    this.isMuted = false,
    this.isGroup = false,
    this.unreadCount,
  });
}
