import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:track_me_updated/core/failures.dart';
import 'package:track_me_updated/core/utils/api_service.dart';
import 'package:track_me_updated/features/recipes/data/models/meal_planner_model/meal_planner_model.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo.dart';

class RecipeRepoImplementation implements RecipeRepo {
  final ApiService apiService;

  RecipeRepoImplementation(this.apiService);
  @override
  Future<Either<Failures, List<RecipeModel>>> getRandomRecipes() async {
    try {
      var data = await apiService.getRecipe('/recipes/random',
          {'number': '10', 'apiKey': '67dbf1f8abf44194a1c0281cf9fdc1bc'});
      List<RecipeModel> recipes = [];
      for (var item in data['recipes']) {
        recipes.add(RecipeModel.fromJson(item));
      }
      return right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<RecipeModel>>> getSearchRecipes(
      {required String query}) async {
    try {
      var data = await apiService.getRecipe('/recipes/complexSearch', {
        'query': query,
        'addRecipeNutrition': "true",
        'sort': 'popularity',
        'apiKey': '67dbf1f8abf44194a1c0281cf9fdc1bc'
      });
      List<RecipeModel> recipes = [];
      for (var item in data['results']) {
        recipes.add(RecipeModel.fromJson(item));
      }
      return right(recipes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<RecipeModel>>> getSimilarRecipes() {
    // TODO: implement getSimilarRecipes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<MealPlannerModel>>> getMealPlan(
      String day, targetCalories, diet, exclude) async {
    try {
      var data = await apiService.getRecipe('/mealplanner/generate', {
        'timeFrame': day,
        'targetCalories': targetCalories,
        'apiKey': '67dbf1f8abf44194a1c0281cf9fdc1bc',
        'diet': diet,
        'exclude': exclude
      });
      List<MealPlannerModel> meals = [];
      for (var item in data['meals']) {
        meals.add(MealPlannerModel.fromJson(item));
      }
      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
