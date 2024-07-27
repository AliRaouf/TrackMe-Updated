part of 'food_log_cubit.dart';

sealed class FoodLogState extends Equatable {
  const FoodLogState();

  @override
  List<Object> get props => [];
}

final class FoodLogInitial extends FoodLogState {}
