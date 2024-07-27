import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';
import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';

class FoodLogHelper {
  static final FoodLogHelper instance = FoodLogHelper._();
  FoodLogHelper._();
  Future<List<FoodLogModel>> getFoodLogs(String date) async {
    final db = await DatabaseHelper.instance.database;
    final result =
        await db.query('food_log', where: 'date = ?', whereArgs: [date]);
    return result.map((map) => FoodLogModel.fromMap(map)).toList();
  }

  Future<int> insertFoodLog(FoodLogModel foodLog) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('food_log', foodLog.toMap());
  }

  Future<int> updateFoodLog(FoodLogModel foodLog) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update('food_log', foodLog.toMap(),
        where: 'id = ?', whereArgs: [foodLog.id]);
  }

  Future<int> deleteFoodLog(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('food_log', where: 'id = ?', whereArgs: [id]);
  }
}
