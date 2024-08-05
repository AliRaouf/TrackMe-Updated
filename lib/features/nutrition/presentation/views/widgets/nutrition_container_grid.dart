import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:track_me_updated/core/utils/food_log_utils.dart';
import 'package:track_me_updated/core/utils/nutrition_utils.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/food_log/food_log_cubit.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/target_nutrition/target_nutrition_cubit.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/nutrition_container.dart';

class NutritionContainerGrid extends StatelessWidget {
  const NutritionContainerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TargetNutritionCubit, TargetNutritionState>(
      builder: (context, nutritionState) {
        if (nutritionState is TargetNutritionSuccess) {
          return BlocBuilder<FoodLogCubit, FoodLogState>(
            builder: (context, logState) {
              if (logState is FoodLogSuccess) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NutritionContainer(
                          widget: const Icon(
                            CupertinoIcons.flame_fill,
                            color: Colors.white,
                          ),
                          text: 'Calories',
                          remaining: NutritionUtils.remainingString(
                              FoodLogUtils.sumCalories(logState.foodLogs),
                              nutritionState.targetNutrition[0].calories!),
                          color: Colors.red,
                          percent: NutritionUtils.remainingPercentage(
                              FoodLogUtils.sumCalories(logState.foodLogs),
                              nutritionState.targetNutrition[0].calories!),
                          nutritionController: TextEditingController(),
                        ),
                        NutritionContainer(
                          widget: SvgPicture.asset("assets/images/protein.svg"),
                          text: "Protein",
                          remaining: NutritionUtils.remainingString(
                              FoodLogUtils.sumProtein(logState.foodLogs),
                              nutritionState.targetNutrition[0].protein!),
                          color: Colors.orange,
                          percent: NutritionUtils.remainingPercentage(
                              FoodLogUtils.sumProtein(logState.foodLogs),
                              nutritionState.targetNutrition[0].protein!),
                          nutritionController: TextEditingController(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NutritionContainer(
                            widget:
                                SvgPicture.asset("assets/images/c_icon.svg"),
                            text: "Carbohydrates",
                            remaining: NutritionUtils.remainingString(
                                FoodLogUtils.sumCarbs(logState.foodLogs),
                                nutritionState
                                    .targetNutrition[0].carbohydrates!),
                            color: Colors.blueAccent,
                            percent: NutritionUtils.remainingPercentage(
                                FoodLogUtils.sumCarbs(logState.foodLogs),
                                nutritionState
                                    .targetNutrition[0].carbohydrates!),
                            nutritionController: TextEditingController(),
                          ),
                          NutritionContainer(
                            widget:
                                SvgPicture.asset("assets/images/leaf_icon.svg"),
                            text: "Fiber",
                            remaining: NutritionUtils.remainingString(
                                FoodLogUtils.sumFiber(logState.foodLogs),
                                nutritionState.targetNutrition[0].fiber!),
                            color: Colors.green,
                            percent: NutritionUtils.remainingPercentage(
                                FoodLogUtils.sumFiber(logState.foodLogs),
                                nutritionState.targetNutrition[0].fiber!),
                            nutritionController: TextEditingController(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NutritionContainer(
                          widget: SvgPicture.asset("assets/images/f_icon.svg"),
                          text: "Fat",
                          remaining: NutritionUtils.remainingString(
                              FoodLogUtils.sumFat(logState.foodLogs),
                              nutritionState.targetNutrition[0].fat!),
                          color: const Color(0xff33a3b2),
                          percent: NutritionUtils.remainingPercentage(
                              FoodLogUtils.sumFat(logState.foodLogs),
                              nutritionState.targetNutrition[0].fat!),
                          nutritionController: TextEditingController(),
                        ),
                        NutritionContainer(
                          widget: const Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          text: "Iron",
                          remaining: NutritionUtils.remainingString(
                              FoodLogUtils.sumIron(logState.foodLogs),
                              nutritionState.targetNutrition[0].iron!),
                          color: const Color(0xff7da1c3),
                          percent: NutritionUtils.remainingPercentage(
                              FoodLogUtils.sumIron(logState.foodLogs),
                              nutritionState.targetNutrition[0].iron!),
                          nutritionController: TextEditingController(),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (logState is FoodLogError) {
                return Center(
                  child: Text(logState.errMessage),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        } else if (nutritionState is TargetNutritionError) {
          return Center(
            child: Text(nutritionState.errMessage),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
