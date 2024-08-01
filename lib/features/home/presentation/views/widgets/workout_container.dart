import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_plan_cubit/workout_plan_cubit.dart';

class WorkoutContainer extends StatelessWidget {
  const WorkoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: Theme.of(context).brightness == Brightness.dark
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.04),
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Work out like a pro\nathlete",
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                BlocBuilder<WorkoutPlanCubit, WorkoutPlanState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        if (state is WorkoutPlanSuccess) {
                          if (state.plans.isEmpty) {
                            context.push('/workout');
                          } else {
                            context
                                .read<WorkoutDayCubit>()
                                .loadWorkoutDays(state.plans.first.id!);
                            context.push('/workout/workout_plan');
                          }
                        }
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey.shade200
                                  : const Color(0xff121212))),
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).brightness == Brightness.dark
                            ? TextStyles.body16Light
                            : TextStyles.body16Dark,
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SvgPicture.asset("assets/images/gymrack.svg",
                  width: MediaQuery.sizeOf(context).width * 0.35),
            )
          ],
        ),
      ),
    );
  }
}
