import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
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
        return RecipeContainer(
          title: recipes[index].title,
          id: recipes[index].id.toString(),
          rating: recipes[index].aggregateLikes.toString(),
          readyIn: recipes[index].readyInMinutes.toString(),
          score: recipes[index].spoonacularScore,
          servings: recipes[index].servings.toString(),
        );
      },
    );
  }
}
