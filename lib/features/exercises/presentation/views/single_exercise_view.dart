import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/favorite_exercise/favorite_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/days_of_week_dialog.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/single_exercise_view_body.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';

class SingleExerciseView extends StatelessWidget {
  const SingleExerciseView({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;
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
                          workoutday: state.days, exerciseModel: exerciseModel);
                    },
                  );
                }
              },
              child: Text(
                "Add to Workout Plan",
                style: Theme.of(context).textTheme.titleMedium,
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
                bool isInFavorites = state.exercises.any(
                    (exercise) => exercise.exerciseName == exerciseModel.name);
                return IconButton(
                  onPressed: () {
                    if (isInFavorites) {
                      final exercise = state.exercises.firstWhere((exercise) =>
                          exercise.exerciseName == exerciseModel.name);
                      context
                          .read<FavoriteExerciseCubit>()
                          .deleteFavoriteExercise(exercise.id!);
                    } else {
                      context.read<FavoriteExerciseCubit>().addFavoriteExercise(
                          FavoriteExerciseModel(
                              day:
                                  DateFormat('d/M/yyyy').format(DateTime.now()),
                              exerciseName: exerciseModel.name!,
                              bodyPart: exerciseModel.bodyPart!,
                              target: exerciseModel.target!,
                              secondaryMuscles:
                                  exerciseModel.secondaryMuscles!.join(', '),
                              equipmentNeeded: exerciseModel.equipment!,
                              gifUrl: exerciseModel.gifUrl!,
                              instructions: exerciseModel.instructions!));
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
        title: Text(exerciseModel.name ?? "",
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: SingleExerciseViewBody(exerciseModel: exerciseModel),
    );
  }
}
