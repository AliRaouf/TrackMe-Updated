import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/workout/data/models/workout_exercise_model.dart';
import 'package:track_me_updated/features/workout/data/repo/workout_repository.dart';

part 'workout_exercise_state.dart';

class WorkoutExerciseCubit extends Cubit<WorkoutExerciseState> {
  final WorkoutRepository repository;

  WorkoutExerciseCubit({required this.repository})
      : super(WorkoutExerciseInitial());
  Future<void> loadWorkoutExercises(int dayID) async {
    emit(WorkoutExerciseLoading());
    try {
      final exercises = await repository.getWorkoutExercises(dayID);
      emit(WorkoutExerciseSuccess(exercises));
    } catch (e) {
      emit(const WorkoutExerciseError("Failed to load workout plans"));
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
