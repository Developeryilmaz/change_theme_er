# change_theme_er Wiki

Welcome to the **change_theme_er** Wiki! This documentation will guide you through the setup, usage, and code examples for the package.

---

## Overview

**change_theme_er** is a high-performance, customizable theme changer package for Flutter. It provides:
- **Smooth transitions** between light and dark themes.
- **Bloc-powered state management** for optimized performance.
- **GetIt dependency injection** for modular architecture.
- **Hive-based persistence** to remember the user’s theme choice across sessions.

---

## Getting Started

### Prerequisites

- Flutter SDK installed.
- Basic knowledge of Flutter, Bloc, and dependency injection.

### Installation

1. **Add the dependency** to your `pubspec.yaml`:

   ```yaml
   dependencies:
     change_theme_er: latest_version
   ```

2. **Install the package** by running:

   ```sh
   flutter pub get
   ```

3. **Set up the dependencies** (Hive, GetIt, etc.) before running your app.

---

## Setup & Initialization

In your main Dart file, initialize the required dependencies and set up Bloc for theme management.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:change_theme_er/change_theme_er.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // Initializes Hive and GetIt

  runApp(
    BlocProvider(
      create: (context) => sl<ThemeBloc>()..add(LoadTheme()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: "Change Theme ER Example",
          themeMode: state.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
```

---

## Example: HomeScreen Implementation

Below is an example of a complete HomeScreen implementation that demonstrates animated theme switching, glassmorphism UI, and dynamic color changes.

```dart
/// Path: example/lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:change_theme_er/change_theme_er.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDark = state.themeMode == ThemeMode.dark;

        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              // Animated Background
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [Colors.black, Colors.grey.shade900]
                        : [Colors.blue.shade100, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: isDark
                        ? Colors.white.withAlpha((0.1 * 255).toInt())
                        : Colors.white.withAlpha((0.3 * 255).toInt()),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Icon(
                          isDark ? Icons.nightlight_round : Icons.wb_sunny,
                          key: ValueKey(isDark),
                          size: 80,
                          color: isDark ? Colors.white : Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeBloc>().add(ToggleTheme());
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          width: 120,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    isDark ? Icons.nightlight_round : Icons.wb_sunny,
                                    size: 28,
                                    color: isDark ? Colors.deepPurpleAccent : Colors.orangeAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
```

---

## Additional Resources

- **GitHub Repository:**  
  [https://github.com/Developeryilmaz/change_theme_er](https://github.com/Developeryilmaz/change_theme_er)

- **Pub.dev Package Page:**  
  [https://pub.dev/packages/change_theme_er](https://pub.dev/packages/change_theme_er)

- **API Documentation:**  
  Refer to the [API Reference](https://pub.dev/documentation/change_theme_er/latest/) for more detailed information.

---

## FAQ

**Q: Is this package compatible with web (WASM)?**  
A: Currently, the package and some of its dependencies rely on `dart:io`, which limits compatibility with web environments. Future updates might address this with conditional imports or alternative implementations.

**Q: How can I contribute?**  
A: Contributions are welcome! Please check the [Contribution Guidelines](https://github.com/Developeryilmaz/change_theme_er) on GitHub for more details.

---

Feel free to edit or extend this Wiki page as your package evolves. Your contributions help make the documentation more robust and user-friendly!
