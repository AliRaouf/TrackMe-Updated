import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
        title: Text(exerciseModel.name ?? "",
            style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
      ),
      body: SingleExerciseViewBody(exerciseModel: exerciseModel),
    );
  }
}
