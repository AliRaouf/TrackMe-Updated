import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/meal_plan_button.dart';

class GenerateMealPlan extends StatelessWidget {
  const GenerateMealPlan({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h),
      child: Column(
        children: [
          const Text(
            "Get a meal plan based on your calorie needs, ingredients and preferences.",
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Calories: "),
              SizedBox(
                width: 0.6.sw,
                child: TextField(
                  controller: calorieController,
                  decoration: const InputDecoration(hintText: "2000"),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Diet: "),
              SizedBox(
                width: 0.6.sw,
                child: TextField(
                  controller: dietController,
                  decoration:
                      const InputDecoration(hintText: "Vegan,vegetarian,..."),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Exclude: "),
              SizedBox(
                width: 0.6.sw,
                child: TextField(
                  controller: excludeController,
                  decoration: const InputDecoration(hintText: "milk, egg, ..."),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          MealPlanButton(
              calorieController: calorieController,
              dietController: dietController,
              excludeController: excludeController)
        ],
      ),
    );
  }
}
