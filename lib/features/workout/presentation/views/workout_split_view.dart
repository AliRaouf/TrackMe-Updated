import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/workout/data/models/workout_day_model.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_plan_cubit/workout_plan_cubit.dart';

class WorkoutSplitView extends StatefulWidget {
  const WorkoutSplitView({super.key});

  @override
  State<WorkoutSplitView> createState() => _WorkoutSplitViewState();
}

class _WorkoutSplitViewState extends State<WorkoutSplitView> {
  final List<String> days = [
    '1 day',
    '2 days',
    '3 days',
    '4 days',
    '5 days',
    '6 days',
    '7 days',
  ];
  String selectedDay = '1 day';

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
          title: Text('How many days do you workout?',
              style: TextStyles.title22Dark),
        ),
        body: Column(
          children: days.map((day) {
            return RadioListTile<String>(
              title: Text(day, style: Theme.of(context).textTheme.bodyMedium),
              value: day,
              groupValue: selectedDay,
              onChanged: (value) {
                setState(() {
                  selectedDay = value!;
                });
              },
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () async {
            final int selectedDays = int.parse(selectedDay.split(' ')[0]);
            final renamedDays = await _renameDays(context, selectedDays);
            if (renamedDays != null) {
              context.read<WorkoutPlanCubit>().addWorkoutPlan(
                  WorkoutPlan(name: "WorkoutSplit", type: "Workout"));

              for (String day in renamedDays) {
                context.read<WorkoutDayCubit>().addWorkoutDay(WorkoutDay(
                      planId: 1,
                      name: day,
                    ));
              }
              context.push('/workout/workout_plan');
            }
          },
        ),
      ),
    );
  }

  Future<List<String>?> _renameDays(
      BuildContext context, int selectedDays) async {
    List<String> renamedDays = [];

    for (int i = 0; i < selectedDays; i++) {
      String? newName = await showDialog<String>(
        context: context,
        builder: (context) {
          TextEditingController controller = TextEditingController();

          return AlertDialog(
            title: Text('Add name for day ${i + 1}'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Push/Pull/Leg/Upper/Lower',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );

      if (newName == null) {
        return null;
      }
      renamedDays.add(newName);
    }

    return renamedDays;
  }
}
