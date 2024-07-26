import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/favorite_exercise/favorite_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/single_favorite_exercise_view.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercise_container.dart';

class FavoriteExercisesViewBody extends StatelessWidget {
  const FavoriteExercisesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteExerciseCubit, FavoriteExerciseState>(
      builder: (context, state) {
        if (state is FavoriteExercisesSuccess) {
          if (state.exercises.isNotEmpty) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => pushScreen(context,
                        screen: SingleFavoriteExerciseView(
                            favoriteExerciseModel: state.exercises[index]),
                        withNavBar: true),
                    child: ExerciseContainer(
                      title: state.exercises[index].exerciseName,
                      bodyPart: state.exercises[index].bodyPart,
                      exerciseGifUrl: state.exercises[index].gifUrl,
                      targets: state.exercises[index].target,
                      secondaryMuscles: state.exercises[index].secondaryMuscles,
                    ),
                  );
                },
                itemCount: state.exercises.length);
          } else {
            return const Center(
              child: Text("No favorite exercises added yet"),
            );
          }
        } else if (state is FavoriteExercisesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text("Start Adding exercises to your favorites"),
          );
        }
      },
    );
  }
}
