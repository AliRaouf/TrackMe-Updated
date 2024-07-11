import 'package:flutter/material.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/workout/presentation/views/widgets/workout_tracker_view_body.dart';

class WorkoutTrackerView extends StatelessWidget {
  const WorkoutTrackerView({super.key});

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
          title: Text(
            'Workout Tracker',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: const WorkoutTrackerViewBody(),
      ),
    );
  }
}
