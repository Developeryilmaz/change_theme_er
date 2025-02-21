import 'package:change_theme_er_example/screens/home_screen.dart';
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
