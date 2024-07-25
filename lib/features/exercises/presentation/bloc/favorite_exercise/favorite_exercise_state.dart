part of 'favorite_exercise_cubit.dart';

sealed class FavoriteExerciseState extends Equatable {
  const FavoriteExerciseState();

  @override
  List<Object> get props => [];
}

final class FavoriteExerciseInitial extends FavoriteExerciseState {}

final class FavoriteExercisesLoading extends FavoriteExerciseState {}

final class FavoriteExercisesSuccess extends FavoriteExerciseState {
  final List<FavoriteExerciseModel> exercises;

  const FavoriteExercisesSuccess(this.exercises);
}

final class FavoriteExercisesError extends FavoriteExerciseState {
  final String errMessage;

  const FavoriteExercisesError(this.errMessage);
}
