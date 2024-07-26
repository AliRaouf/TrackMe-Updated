import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_image.dart';

class SelectedFavoriteRecipeViewBody extends StatelessWidget {
  const SelectedFavoriteRecipeViewBody(
      {super.key, required this.favoriteRecipeModel});
  final FavoriteRecipeModel favoriteRecipeModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RecipeImage(id: favoriteRecipeModel.recipeID.toString()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Servings: ${favoriteRecipeModel.serving}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Calories: ${favoriteRecipeModel.calories}kcal",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Fat: ${favoriteRecipeModel.fat}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Carbs: ${favoriteRecipeModel.carbs}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Fiber: ${favoriteRecipeModel.fiber}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saturated Fat: ${favoriteRecipeModel.satFat}g",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Protein: ${favoriteRecipeModel.protein}g",
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
                        favoriteRecipeModel.instructions[0]["steps"].length,
                    itemBuilder: (context, count) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "${favoriteRecipeModel.instructions[0]["steps"][count]["number"]}) ${favoriteRecipeModel.instructions[0]["steps"][count]["step"]}",
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
