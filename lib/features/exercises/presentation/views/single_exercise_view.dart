import 'package:flutter/material.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/single_exercise_view_body.dart';

class SingleExerciseView extends StatelessWidget {
  const SingleExerciseView({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
        ],
        title: Text(exerciseModel.name ?? ""),
        centerTitle: true,
      ),
      body: SingleExerciseViewBody(exerciseModel: exerciseModel),
    );
  }
}
