part of 'search_recipe_id_cubit.dart';

sealed class SearchRecipeIdState extends Equatable {
  const SearchRecipeIdState();

  @override
  List<Object> get props => [];
}

final class SearchRecipeIdInitial extends SearchRecipeIdState {}

final class SearchRecipeIdLoading extends SearchRecipeIdState {}

final class SearchRecipeIdSuccess extends SearchRecipeIdState {
  final RecipeModel recipe;

  const SearchRecipeIdSuccess(this.recipe);
}

final class SearchRecipeIdError extends SearchRecipeIdState {
  final String errMessage;
  const SearchRecipeIdError(this.errMessage);
}
