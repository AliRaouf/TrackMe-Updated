import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_image.dart';

class RecipeContainer extends StatelessWidget {
  const RecipeContainer(
      {super.key,
      this.title,
      this.readyIn,
      this.servings,
      this.rating,
      this.id,
      this.score});
  final String? title;
  final String? readyIn;
  final String? servings;
  final String? rating;
  final String? id;
  final double? score;
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
                        "Ready in: ${readyIn ?? ""} Minutes",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Servings: ${servings ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      score == null
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                Text(
                                  "Rating: ${(score! / 20).toStringAsFixed(1)}/5",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                      rating == null
                          ? const SizedBox.shrink()
                          : Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "$rating",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 8.w),
              child: RecipeImage(id: id),
            ),
          ],
        ),
      ),
    );
  }
}
