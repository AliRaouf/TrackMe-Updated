import 'package:flutter/material.dart';

class WorkoutSplitView extends StatelessWidget {
  const WorkoutSplitView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> splits = [
      'Push/Pull/Leg',
      'Upper/Lower',
      'Full Body'
    ]; // Example splits
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Workout Split'),
      ),
      body: ListView.builder(
        itemCount: splits.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(splits[index]),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           AddExercisesSplitScreen(split: splits[index])),
              // );
            },
          );
        },
      ),
    );
  }
}
