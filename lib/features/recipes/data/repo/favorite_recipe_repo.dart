import 'package:track_me_updated/features/recipes/data/helper/favorite_recipes_helper.dart';
import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';

class FavoriteRecipeRepository {
  final FavoriteRecipesHelper favoriteRecipesHelper;

  FavoriteRecipeRepository({required this.favoriteRecipesHelper});

  Future<int> addFavoriteRecipe(FavoriteRecipeModel recipe) {
    return favoriteRecipesHelper.insertFavoriteRecipe(recipe);
  }

  Future<List<FavoriteRecipeModel>> getFavoriteRecipes() {
    return favoriteRecipesHelper.getFavoriteRecipes();
  }

  Future<int> deleteFavoriteRecipe(int id) {
    return favoriteRecipesHelper.deleteFavoriteRecipe(id);
  }
}
