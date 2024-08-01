import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track_me_updated/constants.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/workout/presentation/bloc/workout_day_cubit/workout_day_cubit.dart';
import 'package:track_me_updated/features/workout/presentation/views/widgets/workout_plan_exercises.dart';

class WorkoutPlanView extends StatefulWidget {
  const WorkoutPlanView({super.key});

  @override
  State<WorkoutPlanView> createState() => _WorkoutPlanViewState();
}

class _WorkoutPlanViewState extends State<WorkoutPlanView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDayCubit, WorkoutDayState>(
      builder: (context, state) {
        if (state is WorkoutDaySuccess) {
          _tabController = TabController(
              length: state.days.length, vsync: this, initialIndex: 0);
          List<Tab> tabs = state.days
              .map((label) => Tab(
                    text: label.name,
                  ))
              .toList();
          return PopScope(
            onPopInvoked: (didPop) => context.push('/'),
            child: Theme(
              data: Theme.of(context).brightness == Brightness.dark
                  ? workoutTrackerDarkTheme
                  : workoutTrackerLightTheme,
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: Text(
                      "Workout Plan",
                      style: TextStyles.title22Dark,
                    ),
                    bottom: TabBar(
                      indicatorColor: kWorkoutTrackerLight,
                      labelColor: Theme.of(context).colorScheme.onPrimary,
                      controller: _tabController,
                      tabs: tabs,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      unselectedLabelColor: Colors.grey.shade400,
                    ),
                  ),
                  body: TabBarView(controller: _tabController, children: [
                    ...state.days
                        .map((title) => WorkoutPlanExercises(dayId: title.id!))
                  ])),
            ),
          );
        } else if (state is WorkoutDayError) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
