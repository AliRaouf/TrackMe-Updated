import 'package:go_router/go_router.dart';
import 'package:track_me_updated/features/exercises/presentation/views/exercises_bottom_navbar.dart';
import 'package:track_me_updated/features/home/presentation/views/home_view.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/nutrition_bottom_nav_bar.dart';
import 'package:track_me_updated/features/recipes/presentation/views/bottom_nav_bar.dart';
import 'package:track_me_updated/features/settings/presentation/views/settings_view.dart';
import 'package:track_me_updated/features/workout/presentation/views/weekly_schedule_view.dart';
import 'package:track_me_updated/features/workout/presentation/views/workout_plan_view.dart';
import 'package:track_me_updated/features/workout/presentation/views/workout_split_view.dart';
import 'package:track_me_updated/features/workout/presentation/views/workout_tracker_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/nutrition',
        builder: (context, state) => const NutritionBottomNavBar(),
      ),
      GoRoute(
        path: '/recipes',
        builder: (context, state) => const RecipeBottomNavBar(),
      ),
      GoRoute(
        path: '/exercises',
        builder: (context, state) => const ExerciseBottomNavBar(),
      ),
      GoRoute(
          path: '/workout',
          builder: (context, state) => const WorkoutTrackerView(),
          routes: [
            GoRoute(
              path: 'weekly_schedule',
              builder: (context, state) => const WeeklyScheduleView(),
            ),
            GoRoute(
              path: 'workout_split',
              builder: (context, state) => const WorkoutSplitView(),
            ),
            GoRoute(
              path: 'workout_plan',
              builder: (context, state) => const WorkoutPlanView(),
            )
          ]),
    ],
  );
}
