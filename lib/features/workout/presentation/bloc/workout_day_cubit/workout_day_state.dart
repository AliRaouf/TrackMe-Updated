part of 'workout_day_cubit.dart';

sealed class WorkoutDayState extends Equatable {
  const WorkoutDayState();

  @override
  List<Object> get props => [];
}

final class WorkoutDayInitial extends WorkoutDayState {}

class WorkoutDayLoading extends WorkoutDayState {}

class WorkoutDaySuccess extends WorkoutDayState {
  final List<WorkoutDay> days;

  const WorkoutDaySuccess(this.days);
}

class WorkoutDayError extends WorkoutDayState {
  final String message;

  const WorkoutDayError(this.message);
}
