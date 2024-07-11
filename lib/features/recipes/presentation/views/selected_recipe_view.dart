import 'package:flutter/material.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/selected_recipe_view_body.dart';

class SelectedRecipeView extends StatelessWidget {
  const SelectedRecipeView({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
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
