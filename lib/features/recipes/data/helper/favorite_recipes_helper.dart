import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';
import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';

class FavoriteRecipesHelper {
  static final FavoriteRecipesHelper instance = FavoriteRecipesHelper._init();
  FavoriteRecipesHelper._init();
  Future<int> insertFavoriteRecipe(FavoriteRecipeModel recipe) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('favorite_recipes', recipe.toMap());
  }

  Future<List<FavoriteRecipeModel>> getFavoriteRecipes() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('favorite_recipes');

    return result.map((map) => FavoriteRecipeModel.fromMap(map)).toList();
  }

  Future<int> deleteFavoriteRecipe(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete(
      'favorite_recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
