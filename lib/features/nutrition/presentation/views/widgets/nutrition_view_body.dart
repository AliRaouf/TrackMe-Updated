import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/food_log_list.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/nutrition_container_grid.dart';

class NutritionViewBody extends StatelessWidget {
  const NutritionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            const NutritionContainerGrid(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text("Food", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const FoodLogList()
          ],
        ),
      ),
    );
  }
}
