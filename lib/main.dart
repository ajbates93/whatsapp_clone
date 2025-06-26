import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'stores/theme_store.dart';
import 'screens/chat_list_screen.dart';

void main() {
  runApp(WhatsAppCloneApp());
}

class WhatsAppCloneApp extends StatelessWidget {
  const WhatsAppCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ThemeStore(),
      child: Consumer<ThemeStore>(
        builder: (context, themeStore, _) => Observer(
          builder: (_) => MaterialApp(
            title: "WhatsApp Clone",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF25D366),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF25D366),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              scaffoldBackgroundColor: const Color(0xFF0B141B),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF202C33),
                foregroundColor: Colors.white,
              ),
            ),
            themeMode: themeStore.themeMode,
            home: ChatListScreen(),
          ),
        ),
      ),
    );
  }
}
