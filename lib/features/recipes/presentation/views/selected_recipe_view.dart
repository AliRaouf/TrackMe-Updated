import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/favorite_recipes/favorite_recipes_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/selected_recipe_view_body.dart';

class SelectedRecipeView extends StatelessWidget {
  const SelectedRecipeView({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            BlocBuilder<FavoriteRecipesCubit, FavoriteRecipesState>(
              builder: (context, state) {
                if (state is FavoriteRecipesSuccess) {
                  bool isInFavorites = state.recipes
                      .any((recipe) => recipe.title == recipeModel.title);
                  return IconButton(
                    onPressed: () {
                      if (isInFavorites) {
                        final recipe = state.recipes.firstWhere(
                            (recipe) => recipe.title == recipeModel.title);
                        context
                            .read<FavoriteRecipesCubit>()
                            .deleteFavoriteRecipe(recipe.id!);
                      } else {
                        context.read<FavoriteRecipesCubit>().addFavoriteRecipe(
                            FavoriteRecipeModel(
                                readyIn: recipeModel.readyInMinutes.toString(),
                                recipeID: recipeModel.id.toString(),
                                title: recipeModel.title!,
                                image: recipeModel.image!,
                                serving: recipeModel.servings.toString(),
                                calories: recipeModel
                                    .nutrition!.nutrients![0].amount
                                    .toString(),
                                fat: recipeModel.nutrition!.nutrients![1].amount
                                    .toString(),
                                carbs: recipeModel
                                    .nutrition!.nutrients![3].amount
                                    .toString(),
                                fiber: recipeModel
                                    .nutrition!.nutrients![20].amount
                                    .toString(),
                                satFat: recipeModel
                                    .nutrition!.nutrients![2].amount
                                    .toString(),
                                protein: recipeModel
                                    .nutrition!.nutrients![9].amount
                                    .toString(),
                                instructions:
                                    recipeModel.analyzedInstructions!));
                      }
                    },
                    icon: Icon(isInFavorites
                        ? Icons.favorite
                        : Icons.favorite_outline),
                    color: isInFavorites ? Colors.red : Colors.white,
                  );
                } else if (state is FavoriteRecipesError) {
                  return const Icon(Icons.error);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
          automaticallyImplyLeading: false,
          title: Text(
            recipeModel.title ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          )),
      body: SelectedRecipeViewBody(
        recipeModel: recipeModel,
      ),
    );
  }
}
