part of 'food_log_cubit.dart';

sealed class FoodLogState extends Equatable {
  const FoodLogState();

  @override
  List<Object> get props => [];
}

final class FoodLogInitial extends FoodLogState {}

final class FoodLogLoading extends FoodLogState {}

final class FoodLogSuccess extends FoodLogState {
  final List<FoodLogModel> foodLogs;
  const FoodLogSuccess(this.foodLogs);
}

final class FoodLogError extends FoodLogState {
  final String errMessage;
  const FoodLogError(this.errMessage);
}
