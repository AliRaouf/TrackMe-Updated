class FoodLogModel {
  final int? id, calories, carbohydrates, fat, protein, fiber, iron;
  final String name, description, date;

  FoodLogModel({
    this.id,
    this.calories,
    this.carbohydrates,
    this.fat,
    this.protein,
    this.fiber,
    this.iron,
    required this.name,
    required this.description,
    required this.date,
  });

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
      'date': date,
    };
  }

  factory FoodLogModel.fromMap(Map<String, dynamic> map) {
    return FoodLogModel(
      id: map['id'],
      calories: map['calories'],
      carbohydrates: map['carbohydrates'],
      fat: map['fat'],
      protein: map['protein'],
      fiber: map['fiber'],
      iron: map['iron'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
    );
  }
}
