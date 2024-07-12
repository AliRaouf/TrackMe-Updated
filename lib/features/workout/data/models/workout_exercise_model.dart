import 'dart:convert';

class WorkoutExercise {
  final int? id;
  final int dayId;
  final String exerciseName;
  final String bodyPart;
  final String target;
  final String secondaryMuscles;
  final String equipmentNeeded;
  final String gifUrl;
  final List<dynamic> instructions;

  WorkoutExercise(
      {this.id,
      required this.dayId,
      required this.exerciseName,
      required this.bodyPart,
      required this.target,
      required this.secondaryMuscles,
      required this.equipmentNeeded,
      required this.gifUrl,
      required this.instructions});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day_id': dayId,
      'exercise_name': exerciseName,
      'body_part': bodyPart,
      'target': target,
      'secondary_muscles': secondaryMuscles,
      'equipment_needed': equipmentNeeded,
      'gif_url': gifUrl,
      'instructions': jsonEncode(instructions)
    };
  }

  factory WorkoutExercise.fromMap(Map<String, dynamic> map) {
    return WorkoutExercise(
      id: map['id'],
      dayId: map['day_id'],
      exerciseName: map['exercise_name'],
      bodyPart: map['body_part'],
      target: map['target'],
      secondaryMuscles: map['secondary_muscles'],
      equipmentNeeded: map['equipment_needed'],
      gifUrl: map['gif_url'],
      instructions: List<dynamic>.from(json.decode(map['instructions'])),
    );
  }
}
