import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/recipes/data/models/favorite_recipe_model.dart';
import 'package:track_me_updated/features/recipes/data/repo/favorite_recipe_repo.dart';

part 'favorite_recipes_state.dart';

class FavoriteRecipesCubit extends Cubit<FavoriteRecipesState> {
  final FavoriteRecipeRepository repository;
  FavoriteRecipesCubit(this.repository) : super(FavoriteRecipesInitial());
  Future<void> loadFavoriteRecipes() async {
    emit(FavoriteRecipesLoading());
    try {
      final recipes = await repository.getFavoriteRecipes();
      emit(FavoriteRecipesSuccess(recipes));
    } catch (e) {
      emit(const FavoriteRecipesError("Failed to load workout plans"));
    }
  }

  Future<void> addFavoriteRecipe(FavoriteRecipeModel recipe) async {
    emit(FavoriteRecipesLoading());
    try {
      await repository.addFavoriteRecipe(recipe);
      final recipes = await repository.getFavoriteRecipes();
      emit(FavoriteRecipesSuccess(recipes));
    } catch (e) {
      emit(const FavoriteRecipesError("Failed to add FavoriteRecipe"));
    }
  }

  Future<void> deleteFavoriteRecipe(int id) async {
    emit(FavoriteRecipesLoading());
    try {
      await repository.deleteFavoriteRecipe(id);
      final recipes = await repository.getFavoriteRecipes();
      emit(FavoriteRecipesSuccess(recipes));
    } catch (e) {
      emit(const FavoriteRecipesError("Failed to delete Recipe"));
    }
  }
}
