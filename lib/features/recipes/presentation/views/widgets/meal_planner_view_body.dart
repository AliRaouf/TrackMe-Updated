import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/meal_planner/meal_planner_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/search_recipe_id/search_recipe_id_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/selected_meal_recipe_view.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/generate_meal_plan.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<SearchRecipeIdCubit>().searchRecipeId(
                              id: state.meals.meals![index].id!);
                          pushScreen(context,
                              screen: const SelectedMealRecipeView());
                        },
                        child: RecipeContainer(
                          title: state.meals.meals?[index].title,
                          readyIn: state.meals.meals?[index].readyInMinutes
                              .toString(),
                          servings:
                              state.meals.meals?[index].servings.toString(),
                          id: state.meals.meals?[index].id.toString(),
                        ),
                      );
                    },
                    itemCount: state.meals.meals!.length),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Nutrition:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Calories: ${state.meals.nutrients?.calories}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Protein: ${state.meals.nutrients?.protein}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Fat: ${state.meals.nutrients?.fat}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Carbohydrates: ${state.meals.nutrients?.carbohydrates}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return GenerateMealPlan(
              calorieController: calorieController,
              dietController: dietController,
              excludeController: excludeController);
        }
      },
    );
  }
}
