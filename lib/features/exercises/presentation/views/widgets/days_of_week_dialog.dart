import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_exercise_model.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_exercise_cubit/workout_exercise_cubit.dart';

class DaysOfWeekDialog extends StatelessWidget {
  final List<WorkoutDay> workoutday;
  final ExerciseModel exerciseModel;
  const DaysOfWeekDialog(
      {super.key, required this.workoutday, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Select a Day to Add Exercise')),
      content: SingleChildScrollView(
        child: ListBody(
          children: workoutday.map((day) {
            return TextButton(
              onPressed: () {
                context.read<WorkoutExerciseCubit>().addWorkoutExercise(
                    WorkoutExercise(
                        gifUrl: exerciseModel.gifUrl ?? "",
                        dayId: day.id!,
                        exerciseName: exerciseModel.name ?? "",
                        bodyPart: exerciseModel.bodyPart ?? "",
                        target: exerciseModel.target ?? "",
                        secondaryMuscles:
                            exerciseModel.secondaryMuscles!.join(", "),
                        equipmentNeeded: exerciseModel.equipment ?? "",
                        instructions: exerciseModel.instructions ?? []));
                Navigator.of(context).pop();
              },
              child:
                  Text(day.name, style: Theme.of(context).textTheme.bodyMedium),
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          child: Text('Close', style: Theme.of(context).textTheme.titleMedium),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
