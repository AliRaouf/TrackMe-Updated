import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';
import 'package:track_me_updated/features/exercises/data/repo/favorite_exercise_repo.dart';

part 'favorite_exercise_state.dart';

class FavoriteExerciseCubit extends Cubit<FavoriteExerciseState> {
  final FavoriteExerciseRepo repository;
  FavoriteExerciseCubit(this.repository) : super(FavoriteExerciseInitial());
  Future<void> loadFavoriteExercise() async {
    emit(FavoriteExercisesLoading());
    try {
      final exercise = await repository.getFavoriteExercises();
      emit(FavoriteExercisesSuccess(exercise));
    } catch (e) {
      emit(const FavoriteExercisesError("Failed to load workout plans"));
    }
  }

  Future<void> addFavoriteExercise(FavoriteExerciseModel exercise) async {
    emit(FavoriteExercisesLoading());
    try {
      await repository.addFavoriteExercise(exercise);
      final exercises = await repository.getFavoriteExercises();
      emit(FavoriteExercisesSuccess(exercises));
    } catch (e) {
      emit(const FavoriteExercisesError("Failed to add FavoriteExercise"));
    }
  }

  Future<void> deleteFavoriteExercise(int id) async {
    emit(FavoriteExercisesLoading());
    try {
      await repository.deleteFavoriteExercise(id);
      final exercises = await repository.getFavoriteExercises();
      emit(FavoriteExercisesSuccess(exercises));
    } catch (e) {
      emit(const FavoriteExercisesError("Failed to delete Exercise"));
    }
  }
}
