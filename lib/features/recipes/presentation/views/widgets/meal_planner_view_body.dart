import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/meal_planner/meal_planner_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_container.dart';

class MealPlannerViewBody extends StatelessWidget {
  MealPlannerViewBody({super.key});
  final calorieController = TextEditingController();
  final dietController = TextEditingController();
  final excludeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealPlannerCubit, MealPlannerState>(
      builder: (context, state) {
        if (state is MealPlannerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealPlannerError) {
          return Center(child: Text(state.errMessage));
        } else if (state is MealPlannerSuccess) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return RecipeContainer(
                  title: state.meals[index].title,
                  readyIn: state.meals[index].readyInMinutes.toString(),
                  servings: state.meals[index].servings.toString(),
                  id: state.meals[index].id.toString(),
                  
                ) },
              itemCount: state.meals.length);
        } else {
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
                        decoration: const InputDecoration(
                            hintText: "Vegan,vegetarian,..."),
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
                        decoration:
                            const InputDecoration(hintText: "milk, egg, ..."),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (calorieController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
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
                        print("noice");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Get meal plan",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ))
              ],
            ),
          );
        }
      },
    );
  }
}
