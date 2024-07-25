import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';
import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';

class FavoriteExerciseHelper {
  static final FavoriteExerciseHelper instance = FavoriteExerciseHelper._init();
  FavoriteExerciseHelper._init();
  Future<int> insertFavoriteExercise(FavoriteExerciseModel exercise) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('favorite_exercises', exercise.toMap());
  }

  Future<List<FavoriteExerciseModel>> getFavoriteExercises() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('favorite_exercises');

    return result.map((map) => FavoriteExerciseModel.fromMap(map)).toList();
  }

  Future<int> deleteFavoriteExercise(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(
      'favorite_exercises',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
