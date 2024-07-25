import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/favorite_recipes/favorite_recipes_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_container.dart';

class FavoriteRecipesViewBody extends StatelessWidget {
  const FavoriteRecipesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteRecipesCubit, FavoriteRecipesState>(
      builder: (context, state) {
        if (state is FavoriteRecipesSuccess) {
          if (state.recipes.isNotEmpty) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return RecipeContainer(
                    title: state.recipes[index].title,
                    readyIn: state.recipes[index].readyIn,
                    id: state.recipes[index].recipeID,
                    servings: state.recipes[index].serving,
                  );
                },
                itemCount: state.recipes.length);
          } else {
            return const Center(
              child: Text("No favorite recipes added yet"),
            );
          }
        } else if (state is FavoriteRecipesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text("Start Adding Recipes to your favorites"),
          );
        }
      },
    );
  }
}
