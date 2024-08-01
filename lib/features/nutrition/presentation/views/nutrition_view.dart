import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/add_food_log_view.dart';

import 'package:track_me_updated/features/nutrition/presentation/views/widgets/nutrition_view_body.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () {
            pushScreenWithoutNavBar(context, const AddFoodLogView());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: const NutritionViewBody(),
    );
  }
}
