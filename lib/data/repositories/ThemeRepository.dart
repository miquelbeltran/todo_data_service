import 'dart:async';

/// Repository for theme settings.
/// The repository is the source of truth for the theme settings.
class ThemeRepository {
  bool _darkMode = false;

  final StreamController<bool> _darkModeController =
      StreamController<bool>.broadcast();

  /// Get if dark mode is enabled
  Future<bool> isDarkMode() async {
    // TODO: Load from local storage
    return _darkMode;
  }

  /// Set if darl mode is enabled
  Future<void> setDarkMode(bool value) async {
    _darkMode = value;
    _darkModeController.add(value);

    // TODO: Save to local storage
  }

  /// Stream theme changes
  Stream<bool> observeDarkMode() => _darkModeController.stream;
}
