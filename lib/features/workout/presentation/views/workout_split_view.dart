import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  Map<String, bool> days = {
    '1 day': false,
    '2 days': false,
    '3 days': false,
    '4 days': false,
    '5 days': false,
    '6 days': false,
    '7 days': false,
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
          title: Text('How many days do you workout?',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body: Column(
          children: days.keys.map((day) {
            return CheckboxListTile(
              selectedTileColor: Colors.white,
              title: Text(day, style: Theme.of(context).textTheme.bodyMedium),
              value: days[day],
              onChanged: (value) {
                setState(() {
                  days[day] = value!;
                });
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

            if (selectedDays.isNotEmpty) {
              final renamedDays = await _renameDays(context, selectedDays);
              if (renamedDays != null) {
                print(renamedDays);
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
            }
          },
        ),
      ),
    );
  }

  Future<List<String>?> _renameDays(
      BuildContext context, List<String> selectedDays) async {
    List<String> renamedDays = List.from(selectedDays);

    for (int i = 0; i < selectedDays.length; i++) {
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
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );

      if (newName == null) {
        return null;
      }
      renamedDays[i] = newName;
    }

    return renamedDays;
  }
}
