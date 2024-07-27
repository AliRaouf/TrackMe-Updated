import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:track_me_updated/core/utils/nutrition_utils.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/target_nutrition/target_nutrition_cubit.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/nutrition_container.dart';

class NutritionContainerGrid extends StatelessWidget {
  const NutritionContainerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TargetNutritionCubit, TargetNutritionState>(
      builder: (context, state) {
        if (state is TargetNutritionSuccess) {
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
                        0, state.targetNutrition[0].calories!),
                    color: Colors.red,
                    percent: NutritionUtils.remainingPercentage(
                        0, state.targetNutrition[0].calories!),
                    nutritionController: TextEditingController(),
                  ),
                  NutritionContainer(
                    widget: SvgPicture.asset("assets/images/protein.svg"),
                    text: "Protein",
                    remaining: NutritionUtils.remainingString(
                        0, state.targetNutrition[0].protein!),
                    color: Colors.orange,
                    percent: NutritionUtils.remainingPercentage(
                        0, state.targetNutrition[0].protein!),
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
                      widget: SvgPicture.asset("assets/images/c_icon.svg"),
                      text: "Carbohydrates",
                      remaining: NutritionUtils.remainingString(
                          0, state.targetNutrition[0].carbohydrates!),
                      color: Colors.blueAccent,
                      percent: NutritionUtils.remainingPercentage(
                          0, state.targetNutrition[0].carbohydrates!),
                      nutritionController: TextEditingController(),
                    ),
                    NutritionContainer(
                      widget: SvgPicture.asset("assets/images/leaf_icon.svg"),
                      text: "Fiber",
                      remaining: NutritionUtils.remainingString(
                          0, state.targetNutrition[0].fiber!),
                      color: Colors.green,
                      percent: NutritionUtils.remainingPercentage(
                          0, state.targetNutrition[0].fiber!),
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
                        0, state.targetNutrition[0].fat!),
                    color: const Color(0xff33a3b2),
                    percent: NutritionUtils.remainingPercentage(
                        0, state.targetNutrition[0].fat!),
                    nutritionController: TextEditingController(),
                  ),
                  NutritionContainer(
                    widget: const Icon(Icons.fitness_center),
                    text: "Iron",
                    remaining: NutritionUtils.remainingString(
                        0, state.targetNutrition[0].iron!),
                    color: const Color(0xff7da1c3),
                    percent: NutritionUtils.remainingPercentage(
                        0, state.targetNutrition[0].iron!),
                    nutritionController: TextEditingController(),
                  ),
                ],
              ),
            ],
          );
        } else if (state is TargetNutritionError) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
