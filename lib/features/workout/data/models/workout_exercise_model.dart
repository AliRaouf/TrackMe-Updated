class WorkoutExercise {
  final int? id;
  final int dayId;
  final String exerciseName;

  WorkoutExercise({this.id, required this.dayId, required this.exerciseName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day_id': dayId,
      'exercise_name': exerciseName,
    };
  }

  factory WorkoutExercise.fromMap(Map<String, dynamic> map) {
    return WorkoutExercise(
      id: map['id'],
      dayId: map['day_id'],
      exerciseName: map['exercise_name'],
    );
  }
}
