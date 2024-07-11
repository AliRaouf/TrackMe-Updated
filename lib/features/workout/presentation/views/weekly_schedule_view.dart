import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout/workout_cubit.dart';

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
    return BlocListener<WorkoutCubit, WorkoutState>(
      listener: (context, state) {},
      child: Theme(
        data: Theme.of(context).brightness == Brightness.dark
            ? workoutTrackerDarkTheme
            : workoutTrackerLightTheme,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Choose Workout Days',
                style: Theme.of(context).textTheme.titleMedium),
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
            onPressed: () async {
              final selectedDays = days.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              context.read<WorkoutCubit>().addWorkoutPlan(WorkoutPlan(
                    name: "WeeklSchedule",
                    type: "WeeklySchedule",
                  ));
              for (String day in selectedDays) {
                await context.read<WorkoutCubit>().addWorkoutDay(WorkoutDay(
                      name: day,
                      planId: 1,
                    ));
              }
              context.push('/workout/weekly_schedule');
            },
          ),
        ),
      ),
    );
  }
}
