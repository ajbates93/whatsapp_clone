// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<String>? _$themeNameComputed;

  @override
  String get themeName => (_$themeNameComputed ??= Computed<String>(
    () => super.themeName,
    name: '_ThemeStore.themeName',
  )).value;

  late final _$themeModeAtom = Atom(
    name: '_ThemeStore.themeMode',
    context: context,
  );

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$_ThemeStoreActionController = ActionController(
    name: '_ThemeStore',
    context: context,
  );

  @override
  void toggleTheme() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.toggleTheme',
    );
    try {
      return super.toggleTheme();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTheme(ThemeMode mode) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
      name: '_ThemeStore.setTheme',
    );
    try {
      return super.setTheme(mode);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
themeName: ${themeName}
    ''';
  }
}
