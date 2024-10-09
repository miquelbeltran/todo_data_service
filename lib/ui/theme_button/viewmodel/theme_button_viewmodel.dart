import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_data_service/data/repositories/theme_repository.dart';

class ThemeButtonViewModel extends ChangeNotifier {
  ThemeButtonViewModel(this._themeRepository) {
    load();
  }

  final ThemeRepository _themeRepository;

  bool _isDarkMode = false;

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
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
