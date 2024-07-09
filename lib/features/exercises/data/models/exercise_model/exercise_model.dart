import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String? bodyPart;
  final String? equipment;
  final String? gifUrl;
  final String? id;
  final String? name;
  final String? target;
  final List<dynamic>? secondaryMuscles;
  final List<dynamic>? instructions;

  const ExerciseModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
    this.secondaryMuscles,
    this.instructions,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        bodyPart: json['bodyPart'] as String?,
        equipment: json['equipment'] as String?,
        gifUrl: json['gifUrl'] as String?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        target: json['target'] as String?,
        secondaryMuscles: json['secondaryMuscles'] as List<dynamic>?,
        instructions: json['instructions'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'bodyPart': bodyPart,
        'equipment': equipment,
        'gifUrl': gifUrl,
        'id': id,
        'name': name,
        'target': target,
        'secondaryMuscles': secondaryMuscles,
        'instructions': instructions,
      };

  @override
  List<Object?> get props {
    return [
      bodyPart,
      equipment,
      gifUrl,
      id,
      name,
      target,
      secondaryMuscles,
      instructions,
    ];
  }
}
