import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/exercises/data/models/favorite_exercise_model.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/exercise_image.dart';

class SingleFavoriteExerciseViewBody extends StatelessWidget {
  const SingleFavoriteExerciseViewBody(
      {super.key, required this.favoriteExerciseModel});
  final FavoriteExerciseModel favoriteExerciseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: 300.h,
              child:
                  ExerciseImage(exerciseGifUrl: favoriteExerciseModel.gifUrl)),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "BodyPart: ${favoriteExerciseModel.bodyPart}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.h),
            child: Text(
              "Targets: ${favoriteExerciseModel.target}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            "Secondary Muscles: ${favoriteExerciseModel.secondaryMuscles}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.h),
            child: Text(
              "Equipment Needed: ${favoriteExerciseModel.equipmentNeeded}",
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
                    "${index + 1}) ${favoriteExerciseModel.instructions}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
              itemCount: favoriteExerciseModel.instructions.length,
            ),
          )
        ],
      ),
    );
  }
}
