part of 'workout_exercise_cubit.dart';

sealed class WorkoutExerciseState extends Equatable {
  const WorkoutExerciseState();

  @override
  List<Object> get props => [];
}

final class WorkoutExerciseInitial extends WorkoutExerciseState {}

final class WorkoutExerciseLoading extends WorkoutExerciseState {}

final class WorkoutExerciseSuccess extends WorkoutExerciseState {
  final List<WorkoutExercise> exercises;

  const WorkoutExerciseSuccess(this.exercises);
}

final class WorkoutExerciseError extends WorkoutExerciseState {
  final String message;

  const WorkoutExerciseError(this.message);
}
