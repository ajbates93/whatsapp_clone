import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/theme_store.dart';
import '../stores/chat_store.dart';
import '../widgets/chat_list_item.dart';

class ChatListScreen extends StatelessWidget {
  final ChatStore chatStore = ChatStore();

  @override
  Widget build(BuildContext context) {
    final themeStore = Provider.of<ThemeStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              print("Camera pressed!");
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print("Search pressed!");
            },
          ),
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                themeStore.themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () => themeStore.toggleTheme(),
            ),
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Archived section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.archive_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 16),
                Text('Archived', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),

          // Chat List
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: chatStore.chats.length,
                itemBuilder: (context, index) {
                  final chat = chatStore.chats[index];
                  return ChatListItem(chat: chat);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Create new chat pressed!");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
