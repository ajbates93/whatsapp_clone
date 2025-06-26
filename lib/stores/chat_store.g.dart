// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStore, Store {
  Computed<int>? _$totalUnreadCountComputed;

  @override
  int get totalUnreadCount => (_$totalUnreadCountComputed ??= Computed<int>(
    () => super.totalUnreadCount,
    name: '_ChatStore.totalUnreadCount',
  )).value;

  late final _$chatsAtom = Atom(name: '_ChatStore.chats', context: context);

  @override
  ObservableList<Chat> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(ObservableList<Chat> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  @override
  String toString() {
    return '''
chats: ${chats},
totalUnreadCount: ${totalUnreadCount}
    ''';
  }
}
