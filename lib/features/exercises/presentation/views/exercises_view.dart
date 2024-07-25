import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/get_exercise/get_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercises_view_body.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExerciseCubit, GetExerciseState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Exercises",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body: const ExercisesViewBody());
      },
    );
  }
}
