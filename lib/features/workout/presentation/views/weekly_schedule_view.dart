import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_plan_cubit/workout_plan_cubit.dart';

class WeeklyScheduleView extends StatefulWidget {
  const WeeklyScheduleView({super.key});

  @override
  State<WeeklyScheduleView> createState() => _WeeklyScheduleViewState();
}

class _WeeklyScheduleViewState extends State<WeeklyScheduleView> {
  Map<String, bool> days = {
    'Sunday': false,
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
  };
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? workoutTrackerDarkTheme
          : workoutTrackerLightTheme,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Choose Workout Days', style: TextStyles.title22Dark),
        ),
        body: Column(
          children: days.keys.map((day) {
            return CheckboxListTile(
              selectedTileColor: Colors.white,
              title: Text(day, style: Theme.of(context).textTheme.bodyMedium),
              value: days[day],
              onChanged: (value) {
                days[day] = value!;
                setState(() {});
              },
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            final selectedDays = days.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList();
            context.read<WorkoutPlanCubit>().addWorkoutPlan(WorkoutPlan(
                  name: "WeeklySchedule",
                  type: "WeeklySchedule",
                ));
            for (String day in selectedDays) {
              context.read<WorkoutDayCubit>().addWorkoutDay(WorkoutDay(
                    name: day,
                    planId: 1,
                  ));
            }
            context.push('/workout/workout_plan');
          },
        ),
      ),
    );
  }
}
