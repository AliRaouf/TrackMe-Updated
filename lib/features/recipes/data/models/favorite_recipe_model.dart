import 'dart:convert';

class FavoriteRecipeModel {
  final int? id;
  final String title;
  final String image;
  final String serving;
  final String calories;
  final String fat;
  final String carbs;
  final String fiber;
  final String satFat;
  final String protein;
  final String readyIn;
  final String recipeID;
  final List<dynamic> instructions;
  FavoriteRecipeModel(
      {this.id,
      required this.title,
      required this.readyIn,
      required this.recipeID,
      required this.image,
      required this.serving,
      required this.calories,
      required this.fat,
      required this.carbs,
      required this.fiber,
      required this.satFat,
      required this.protein,
      required this.instructions});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'serving': serving,
      'calories': calories,
      'fat': fat,
      'carbs': carbs,
      'fiber': fiber,
      'satFat': satFat,
      'protein': protein,
      'readyIn': readyIn,
      'recipeID': recipeID,
      'instructions': jsonEncode(instructions),
    };
  }

  factory FavoriteRecipeModel.fromMap(Map<String, dynamic> map) {
    return FavoriteRecipeModel(
        id: map['id'],
        title: map['title'],
        image: map['image'],
        serving: map['serving'],
        calories: map['calories'],
        fat: map['fat'],
        carbs: map['carbs'],
        fiber: map['fiber'],
        satFat: map['satFat'],
        protein: map['protein'],
        readyIn: map['readyIn'],
        recipeID: map['recipeID'],
        instructions: jsonDecode(map['instructions']));
  }
}
