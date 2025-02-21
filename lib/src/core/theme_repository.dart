import 'package:hive/hive.dart';

class ThemeRepository {
  static const String _themeKey = 'theme';
  final Box _box;

  ThemeRepository(this._box);

  String getTheme() {
    return _box.get(_themeKey, defaultValue: 'system');
  }

  Future<void> saveTheme(String theme) async {
    await _box.put(_themeKey, theme);
  }
}