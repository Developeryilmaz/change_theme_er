import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme_repository.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc(this.themeRepository) : super(ThemeState(themeMode: ThemeMode.system)) {
    on<LoadTheme>((event, emit) {
      final savedTheme = themeRepository.getTheme();
      emit(ThemeState(themeMode: savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light));
    });

    on<ToggleTheme>((event, emit) {
      final newMode = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      themeRepository.saveTheme(newMode == ThemeMode.dark ? 'dark' : 'light');
      emit(ThemeState(themeMode: newMode));
    });
  }
}