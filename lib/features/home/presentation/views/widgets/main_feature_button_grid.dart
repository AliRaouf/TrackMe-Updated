import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/constants.dart';
import 'package:track_me_updated/features/home/presentation/views/widgets/main_feature_button.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout/workout_cubit.dart';

class MainFeatureButtonGrid extends StatelessWidget {
  const MainFeatureButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainFeatureButton(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainFeatureButton(
              onTap: () {
                context.push('/exercises');
              },
              color: Theme.of(context).brightness == Brightness.dark
                  ? kExerciseLibaryDark
                  : kExerciseLibaryLight,
              text: 'Exercise Library',
              image: "assets/images/exercise.svg",
            ),
            BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                return MainFeatureButton(
                  onTap: () {
                    if (state is WorkoutPlanSuccess) {
                      if (state.plans.isEmpty) {
                        context.push('/workout');
                      } else {
                        context
                            .read<WorkoutCubit>()
                            .loadWorkoutDays(state.plans.first.id!);
                        context.push('/workout/wokout_plan');
                      }
                    }
                  },
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kWorkoutTrackerDark
                      : kWorkoutTrackerLight,
                  text: 'Workout Tracker',
                  image: "assets/images/workout.svg",
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
