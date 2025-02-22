import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:change_theme_er/change_theme_er.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(); // Hive ve GetIt başlat

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

/// Path: example/lib/screens/home_screen.dart
/// Compare this snippet from example/test/widget_test.dart:
/// // This is a basic Flutter widget test.
/// //
/// // To perform an interaction with a widget in your test, use the WidgetTester
/// // utility in the flutter_test package. For example, you can send tap and scroll
/// // gestures. You can also use WidgetTester to find child widgets in the widget
/// // tree, read text, and verify that the values of widget properties are correct.
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
                    colors:
                        isDark
                            ? [Colors.black, Colors.grey.shade900]
                            : [Colors.blue.shade100, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              // Glassmorphism Card with Shadow
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:
                        isDark
                            ? Colors.white.withAlpha((0.1 * 255).toInt())
                            : Colors.white.withAlpha((0.3 * 255).toInt()),
                    boxShadow: [
                      BoxShadow(
                        color:
                            isDark
                                ? Colors.black.withAlpha((0.5 * 255).toInt())
                                : Colors.blue.shade200.withAlpha(
                                  (0.5 * 255).toInt(),
                                ),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
                    border: Border.all(
                      color:
                          isDark
                              ? Colors.white.withAlpha((0.2 * 255).toInt())
                              : Colors.blue.shade100.withAlpha(
                                (0.5 * 255).toInt(),
                              ),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Theme Switch Icon
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                        ) {
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

                      // Custom Switch Button
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
                            gradient: LinearGradient(
                              colors:
                                  isDark
                                      ? [
                                        Colors.deepPurpleAccent,
                                        Colors.blueAccent,
                                      ]
                                      : [Colors.orangeAccent, Colors.redAccent],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    isDark
                                        ? Colors.deepPurpleAccent.withAlpha(
                                          (0.5 * 255).toInt(),
                                        )
                                        : Colors.orangeAccent.withAlpha(
                                          (0.5 * 255).toInt(),
                                        ),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Animated Circle
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                alignment:
                                    isDark
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            isDark
                                                ? Colors.deepPurpleAccent
                                                    .withAlpha(
                                                      (0.5 * 255).toInt(),
                                                    )
                                                : Colors.orangeAccent.withAlpha(
                                                  (0.5 * 255).toInt(),
                                                ),
                                        blurRadius: 15,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    isDark
                                        ? Icons.nightlight_round
                                        : Icons.wb_sunny,
                                    size: 28,
                                    color:
                                        isDark
                                            ? Colors.deepPurpleAccent
                                            : Colors.orangeAccent,
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
