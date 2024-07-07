import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: loadThemeMode()));
  static ThemeCubit get(context) => BlocProvider.of(context);
  static SharedPreferences? _prefs;
  static ThemeMode loadThemeMode() {
    final themeModeString = _prefs?.getString('themeMode') ?? 'system';
    return themeModeFromString(themeModeString);
  }

  void changeTheme({required ThemeMode themeMode}) {
    _prefs?.setString('themeMode', themeModeToString(themeMode));
    emit(ThemeState(themeMode: themeMode));
  }

  static ThemeMode themeModeFromString(String themeModeString) {
    switch (themeModeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  String themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
      default:
        return 'system';
    }
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
