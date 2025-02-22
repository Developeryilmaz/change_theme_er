import 'package:change_theme_er/change_theme_er.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  test('ThemeRepository default theme is system', () {
    // Hive'in test için varsayılan kutusunu oluşturuyoruz
    Hive.init('testPath');
    final box = Hive.box('settings');
    final themeRepository = ThemeRepository(box);

    expect(themeRepository.getTheme(), 'system');
  });

  test('ThemeRepository can change theme', () async {
    Hive.init('testPath');
    final box = Hive.box('settings');
    final themeRepository = ThemeRepository(box);

    await themeRepository.saveTheme('dark');
    expect(themeRepository.getTheme(), 'dark');
  });
}
