import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/cubit/get_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercise_container.dart';

class ExercisesViewBody extends StatelessWidget {
  const ExercisesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExerciseCubit, GetExerciseState>(
      builder: (context, state) {
        if (state is GetExerciseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetExerciseError) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetExerciseSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => ExerciseContainer(
              title: state.exercises[index].name,
              bodyPart: state.exercises[index].bodyPart,
              exerciseGifUrl: state.exercises[index].gifUrl,
              secondaryMuscles:
                  state.exercises[index].secondaryMuscles!.join(", "),
              targets: state.exercises[index].target,
            ),
            itemCount: state.exercises.length,
            physics: const BouncingScrollPhysics(),
          );
        } else {
          return const Center(
            child: Text("Search For an Exercise First!"),
          );
        }
      },
    );
  }
}
