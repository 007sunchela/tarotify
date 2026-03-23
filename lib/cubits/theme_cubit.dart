import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarotify/themes/dark_theme.dart';
import 'package:tarotify/themes/light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightMode) {
    loadThemeFromPrefs();
  }

  // сменить тему
  void toggleTheme() {
    if (state == lightMode) {
      emit(darkMode);
    } else {
      emit(lightMode);
    }
    _saveThemeToPrefs(state);
  }

  // сохранить тему
  Future<void> _saveThemeToPrefs(ThemeData themeData) async {
    final prefs = await SharedPreferences.getInstance();
    int themeIndex = themeData == lightMode ? 0 : 1;
    await prefs.setInt('themeIndex', themeIndex);
  }

  // загрузить тему
  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeIndex') ?? 0;

    if (themeIndex == 0) {
      emit(lightMode);
    } else {
      emit(darkMode);
    }
  }
}
