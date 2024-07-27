class FoodLogModel {
  final int? id, calories, carbohydrates, fat, protein, fiber, iron;
  final String? name, description, date;

  FoodLogModel(
      {this.id,
      this.calories,
      this.carbohydrates,
      this.fat,
      this.protein,
      this.fiber,
      this.iron,
      this.name,
      this.description,
      this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'calories': calories,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'protein': protein,
      'fiber': fiber,
      'iron': iron,
      'name': name,
      'description': description,
      'date': date
    };
  }
}
