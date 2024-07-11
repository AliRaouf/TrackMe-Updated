import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercise_image.dart';

class SingleExerciseViewBody extends StatelessWidget {
  const SingleExerciseViewBody({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: 300.h,
              child: ExerciseImage(exerciseGifUrl: exerciseModel.gifUrl)),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "BodyPart: ${exerciseModel.bodyPart ?? ""}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.h),
            child: Text(
              "Targets: ${exerciseModel.target ?? ""}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            "Secondary Muscles: ${exerciseModel.secondaryMuscles!.join(", ")}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.h),
            child: Text(
              "Equipment Needed: ${exerciseModel.equipment}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            "Instructions:",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0.h),
                  child: Text(
                    "${index + 1}) ${exerciseModel.instructions?[index] ?? ""}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
              itemCount: exerciseModel.instructions?.length ?? 3,
            ),
          )
        ],
      ),
    );
  }
}
