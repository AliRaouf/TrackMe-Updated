import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo.dart';

part 'search_recipe_id_state.dart';

class SearchRecipeIdCubit extends Cubit<SearchRecipeIdState> {
  SearchRecipeIdCubit(this.recipeRepo) : super(SearchRecipeIdInitial());
  final RecipeRepo recipeRepo;
  Future<void> searchRecipeId({required int id}) async {
    emit(SearchRecipeIdLoading());
    final result = await recipeRepo.getRecipeByID(id: id);
    result.fold(
      (l) {
        emit(SearchRecipeIdError(l.errMessage));
      },
      (r) {
        emit(SearchRecipeIdSuccess(r));
      },
    );
  }
}
