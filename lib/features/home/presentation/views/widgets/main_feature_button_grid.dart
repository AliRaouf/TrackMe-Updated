import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/constants.dart';
import 'package:track_me_updated/features/home/presentation/views/widgets/main_feature_button.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_plan_cubit/workout_plan_cubit.dart';

class MainFeatureButtonGrid extends StatefulWidget {
  const MainFeatureButtonGrid({super.key});

  @override
  State<MainFeatureButtonGrid> createState() => _MainFeatureButtonGridState();
}

class _MainFeatureButtonGridState extends State<MainFeatureButtonGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainFeatureButton(
              onTap: () {
                context.push('/nutrition');
              },
              color: Theme.of(context).brightness == Brightness.dark
                  ? kNutritionLogDark
                  : kNutritionLogLight,
              text: 'Nutrition Log',
              image: "assets/images/nutrition.svg",
            ),
            MainFeatureButton(
              onTap: () {
                context.push('/recipes');
              },
              color: Theme.of(context).brightness == Brightness.dark
                  ? kHealtyRecipesDark
                  : kHealtyRecipesLight,
              text: 'Healthy Recipes',
              image: "assets/images/menu.svg",
            ),
          ],
        ),
        const SizedBox(height: 32),
        BlocBuilder<WorkoutPlanCubit, WorkoutPlanState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainFeatureButton(
                  onTap: () {
                    if (state is WorkoutPlanSuccess) {
                      if (state.plans.isNotEmpty) {
                        context
                            .read<WorkoutDayCubit>()
                            .loadWorkoutDays(state.plans.first.id!);
                      }
                      context.push('/exercises');
                    }
                  },
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kExerciseLibaryDark
                      : kExerciseLibaryLight,
                  text: 'Exercise Library',
                  image: "assets/images/exercise.svg",
                ),
                MainFeatureButton(
                  onTap: () {
                    if (state is WorkoutPlanSuccess) {
                      if (state.plans.isEmpty) {
                        context.push('/workout');
                      } else {
                        context
                            .read<WorkoutDayCubit>()
                            .loadWorkoutDays(state.plans.first.id!);
                        context.push('/workout/workout_plan');
                      }
                    }
                  },
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kWorkoutTrackerDark
                      : kWorkoutTrackerLight,
                  text: 'Workout Tracker',
                  image: "assets/images/workout.svg",
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
