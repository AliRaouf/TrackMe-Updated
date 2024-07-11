class WorkoutPlan {
  final int? id;
  final String name;
  final String type;

  WorkoutPlan({this.id, required this.name, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  factory WorkoutPlan.fromMap(Map<String, dynamic> map) {
    return WorkoutPlan(
      id: map['id'],
      name: map['name'],
      type: map['type'],
    );
  }
}
