import 'package:equatable/equatable.dart';

class MealPlannerModel extends Equatable {
  final int? id;
  final String? imageType;
  final String? title;
  final int? readyInMinutes;
  final int? servings;
  final String? sourceUrl;

  const MealPlannerModel({
    this.id,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
  });

  factory MealPlannerModel.fromJson(Map<String, dynamic> json) {
    return MealPlannerModel(
      id: json['id'] as int?,
      imageType: json['imageType'] as String?,
      title: json['title'] as String?,
      readyInMinutes: json['readyInMinutes'] as int?,
      servings: json['servings'] as int?,
      sourceUrl: json['sourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageType': imageType,
        'title': title,
        'readyInMinutes': readyInMinutes,
        'servings': servings,
        'sourceUrl': sourceUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      imageType,
      title,
      readyInMinutes,
      servings,
      sourceUrl,
    ];
  }
}
