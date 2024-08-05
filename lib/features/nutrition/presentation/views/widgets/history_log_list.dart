// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/utils/food_log_utils.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/history_log/history_log_cubit.dart';

class HistoryLogList extends StatelessWidget {
  const HistoryLogList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryLogCubit, HistoryLogState>(
      builder: (context, state) {
        if (state is HistoryLogSuccess) {
          if (state.historyLogs.isNotEmpty) {
            return ListView.builder(
                itemCount: state.historyLogs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.historyLogs[index].name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              state.historyLogs[index].description,
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
                                state.historyLogs[index].calories,
                                const Icon(
                                  CupertinoIcons.flame_fill,
                                  color: Colors.red,
                                  size: 16,
                                )),
                            FoodLogUtils.buildNutritionIcon(
                                state.historyLogs[index].protein,
                                SvgPicture.asset(
                                  'assets/images/protein.svg',
                                  color: Colors.orange,
                                )),
                            FoodLogUtils.buildNutritionIcon(
                                state.historyLogs[index].carbohydrates,
                                SvgPicture.asset(
                                  'assets/images/c_icon.svg',
                                  color: Colors.blue,
                                )),
                            FoodLogUtils.buildNutritionIcon(
                                state.historyLogs[index].fiber,
                                SvgPicture.asset(
                                  'assets/images/leaf_icon.svg',
                                  color: Colors.green,
                                )),
                            FoodLogUtils.buildNutritionIcon(
                                state.historyLogs[index].fat,
                                SvgPicture.asset(
                                  'assets/images/f_icon.svg',
                                  color: const Color(0xff33a3b2),
                                )),
                            FoodLogUtils.buildNutritionIcon(
                                state.historyLogs[index].iron,
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
                });
          } else {
            return Text(
              "There are no food logs for that date.",
              style: Theme.of(context).textTheme.bodySmall,
            );
          }
        } else if (state is HistoryLogError) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
