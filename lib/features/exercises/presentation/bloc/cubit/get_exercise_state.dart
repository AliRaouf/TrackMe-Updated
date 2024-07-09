part of 'get_exercise_cubit.dart';

sealed class GetExerciseState extends Equatable {
  const GetExerciseState();

  @override
  List<Object> get props => [];
}

final class GetExerciseInitial extends GetExerciseState {}

final class GetExerciseLoading extends GetExerciseState {}

final class GetExerciseSuccess extends GetExerciseState {
  final List<ExerciseModel> exercises;
  const GetExerciseSuccess(this.exercises);
}

final class GetExerciseError extends GetExerciseState {
  final String errMessage;
  const GetExerciseError(this.errMessage);
}
