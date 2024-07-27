import 'package:flutter/material.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/nutrition_view_body.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NutritionViewBody(),
    );
  }
}
