import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/core/styles.dart';

class WorkoutTrackerViewBody extends StatelessWidget {
  const WorkoutTrackerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Please Select a Workout Structure",
              style: Theme.of(context).textTheme.titleMedium),
          Text("1- Weekly Schedule(Sunday to Saturday):",
              style: Theme.of(context).textTheme.titleSmall),
          Text("• Each day of the week has specific exercises.",
              style: Theme.of(context).textTheme.bodySmall),
          Text(
              "• Easy to incorporate rest days and different types of workouts (e.g., cardio, strength).",
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(
            height: 20.h,
          ),
          Text("2- Workout Split (e.g., Push/Pull/Leg):",
              style: Theme.of(context).textTheme.titleSmall),
          Text("• Focuses on different muscle groups on different days.",
              style: Theme.of(context).textTheme.bodySmall),
          Text("• Popular among strength trainers and bodybuilders.",
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push('/workout/weekly_schedule');
                },
                child: Text('Weekly Schedule', style: TextStyles.body16Dark),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push('/workout/workout_split');
                },
                child: Text('Workout Split', style: TextStyles.body16Dark),
              ),
            ],
          )
        ],
      ),
    );
  }
}
