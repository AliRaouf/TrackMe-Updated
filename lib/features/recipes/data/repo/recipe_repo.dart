import 'package:dartz/dartz.dart';
import 'package:track_me_updated/core/failures.dart';
import 'package:track_me_updated/features/recipes/data/models/meal_planner_model/meal_planner_model/meal_planner_model.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';

abstract class RecipeRepo {
  Future<Either<Failures, List<RecipeModel>>> getSearchRecipes(
      {required String query});
  Future<Either<Failures, List<RecipeModel>>> getSimilarRecipes();
  Future<Either<Failures, List<RecipeModel>>> getRandomRecipes();
  Future<Either<Failures, MealPlannerModel>> getMealPlan(
      String day, targetCalories, diet, exclude);
}
