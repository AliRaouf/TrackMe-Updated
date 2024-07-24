part of 'favorite_recipes_cubit.dart';

sealed class FavoriteRecipesState extends Equatable {
  const FavoriteRecipesState();

  @override
  List<Object> get props => [];
}

final class FavoriteRecipesInitial extends FavoriteRecipesState {}

final class FavoriteRecipesLoading extends FavoriteRecipesState {}

final class FavoriteRecipesSuccess extends FavoriteRecipesState {
  final List<FavoriteRecipeModel> recipes;

  const FavoriteRecipesSuccess(this.recipes);
}

final class FavoriteRecipesError extends FavoriteRecipesState {
  final String errMessage;

  const FavoriteRecipesError(this.errMessage);
}
