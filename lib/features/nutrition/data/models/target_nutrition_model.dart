class TargetNutritionModel {
  final int? id, calories, carbohydrates, fat, protein, fiber, iron;
  TargetNutritionModel(
      {this.id,
      this.fiber,
      this.iron,
      this.calories,
      this.carbohydrates,
      this.fat,
      this.protein});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'calories': calories,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'protein': protein,
      'fiber': fiber,
      'iron': iron
    };
  }

  TargetNutritionModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        calories = map['calories'],
        carbohydrates = map['carbohydrates'],
        fat = map['fat'],
        protein = map['protein'],
        fiber = map['fiber'],
        iron = map['iron'];
}
