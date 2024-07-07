part of 'meal_planner_cubit.dart';

sealed class MealPlannerState extends Equatable {
  const MealPlannerState();

  @override
  List<Object> get props => [];
}

final class MealPlannerInitial extends MealPlannerState {}

final class MealPlannerLoading extends MealPlannerState {}

final class MealPlannerError extends MealPlannerState {
  final String errMessage;
  const MealPlannerError(this.errMessage);
}

final class MealPlannerSuccess extends MealPlannerState {
  final MealPlannerModel meals;
  const MealPlannerSuccess(this.meals);
}
