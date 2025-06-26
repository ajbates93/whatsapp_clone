import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'theme_store.g.dart';

// Mobx Store for Theme Management
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @action
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  @action
  void setTheme(ThemeMode mode) {
    themeMode = mode;
  }

  @computed
  String get themeName {
    switch (themeMode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}
