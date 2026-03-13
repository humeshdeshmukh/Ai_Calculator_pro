import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings {
  final ThemeMode themeMode;
  final int primaryColorIndex;

  ThemeSettings({
    required this.themeMode,
    required this.primaryColorIndex,
  });

  ThemeSettings copyWith({
    ThemeMode? themeMode,
    int? primaryColorIndex,
  }) {
    return ThemeSettings(
      themeMode: themeMode ?? this.themeMode,
      primaryColorIndex: primaryColorIndex ?? this.primaryColorIndex,
    );
  }
}

class ThemeNotifier extends Notifier<ThemeSettings> {
  @override
  ThemeSettings build() {
    _loadSettings();
    return ThemeSettings(themeMode: ThemeMode.system, primaryColorIndex: 0);
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = ThemeSettings(
      themeMode: ThemeMode.values[prefs.getInt('themeMode') ?? 0],
      primaryColorIndex: prefs.getInt('primaryColorIndex') ?? 0,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
  }

  Future<void> setPrimaryColorIndex(int index) async {
    state = state.copyWith(primaryColorIndex: index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primaryColorIndex', index);
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeSettings>(() {
  return ThemeNotifier();
});
