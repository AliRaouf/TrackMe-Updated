import 'package:equatable/equatable.dart';

class Nutrients extends Equatable {
  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbohydrates;

  const Nutrients({
    this.calories,
    this.protein,
    this.fat,
    this.carbohydrates,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        calories: (json['calories'] as num?)?.toDouble(),
        protein: (json['protein'] as num?)?.toDouble(),
        fat: (json['fat'] as num?)?.toDouble(),
        carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'calories': calories,
        'protein': protein,
        'fat': fat,
        'carbohydrates': carbohydrates,
      };

  @override
  List<Object?> get props => [calories, protein, fat, carbohydrates];
}
