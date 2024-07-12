import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/core/app_router.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/core/utils/api_service.dart';
import 'package:track_me_updated/features/exercises/data/repo/exercise_repo_implementation.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/cubit/get_exercise_cubit.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo_implementation.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/fetch_recipes/fetch_recipes_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/meal_planner/meal_planner_cubit.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';
import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';
import 'package:track_me_updated/features/workout/data/repo/workout_repository.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_exercise_cubit/workout_exercise_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_plan_cubit/workout_plan_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeCubit.init();
  await DatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
              create: (context) => WorkoutPlanCubit(
                  WorkoutRepository(databaseHelper: DatabaseHelper.instance))
                ..loadWorkoutPlans()),
          BlocProvider(
              create: (context) => WorkoutDayCubit(
                  repository: WorkoutRepository(
                      databaseHelper: DatabaseHelper.instance))),
          BlocProvider(
              create: (context) => WorkoutExerciseCubit(
                  repository: WorkoutRepository(
                      databaseHelper: DatabaseHelper.instance))),
          BlocProvider(
              create: (context) => FetchRecipesCubit(
                    RecipeRepoImplementation(
                      ApiService(
                        Dio(),
                      ),
                    ),
                  )
              // ..fetchRandomRecipes()
              ),
          BlocProvider(
              create: (context) => MealPlannerCubit(
                    RecipeRepoImplementation(
                      ApiService(
                        Dio(),
                      ),
                    ),
                  )),
          BlocProvider(
              create: (context) => GetExerciseCubit(
                    ExerciseRepoImplementation(
                      ApiService(
                        Dio(),
                      ),
                    ),
                  ))
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 800),
            splitScreenMode: false,
            useInheritedMediaQuery: true,
            ensureScreenSize: true,
            builder: (_, child) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    routerConfig: AppRouter.router,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: state.themeMode,
                    debugShowCheckedModeBanner: false,
                  );
                },
              );
            }));
  }
}
