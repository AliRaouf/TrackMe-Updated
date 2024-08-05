import 'package:flutter/material.dart';
import 'package:track_me_updated/constants.dart';
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
      titleLarge: TextStyles.title32Dark),
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
    primary: kNutritionLogLight,
    outline: kNutritionLogLight,
  ),
  floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
    backgroundColor: kNutritionLogLight,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kNutritionLogLight,
    titleTextStyle: TextStyles.title22Dark,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8)),
          backgroundColor: WidgetStatePropertyAll(kNutritionLogLight))),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kWorkoutTrackerLight),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    labelStyle: TextStyles.title18Light,
    hintStyle: const TextStyle(color: Colors.grey),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
);
final ThemeData healthyRecipesLightTheme = lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: kHealtyRecipesLight, // Light Green
      outline: kHealtyRecipesLight, // Light Green
    ),
    textTheme: lightTheme.textTheme.copyWith(),
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(kHealtyRecipesLight))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: const AppBarTheme(
      backgroundColor: kHealtyRecipesLight, // Light Purple
      titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
    ));
final ThemeData exercisesLibraryLightTheme = lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: kExerciseLibaryLight,
      outline: kExerciseLibaryLight,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(kExerciseLibaryLight))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: kExerciseLibaryLight,
    ));
final ThemeData workoutTrackerLightTheme = lightTheme.copyWith(
    colorScheme: lightTheme.colorScheme.copyWith(
      primary: kWorkoutTrackerLight, // Light Purple
      outline: kWorkoutTrackerLight, // Light Purple
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(kWorkoutTrackerLight))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: kWorkoutTrackerLight,
    ));

final ThemeData nutritionLogDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: kNutritionLogDark, // Teal
    outline: kNutritionLogDark,
  ),
  floatingActionButtonTheme: darkTheme.floatingActionButtonTheme.copyWith(
    backgroundColor: kNutritionLogDark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kNutritionLogDark,
    titleTextStyle: TextStyles.title22Dark,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kNutritionLogDark))),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kWorkoutTrackerDark),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    labelStyle: TextStyles.title18Dark,
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
);
final ThemeData healthyRecipesDarkTheme = darkTheme.copyWith(
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: const Color(0xFF106033), // Dark Green
      outline: const Color(0xFF106033), // Dark Green
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kHealtyRecipesDark,
      titleTextStyle: TextStyles.title22Dark,
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
    colorScheme: darkTheme.colorScheme.copyWith(
      primary: const Color(0xFF7E57C2), // Dark Purple
      outline: const Color(0xFF7E57C2), // Dark Purple
      secondary: const Color(0xFF1e1e1e),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFF7E57C2)))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: darkTheme.appBarTheme.copyWith(
      backgroundColor: const Color(0xFF7E57C2),
    ));
