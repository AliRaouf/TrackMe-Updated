import 'package:track_me_updated/features/exercises/data/helper/favorite_exercise_helper.dart';
import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';

class FavoriteExerciseRepo {
  final FavoriteExerciseHelper favoriteExerciseHelper;

  FavoriteExerciseRepo({required this.favoriteExerciseHelper});

  Future<int> addFavoriteExercise(FavoriteExerciseModel exercise) {
    return favoriteExerciseHelper.insertFavoriteExercise(exercise);
  }

  Future<List<FavoriteExerciseModel>> getFavoriteExercises() {
    return favoriteExerciseHelper.getFavoriteExercises();
  }

  Future<int> deleteFavoriteExercise(int id) {
    return favoriteExerciseHelper.deleteFavoriteExercise(id);
  }
}
