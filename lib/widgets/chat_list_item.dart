import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;

  const ChatListItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.1),
        child: chat.isGroup
            ? Icon(Icons.group, color: Theme.of(context).colorScheme.primary)
            : Text(
                chat.name[0].toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              chat.name,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            chat.time,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: chat.unreadCount != null
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          if (chat.messageStatus != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: _buildMessageStatusIcon(context, chat.messageStatus!),
            ),
          Expanded(
            child: Text(
              chat.lastMessage,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (chat.isMuted)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(
                Icons.volume_off,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          if (chat.unreadCount != null)
            Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: () {
        // Navigate to chat detail
        print("Navigate to chat detail");
      },
    );
  }
}

Widget _buildMessageStatusIcon(BuildContext context, MessageStatus status) {
  switch (status) {
    case MessageStatus.sent:
      return Icon(
        Icons.done,
        size: 16,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
    case MessageStatus.delivered:
      return Icon(
        Icons.done_all,
        size: 16,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
    case MessageStatus.read:
      return Icon(
        Icons.done_all,
        size: 16,
        color: Theme.of(context).colorScheme.primary,
      );
  }
}
