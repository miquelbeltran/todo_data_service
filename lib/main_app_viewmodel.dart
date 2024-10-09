import 'dart:async';

import 'package:flutter/material.dart';

import 'data/repositories/theme_repository.dart';

/// Exposes the current theme setting and listens for changes.
class MainAppViewModel extends ChangeNotifier {
  MainAppViewModel(
    this._themeRepository,
  ) {
    _subscription = _themeRepository.observeDarkMode().listen((isDarkMode) {
      _isDarkMode = isDarkMode;
      notifyListeners();
    });
    load();
  }

  final ThemeRepository _themeRepository;
  StreamSubscription<bool>? _subscription;

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Future<void> load() async {
    _isDarkMode = await _themeRepository.isDarkMode();
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
