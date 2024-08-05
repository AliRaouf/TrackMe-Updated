// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/utils/food_log_utils.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/food_log/food_log_cubit.dart';

class FoodLogList extends StatelessWidget {
  const FoodLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodLogCubit, FoodLogState>(
      builder: (context, state) {
        if (state is FoodLogSuccess) {
          if (state.foodLogs.isNotEmpty) {
            return Expanded(
                child: ListView.builder(
                    itemCount: state.foodLogs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.foodLogs[index].name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>
                                      FoodLogUtils.showDeleteDialog(
                                          context, state.foodLogs[index]),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  state.foodLogs[index].description,
                                  style: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? TextStyles.body12Dark
                                      : TextStyles.body12Light,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].calories,
                                    const Icon(
                                      CupertinoIcons.flame_fill,
                                      color: Colors.red,
                                      size: 16,
                                    )),
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].protein,
                                    SvgPicture.asset(
                                      'assets/images/protein.svg',
                                      color: Colors.orange,
                                    )),
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].carbohydrates,
                                    SvgPicture.asset(
                                      'assets/images/c_icon.svg',
                                      color: Colors.blue,
                                    )),
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].fiber,
                                    SvgPicture.asset(
                                      'assets/images/leaf_icon.svg',
                                      color: Colors.green,
                                    )),
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].fat,
                                    SvgPicture.asset(
                                      'assets/images/f_icon.svg',
                                      color: const Color(0xff33a3b2),
                                    )),
                                FoodLogUtils.buildNutritionIcon(
                                    state.foodLogs[index].iron,
                                    const Icon(
                                      Icons.fitness_center,
                                      color: Color(0xff7da1c3),
                                      size: 16,
                                    )),
                              ],
                            )
                          ],
                        ),
                      );
                    }));
          } else {
            return Text(
              "You Havent Added any Food Logs Yet!",
              style: Theme.of(context).textTheme.bodySmall,
            );
          }
        } else if (state is FoodLogError) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
