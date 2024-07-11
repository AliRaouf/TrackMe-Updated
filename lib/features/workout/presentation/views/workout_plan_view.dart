import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout/workout_cubit.dart';

class WorkoutPlanView extends StatelessWidget {
  const WorkoutPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Plan"),
      ),
      body: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutDaySuccess) {
            return ListView.builder(
              itemCount: state.days.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.days[index].name),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
