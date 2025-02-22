import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../theme_repository.dart';
import '../../presentation/bloc/theme_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  final settingsBox = await Hive.openBox('settings');

  sl.registerLazySingleton<Box>(() => settingsBox);
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepository(sl<Box>()));
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc(sl<ThemeRepository>()));
}
