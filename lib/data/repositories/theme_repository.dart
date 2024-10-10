import 'dart:async';

import '../../utils/result.dart';
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
  Future<Result<bool>> isDarkMode() async {
    try {
      final value = await _keyValueService.isDarkMode();
      return Result.ok(value);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Set dark mode
  Future<Result<void>> setDarkMode(bool value) async {
    try {
      await _keyValueService.setDarkMode(value);
      _darkModeController.add(value);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Stream that emits theme config changes.
  /// ViewModels should call [isDarkMode] to get the current theme setting.
  Stream<bool> observeDarkMode() => _darkModeController.stream;
}
