part of 'target_nutrition_cubit.dart';

sealed class TargetNutritionState extends Equatable {
  const TargetNutritionState();

  @override
  List<Object> get props => [];
}

final class TargetNutritionInitial extends TargetNutritionState {}

final class TargetNutritionLoading extends TargetNutritionState {}

final class TargetNutritionSuccess extends TargetNutritionState {
  final List<TargetNutritionModel> targetNutrition;
  const TargetNutritionSuccess(this.targetNutrition);
}

final class TargetNutritionError extends TargetNutritionState {
  final String errMessage;

  const TargetNutritionError(this.errMessage);
}
