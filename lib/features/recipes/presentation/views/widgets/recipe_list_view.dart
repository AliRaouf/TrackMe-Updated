import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/views/selected_recipe_view.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_container.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    super.key,
    required this.recipes,
  });
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => pushScreen(context,
              screen: SelectedRecipeView(
                recipeModel: recipes[index],
              ),
              withNavBar: true),
          child: RecipeContainer(
            title: recipes[index].title,
            id: recipes[index].id.toString(),
            rating: recipes[index].aggregateLikes.toString(),
            readyIn: recipes[index].readyInMinutes.toString(),
            score: recipes[index].spoonacularScore,
            servings: recipes[index].servings.toString(),
          ),
        );
      },
    );
  }
}
