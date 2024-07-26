import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/favorite_exercise/favorite_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/days_of_week_dialog.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/single_favorite_exercise_view_body.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';

class SingleFavoriteExerciseView extends StatelessWidget {
  const SingleFavoriteExerciseView(
      {super.key, required this.favoriteExerciseModel});
  final FavoriteExerciseModel favoriteExerciseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: BlocBuilder<WorkoutDayCubit, WorkoutDayState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (state is WorkoutDaySuccess) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DaysOfWeekDialog(
                          workoutday: state.days,
                          exerciseModel: ExerciseModel(
                              bodyPart: favoriteExerciseModel.bodyPart,
                              equipment: favoriteExerciseModel.equipmentNeeded,
                              gifUrl: favoriteExerciseModel.gifUrl,
                              id: favoriteExerciseModel.id.toString(),
                              name: favoriteExerciseModel.exerciseName,
                              target: favoriteExerciseModel.target,
                              secondaryMuscles: favoriteExerciseModel
                                  .secondaryMuscles
                                  .split(', '),
                              instructions:
                                  favoriteExerciseModel.instructions));
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      content: Center(
                          child: Text(
                        "Create a Workout Plan First",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                    ),
                  );
                }
              },
              child: Text(
                "Add to Workout Plan",
                style: TextStyles.title22Dark,
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoriteExerciseCubit, FavoriteExerciseState>(
            builder: (context, state) {
              if (state is FavoriteExercisesSuccess) {
                bool isInFavorites = state.exercises.any((exercise) =>
                    exercise.exerciseName ==
                    favoriteExerciseModel.exerciseName);
                return IconButton(
                  onPressed: () {
                    if (isInFavorites) {
                      final exercise = state.exercises.firstWhere((exercise) =>
                          exercise.exerciseName ==
                          favoriteExerciseModel.exerciseName);
                      context
                          .read<FavoriteExerciseCubit>()
                          .deleteFavoriteExercise(exercise.id!);
                    } else {
                      context
                          .read<FavoriteExerciseCubit>()
                          .addFavoriteExercise(favoriteExerciseModel);
                    }
                  },
                  icon: Icon(
                      isInFavorites ? Icons.favorite : Icons.favorite_outline),
                  color: isInFavorites ? Colors.red : Colors.white,
                );
              } else if (state is FavoriteExercisesError) {
                return const Icon(Icons.error);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
        title: Text(favoriteExerciseModel.exerciseName,
            style: TextStyles.title22Dark),
        centerTitle: true,
      ),
      body: SingleFavoriteExerciseViewBody(
          favoriteExerciseModel: favoriteExerciseModel),
    );
  }
}
