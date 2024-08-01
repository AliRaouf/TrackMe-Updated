import 'package:track_me_updated/features/nutrition/data/models/target_nutrition_model.dart';
import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';

class NutritionHelper {
  static final NutritionHelper instance = NutritionHelper._init();
  NutritionHelper._init();
  Future<List<TargetNutritionModel>> getTargetNutrition() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query('target_nutrition');
    return result.map((map) => TargetNutritionModel.fromMap(map)).toList();
  }

  Future<int> updateSingleValue(int id, String columnName, int newValue) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(
      'target_nutrition',
      {columnName: newValue},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
