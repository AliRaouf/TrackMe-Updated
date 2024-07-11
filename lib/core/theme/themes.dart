import 'package:flutter/material.dart';
import 'package:track_me_updated/core/styles.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF7E57C2), // Medium Purple
    secondary: Colors.grey.shade300,
    outline: const Color(0xFF212121),
    surface: const Color(0xFFFAFAFA), // Very light gray
    onPrimary: const Color(0xFFFFFFFF), // Text color on primary
    onSecondary: const Color(0xFFFFFFFF), // Text color on secondary
    onSurface: const Color(0xFF212121), // Text color on surface
  ),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  textTheme: TextTheme(
      bodySmall: TextStyles.body16Light, // Dark Gray
      bodyMedium: TextStyles.body20Light, // Dark Gray
      titleMedium: TextStyles.title22Light, // Light Gray
      titleSmall: TextStyles.title18Light, // Light Gray
      titleLarge: TextStyles.title32Light),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF4081)), // Pink
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF7E57C2), // Medium Purple
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBB86FC), // Light Purple
    secondary: Color(0xFF1e1e1e),
    outline: Color(0xFFFAFAFA),
    surface: Color(0xFF121212), // Almost Black
    onPrimary: Color(0xFFFFFFFF), // Text color on primary
    onSecondary: Color(0xFFFFFFFF), // Text color on background
    onSurface: Color(0xFFFFFFFF), // Text color on surface
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: TextTheme(
      bodyMedium: TextStyles.body20Dark,
      bodySmall: TextStyles.body16Dark,
      titleMedium: TextStyles.title22Dark, // Gray
      titleSmall: TextStyles.title18Dark, // Gray
      titleLarge: TextStyles.title32Dark),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFbb86fc)), // Pink
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFBB86FC), // Light Purple
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
);

// Specific Themes for Nutrition and Exercises
final ThemeData nutritionLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF009688), // Teal
  ),
);
final ThemeData nutritionLogLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFFFE3947), // Light Red
  ),
);
final ThemeData healthyRecipesLightTheme = lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: const Color(0xFF4FF885), // Light Green
      outline: const Color(0xFF4FF885), // Light Green
    ),
    textTheme: lightTheme.textTheme.copyWith(),
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff4FF885)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4FF885), // Light Purple
      titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
    ));
final ThemeData exercisesLibraryLightTheme = lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: const Color(0xFF67c6e8),
      outline: const Color(0xFF67c6e8),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff67c6e8)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF67c6e8),
    ));
final ThemeData workoutTrackerLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFFCEA3FF), // Light Purple
  ),
);

final ThemeData nutritionDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: const Color(0xFF03DAC6), // Teal
  ),
);
final ThemeData nutritionLogDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: const Color(0xFFA41E1E), // Teal
  ),
);
final ThemeData healthyRecipesDarkTheme = darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: const Color(0xFF106033), // Dark Green
      outline: const Color(0xFF106033), // Dark Green
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF106033), // Light Purple
      titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff106033)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
final ThemeData exercisesLibraryDarkTheme = darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: const Color(0xFF1D3557), // Dark Blue
      outline: const Color(0xFF1D3557), // Dark Blue
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff1d3557)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: darkTheme.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF1D3557),
    ));
final ThemeData workoutTrackerDarkTheme = darkTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: const Color(0xFF461D82), // Dark Purple
      outline: const Color(0xFF461D82), // Dark Purple
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFF461D82)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: darkTheme.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF461D82),
    ));
