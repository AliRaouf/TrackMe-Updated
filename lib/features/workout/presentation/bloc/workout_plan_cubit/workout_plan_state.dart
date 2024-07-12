part of 'workout_plan_cubit.dart';

sealed class WorkoutPlanState extends Equatable {
  const WorkoutPlanState();

  @override
  List<Object> get props => [];
}

final class WorkoutPlanInitial extends WorkoutPlanState {}

final class WorkoutPlanLoading extends WorkoutPlanState {}

final class WorkoutPlanSuccess extends WorkoutPlanState {
  final List<WorkoutPlan> plans;

  const WorkoutPlanSuccess(this.plans);
}

final class WorkoutPlanError extends WorkoutPlanState {
  final String message;

  const WorkoutPlanError(this.message);
}
