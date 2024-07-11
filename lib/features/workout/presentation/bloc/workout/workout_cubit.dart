import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_exercise_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';
import 'package:track_me_updated/features/workout/data/repo/workout_repository.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutRepository repository;

  WorkoutCubit({required this.repository}) : super(WorkoutInitial());

  Future<void> loadWorkoutPlans() async {
    emit(WorkoutPlanLoading());
    try {
      final plans = await repository.getWorkoutPlans();
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      emit(const WorkoutPlanError("Failed to load workout plans"));
    }
  }

  Future<void> loadWorkoutDays(int planid) async {
    emit(WorkoutDayLoading());
    try {
      final days = await repository.getWorkoutDays(planid);
      emit(WorkoutDaySuccess(days));
    } catch (e) {
      emit(const WorkoutDayError("Failed to load workout plans"));
    }
  }

  Future<void> loadWorkoutExercises(int dayID) async {
    emit(WorkoutExerciseLoading());
    try {
      final exercises = await repository.getWorkoutExercises(dayID);
      emit(WorkoutExerciseSuccess(exercises));
    } catch (e) {
      emit(const WorkoutExerciseError("Failed to load workout plans"));
    }
  }

  Future<void> addWorkoutPlan(WorkoutPlan plan) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.addWorkoutPlan(plan);
      final plans = await repository.getWorkoutPlans();
      print("Success");
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      print("fail");
      emit(const WorkoutPlanError("Failed to add workout plan"));
    }
  }

  Future<void> updateWorkoutPlan(WorkoutPlan plan) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.updateWorkoutPlan(plan);
      final plans = await repository.getWorkoutPlans();
      print("Success");
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      print("fail");
      emit(const WorkoutPlanError("Failed to update workout plan"));
    }
  }

  Future<void> deleteWorkoutPlan(int id) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.deleteWorkoutPlan(id);
      final plans = await repository.getWorkoutPlans();
      print("Success");
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      print("fail");
      emit(const WorkoutPlanError("Failed to delete workout plan"));
    }
  }

  // Add methods for workout_days and workout_exercises as needed
  Future<void> addWorkoutDay(WorkoutDay day) async {
    emit(WorkoutDayLoading());
    try {
      await repository.addWorkoutDay(day);
      final days = await repository.getWorkoutDays(day.planId);
      emit(WorkoutDaySuccess(days));
    } catch (e) {
      emit(const WorkoutDayError("Failed to add workout day"));
    }
  }

  Future<void> updateWorkoutDay(WorkoutDay day) async {
    emit(WorkoutDayLoading());
    try {
      await repository.updateWorkoutDay(day);
      final days = await repository.getWorkoutDays(day.planId);
      emit(WorkoutDaySuccess(days));
    } catch (e) {
      emit(const WorkoutDayError("Failed to update workout day"));
    }
  }

  Future<void> deleteWorkoutDay(int id) async {
    emit(WorkoutDayLoading());
    try {
      await repository.deleteWorkoutDay(id);
      final days = await repository.getWorkoutDays(id);
      emit(WorkoutDaySuccess(days));
    } catch (e) {
      emit(const WorkoutDayError("Failed to delete workout day"));
    }
  }

  Future<void> addWorkoutExercise(WorkoutExercise exercise) async {
    emit(WorkoutExerciseLoading());
    try {
      await repository.addWorkoutExercise(exercise);
      final exercises = await repository.getWorkoutExercises(exercise.dayId);
      emit(WorkoutExerciseSuccess(exercises));
    } catch (e) {
      emit(const WorkoutExerciseError("Failed to add workout exercise"));
    }
  }

  Future<void> updateWorkoutExercise(WorkoutExercise exercise) async {
    emit(WorkoutExerciseLoading());
    try {
      await repository.updateWorkoutExercise(exercise);
      final exercises = await repository.getWorkoutExercises(exercise.dayId);
      emit(WorkoutExerciseSuccess(exercises));
    } catch (e) {
      emit(const WorkoutExerciseError("Failed to update workout exercise"));
    }
  }

  Future<void> deleteWorkoutExercise(int id) async {
    emit(WorkoutExerciseLoading());
    try {
      await repository.deleteWorkoutExercise(id);
      final exercises = await repository.getWorkoutExercises(id);
      emit(WorkoutExerciseSuccess(exercises));
    } catch (e) {
      emit(const WorkoutExerciseError("Failed to delete workout exercise"));
    }
  }
}
