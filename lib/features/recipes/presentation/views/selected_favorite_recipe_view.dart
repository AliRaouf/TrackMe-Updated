import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/favorite_recipes/favorite_recipes_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/selected_favorite_recipe_view_body.dart';

class SelectedFavoriteRecipeView extends StatelessWidget {
  final FavoriteRecipeModel favoriteRecipeModel;
  const SelectedFavoriteRecipeView(
      {super.key, required this.favoriteRecipeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            BlocBuilder<FavoriteRecipesCubit, FavoriteRecipesState>(
              builder: (context, state) {
                if (state is FavoriteRecipesSuccess) {
                  bool isInFavorites = state.recipes.any(
                      (recipe) => recipe.title == favoriteRecipeModel.title);
                  return IconButton(
                    onPressed: () {
                      if (isInFavorites) {
                        final recipe = state.recipes.firstWhere((recipe) =>
                            recipe.title == favoriteRecipeModel.title);
                        context
                            .read<FavoriteRecipesCubit>()
                            .deleteFavoriteRecipe(recipe.id!);
                      } else {
                        context
                            .read<FavoriteRecipesCubit>()
                            .addFavoriteRecipe(favoriteRecipeModel);
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
            favoriteRecipeModel.title,
            style: TextStyles.title18Dark,
          )),
      body: SelectedFavoriteRecipeViewBody(
        favoriteRecipeModel: favoriteRecipeModel,
      ),
    );
  }
}
