import 'package:track_me_updated/features/workout/data/helper/db_helper.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_exercise_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';

class WorkoutRepository {
  final DatabaseHelper databaseHelper;

  WorkoutRepository({required this.databaseHelper});

  // Workout Plan operations
  Future<int> addWorkoutPlan(WorkoutPlan plan) {
    return databaseHelper.insertWorkoutPlan(plan);
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() {
    return databaseHelper.getWorkoutPlans();
  }

  Future<int> updateWorkoutPlan(WorkoutPlan plan) {
    return databaseHelper.updateWorkoutPlan(plan);
  }

  Future<int> deleteWorkoutPlan(int id) {
    return databaseHelper.deleteWorkoutPlan(id);
  }

  // Workout Day operations
  Future<int> addWorkoutDay(WorkoutDay day) {
    return databaseHelper.insertWorkoutDay(day);
  }

  Future<List<WorkoutDay>> getWorkoutDays(int planId) {
    return databaseHelper.getWorkoutDays(planId);
  }

  Future<int> updateWorkoutDay(WorkoutDay day) {
    return databaseHelper.updateWorkoutDay(day);
  }

  Future<int> deleteWorkoutDay(int id) {
    return databaseHelper.deleteWorkoutDay(id);
  }

  // Workout Exercise operations
  Future<int> addWorkoutExercise(WorkoutExercise exercise) {
    return databaseHelper.insertWorkoutExercise(exercise);
  }

  Future<List<WorkoutExercise>> getWorkoutExercises(int dayId) {
    return databaseHelper.getWorkoutExercises(dayId);
  }

  Future<int> updateWorkoutExercise(WorkoutExercise exercise) {
    return databaseHelper.updateWorkoutExercise(exercise);
  }

  Future<int> deleteWorkoutExercise(int id) {
    return databaseHelper.deleteWorkoutExercise(id);
  }
}
