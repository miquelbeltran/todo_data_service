import 'dart:async';

import '../services/shared_preferences_service.dart';

/// Repository for theme settings.
/// The repository is the source of truth for the theme settings.
class ThemeRepository {
  ThemeRepository(
    this._keyValueService,
  );

  final _darkModeController = StreamController<bool>.broadcast();

  final SharedPreferencesService _keyValueService;

  /// Get if dark mode is enabled
  Future<bool> isDarkMode() async {
    return await _keyValueService.isDarkMode();
  }

  /// Set dark mode
  Future<void> setDarkMode(bool value) async {
    _darkModeController.add(value);
    await _keyValueService.setDarkMode(value);
  }

  /// Stream that emits theme config changes.
  /// ViewModels should call [isDarkMode] to get the current theme setting.
  Stream<bool> observeDarkMode() => _darkModeController.stream;
}
