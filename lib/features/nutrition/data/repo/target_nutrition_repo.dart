import 'package:track_me_updated/features/nutrition/data/helper/nutrition_helper.dart';
import 'package:track_me_updated/features/nutrition/data/models/target_nutrition_model.dart';

class TargetNutritionRepo {
  final NutritionHelper nutritionHelper;

  TargetNutritionRepo({required this.nutritionHelper});
  Future<List<TargetNutritionModel>> getTargetNutrition() {
    return nutritionHelper.getTargetNutrition();
  }

  Future<int> updateTargetNutrition(TargetNutritionModel targetNutrition) {
    return nutritionHelper.updateTargetNutrition(targetNutrition);
  }
}
