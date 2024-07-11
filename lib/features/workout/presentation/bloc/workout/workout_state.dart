part of 'workout_cubit.dart';

sealed class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

final class WorkoutInitial extends WorkoutState {}

class WorkoutPlanLoading extends WorkoutState {}

class WorkoutPlanSuccess extends WorkoutState {
  final List<WorkoutPlan> plans;

  const WorkoutPlanSuccess(this.plans);
}

class WorkoutPlanError extends WorkoutState {
  final String message;

  const WorkoutPlanError(this.message);
}

class WorkoutDayLoading extends WorkoutState {}

class WorkoutDaySuccess extends WorkoutState {
  final List<WorkoutDay> days;

  const WorkoutDaySuccess(this.days);
}

class WorkoutDayError extends WorkoutState {
  final String message;

  const WorkoutDayError(this.message);
}

class WorkoutExerciseLoading extends WorkoutState {}

class WorkoutExerciseSuccess extends WorkoutState {
  final List<WorkoutExercise> exercises;

  const WorkoutExerciseSuccess(this.exercises);
}

class WorkoutExerciseError extends WorkoutState {
  final String message;

  const WorkoutExerciseError(this.message);
}
