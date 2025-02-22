import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'test_util.dart';

class ThemeRepository {
  final Box box;

  ThemeRepository(this.box);

  ThemeMode getThemeMode() {
    final themeIndex =
        box.get('themeMode', defaultValue: ThemeMode.system.index);
    return ThemeMode.values[themeIndex];
  }

  void setThemeMode(ThemeMode themeMode) {
    box.put('themeMode', themeMode.index);
  }
}

void main() async {
  setupPathProviderMock();

  setUpAll(() async {
    await Hive.initFlutter(); // Initialize Hive for testing
  });

  setUp(() async {
    await Hive.openBox('themeBox'); // Open a test Hive box before each test
  });

  tearDown(() async {
    final box = Hive.box('themeBox');
    await box.clear(); // Clear the box after each test to ensure isolation
  });

  tearDownAll(() async {
    await Hive.close(); // Close Hive after all tests are done
  });

  test('ThemeRepository default theme is system', () async {
    final box = Hive.box('themeBox'); // Get the opened box
    final themeRepository =
        ThemeRepository(box); // Pass the box to the constructor

    expect(themeRepository.getThemeMode(), equals(ThemeMode.system));
  });

  test('ThemeRepository can change theme', () async {
    final box = Hive.box('themeBox'); // Get the opened box
    final themeRepository = ThemeRepository(box);

    themeRepository.setThemeMode(ThemeMode.dark);
    expect(themeRepository.getThemeMode(), equals(ThemeMode.dark));

    themeRepository.setThemeMode(ThemeMode.light);
    expect(themeRepository.getThemeMode(), equals(ThemeMode.light));
  });
}
