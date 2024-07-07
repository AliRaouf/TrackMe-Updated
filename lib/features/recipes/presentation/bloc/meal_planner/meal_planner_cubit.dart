import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/recipes/data/models/meal_planner_model/meal_planner_model/meal_planner_model.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo.dart';

part 'meal_planner_state.dart';

class MealPlannerCubit extends Cubit<MealPlannerState> {
  MealPlannerCubit(this.recipeRepo) : super(MealPlannerInitial());
  final RecipeRepo recipeRepo;

  Future<void> fetchMeals(String day, targetCalories, diet, exclude) async {
    emit(MealPlannerLoading());
    final result =
        await recipeRepo.getMealPlan(day, targetCalories, diet, exclude);
    result.fold(
      (l) => emit(MealPlannerError(l.errMessage)),
      (r) => emit(MealPlannerSuccess(r)),
    );
  }
}
