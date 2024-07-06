import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/recipes/data/models/recipe_model/recipe_model.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({
    super.key,
    required this.recipes,
  });
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
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
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipes[index].title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "Ready in: ${recipes[index].readyInMinutes ?? ""} Minutes",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "Servings: ${recipes[index].servings ?? ""}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                "Rating: ${(recipes[index].spoonacularScore! / 20).toStringAsFixed(1)}/5",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "${recipes[index].aggregateLikes}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 8.w),
                  child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(recipes[index].image ?? ""),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
