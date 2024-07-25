import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/meal_planner/meal_planner_cubit.dart';

class MealPlanButton extends StatelessWidget {
  const MealPlanButton({
    super.key,
    required this.calorieController,
    required this.dietController,
    required this.excludeController,
  });

  final TextEditingController calorieController;
  final TextEditingController dietController;
  final TextEditingController excludeController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (calorieController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                content: Text(
                  "Calories cannot be empty",
                  style: Theme.of(context).textTheme.bodySmall,
                )));
          } else {
            await context.read<MealPlannerCubit>().fetchMeals(
                "day",
                calorieController.text,
                dietController.text,
                excludeController.text);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            "Get meal plan",
            style: TextStyles.title18Dark,
          ),
        ));
  }
}
