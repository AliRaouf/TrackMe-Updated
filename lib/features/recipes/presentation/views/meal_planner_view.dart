import 'package:flutter/material.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/meal_planner_view_body.dart';

class MealPlannerView extends StatelessWidget {
  const MealPlannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Meal Planner", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: MealPlannerViewBody(),
    );
  }
}
