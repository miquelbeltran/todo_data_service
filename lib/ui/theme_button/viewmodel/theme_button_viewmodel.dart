import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_data_service/data/repositories/ThemeRepository.dart';

class ThemeButtonViewModel extends ChangeNotifier {
  ThemeButtonViewModel(this._themeRepository) {
    // listen to changes in the theme repository
    _subscription = _themeRepository.observeDarkMode().listen((isDarkMode) {
      _isDarkMode = isDarkMode;
      notifyListeners();
    });

    // load on ViewModel created
    load();
  }

  final ThemeRepository _themeRepository;

  bool _isDarkMode = false;

  StreamSubscription<bool>? _subscription;

  /// If true show dark mode
  bool get isDarkMode => _isDarkMode;

  /// Load the current theme setting from the repository
  Future<void> load() async {
    _isDarkMode = await _themeRepository.isDarkMode();
    notifyListeners();
  }

  /// Toggle the theme setting
  void toggleTheme() {
    _themeRepository.setDarkMode(!_isDarkMode);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
