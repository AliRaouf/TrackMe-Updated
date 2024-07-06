part of 'fetch_recipes_cubit.dart';

sealed class FetchRecipesState extends Equatable {
  const FetchRecipesState();

  @override
  List<Object> get props => [];
}

final class FetchRecipesInitial extends FetchRecipesState {}

final class FetchRandomRecipesLoading extends FetchRecipesState {}

final class FetchRandomRecipesSuccess extends FetchRecipesState {
  final List<RecipeModel> recipes;

  const FetchRandomRecipesSuccess(this.recipes);
}

final class FetchRandomRecipesError extends FetchRecipesState {
  final String errMessage;

  const FetchRandomRecipesError(this.errMessage);
}

final class FetchSearchRecipesLoading extends FetchRecipesState {}

final class FetchSearchRecipesSuccess extends FetchRecipesState {
  final List<RecipeModel> recipes;

  const FetchSearchRecipesSuccess(this.recipes);
}

final class FetchSearchRecipesError extends FetchRecipesState {
  final String errMessage;

  const FetchSearchRecipesError(this.errMessage);
}
