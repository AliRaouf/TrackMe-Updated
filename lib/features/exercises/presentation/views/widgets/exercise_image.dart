import 'package:flutter/material.dart';

class ExerciseImage extends StatelessWidget {
  const ExerciseImage({
    super.key,
    required this.exerciseGifUrl,
  });

  final String? exerciseGifUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.network(
            exerciseGifUrl ?? "",
          ),
        ));
  }
}
