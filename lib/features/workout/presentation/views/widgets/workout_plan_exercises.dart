import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercise_container.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_exercise_cubit/workout_exercise_cubit.dart';

class WorkoutPlanExercises extends StatefulWidget {
  final int dayId;
  const WorkoutPlanExercises({super.key, required this.dayId});

  @override
  State<WorkoutPlanExercises> createState() => _WorkoutPlanExercisesState();
}

class _WorkoutPlanExercisesState extends State<WorkoutPlanExercises> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutExerciseCubit>().loadWorkoutExercises(widget.dayId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseCubit, WorkoutExerciseState>(
      builder: (context, state) {
        if (state is WorkoutExerciseSuccess) {
          if (state.exercises.isEmpty) {
            return Center(
              child: Text(
                "Start Adding Exercises to your workout",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ExerciseContainer(
                  bodyPart: state.exercises[index].bodyPart,
                  exerciseGifUrl: state.exercises[index].gifUrl,
                  title: state.exercises[index].exerciseName,
                  targets: state.exercises[index].target,
                  secondaryMuscles: state.exercises[index].secondaryMuscles,
                );
              },
              itemCount: state.exercises.length,
            );
          }
        } else if (state is WorkoutExerciseError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
