import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_image.dart';

class SelectedRecipeViewBody extends StatelessWidget {
  const SelectedRecipeViewBody({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RecipeImage(id: recipeModel.id.toString()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Serving Size: ${recipeModel.nutrition?.weightPerServing?.amount ?? 0}g",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Calories: ${recipeModel.nutrition?.nutrients?[0].amount}kcal",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Fat: ${recipeModel.nutrition?.nutrients?[1].amount}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Carbs: ${recipeModel.nutrition?.nutrients?[3].amount}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Fiber: ${recipeModel.nutrition?.nutrients?[20].amount}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saturated Fat: ${recipeModel.nutrition?.nutrients?[2].amount}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Protein: ${recipeModel.nutrition?.nutrients?[9].amount}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Instructions",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        recipeModel.analyzedInstructions?[0].steps?.length,
                    itemBuilder: (context, count) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "${recipeModel.analyzedInstructions?[0].steps?[count].number}) ${recipeModel.analyzedInstructions?[0].steps?[count].step}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
