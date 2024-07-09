import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseContainer extends StatelessWidget {
  const ExerciseContainer({
    super.key,
    this.title,
    this.bodyPart,
    this.targets,
    this.secondaryMuscles,
    this.exerciseGifUrl,
  });
  final String? title;
  final String? bodyPart;
  final String? targets;
  final String? secondaryMuscles;
  final String? exerciseGifUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
        ),
        width: 1.sw,
        height: 150.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 0.5.sw,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "BodyPart: ${bodyPart ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Targets: ${targets ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Secondary Muscles: ${secondaryMuscles ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      exerciseGifUrl ?? "",
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
