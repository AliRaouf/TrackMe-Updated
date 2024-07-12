import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/repo/workout_repository.dart';

part 'workout_day_state.dart';

class WorkoutDayCubit extends Cubit<WorkoutDayState> {
  final WorkoutRepository repository;
  WorkoutDayCubit({required this.repository}) : super(WorkoutDayInitial());
  Future<void> loadWorkoutDays(int planid) async {
    emit(WorkoutDayLoading());
    try {
      final days = await repository.getWorkoutDays(planid);
      emit(WorkoutDaySuccess(days));
    } catch (e) {
      emit(const WorkoutDayError("Failed to load workout plans"));
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
}
