import 'package:flutter/material.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/favorite_exercises_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: const FavoriteExercisesViewBody(),
    );
  }
}
