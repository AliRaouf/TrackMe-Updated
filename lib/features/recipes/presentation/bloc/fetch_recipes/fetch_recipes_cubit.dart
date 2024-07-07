import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo.dart';

part 'fetch_recipes_state.dart';

class FetchRecipesCubit extends Cubit<FetchRecipesState> {
  FetchRecipesCubit(this.recipeRepo) : super(FetchRecipesInitial());
  final RecipeRepo recipeRepo;
  Future<void> fetchRandomRecipes() async {
    emit(FetchRandomRecipesLoading());
    final result = await recipeRepo.getRandomRecipes();
    result.fold(
      (l) => emit(FetchRandomRecipesError(l.errMessage)),
      (r) => emit(FetchRandomRecipesSuccess(r)),
    );
  }

  Future<void> fetchSearchRecipes({required String query}) async {
    emit(FetchSearchRecipesLoading());
    final result = await recipeRepo.getSearchRecipes(query: query);
    result.fold(
      (l) {
        emit(FetchSearchRecipesError(l.errMessage));
      },
      (r) {
        emit(FetchSearchRecipesSuccess(r));
      },
    );
  }
}
