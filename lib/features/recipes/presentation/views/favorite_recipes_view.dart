import 'package:flutter/material.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/favorite_recipes_view_body.dart';

class FavoriteRecipesView extends StatelessWidget {
  const FavoriteRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Recipes",
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: const FavoriteRecipesViewBody(),
    );
  }
}
