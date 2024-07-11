class WorkoutDay {
  final int? id;
  final int planId;
  final String name;

  WorkoutDay({this.id, required this.planId, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plan_id': planId,
      'name': name,
    };
  }

  factory WorkoutDay.fromMap(Map<String, dynamic> map) {
    return WorkoutDay(
      id: map['id'],
      planId: map['plan_id'],
      name: map['name'],
    );
  }
}
