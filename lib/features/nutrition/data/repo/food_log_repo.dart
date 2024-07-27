import 'package:track_me_updated/features/nutrition/data/helper/food_log_helper.dart';
import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';

class FoodLogRepo {
  final FoodLogHelper foodLogHelper;

  FoodLogRepo({required this.foodLogHelper});

  Future<List<FoodLogModel>> getFoodLog(String date) async {
    return foodLogHelper.getFoodLogs(date);
  }

  Future<int> addFoodLog(FoodLogModel foodLog) async {
    return foodLogHelper.insertFoodLog(foodLog);
  }

  Future<int> updateFoodLog(FoodLogModel foodLog) async {
    return foodLogHelper.updateFoodLog(foodLog);
  }

  Future<int> deleteFoodLog(FoodLogModel foodLog) async {
    return foodLogHelper.deleteFoodLog(foodLog.id!);
  }
}
