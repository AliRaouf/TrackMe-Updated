import 'package:equatable/equatable.dart';

import 'meal.dart';
import 'nutrients.dart';

class MealPlannerModel extends Equatable {
  final List<Meal>? meals;
  final Nutrients? nutrients;

  const MealPlannerModel({this.meals, this.nutrients});

  factory MealPlannerModel.fromJson(Map<String, dynamic> json) {
    return MealPlannerModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutrients: json['nutrients'] == null
          ? null
          : Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'meals': meals?.map((e) => e.toJson()).toList(),
        'nutrients': nutrients?.toJson(),
      };

  @override
  List<Object?> get props => [meals, nutrients];
}
