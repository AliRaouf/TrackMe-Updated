import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/features/exercises/presentation/bloc/get_exercise/get_exercise_cubit.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/bodypart_dropdown.dart';
import 'package:track_me_updated/features/exercises/presentation/views/widgets/target_dropdown.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
    required this.onNavigate,
  });
  final void Function(int) onNavigate;
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

final searchController = TextEditingController();
final bodyPartController = TextEditingController();
final targetController = TextEditingController();

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GetExerciseCubit, GetExerciseState>(
      listener: (context, state) {
        if (state is GetExerciseLoading) {
          widget.onNavigate(1);
        } else if (state is GetExerciseError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            content: Text(
              state.errMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ));
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "There is no quick, easy way to the body you want. Commit yourself now to your workout and get started.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ExpansionTile(
                  title: Text('Search Using Exercise Name',
                      style: Theme.of(context).textTheme.titleMedium),
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0.w),
                          child: Text(
                            "Type The Name Of The Exercise",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      child: SizedBox(
                        width: 250.w,
                        child: TextField(
                          onSubmitted: (value) async {
                            if (value.isNotEmpty) {
                              await context
                                  .read<GetExerciseCubit>()
                                  .getExerciseBySearch(name: value);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                content: Text(
                                  "Please Enter an Exercise Name",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ));
                            }
                          },
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Bench Press",
                            suffixIcon: IconButton(
                                onPressed: () => searchController.clear(),
                                icon: const Icon(Icons.clear)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Search Using BodyPart',
                      style: Theme.of(context).textTheme.titleMedium),
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0.w),
                          child: Text(
                            "Select a Bodypart To Find Exercises For",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      child: BodyPartDropDown(controller: bodyPartController),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (bodyPartController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                content: Text(
                                  "Please Select a BodyPart",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )));
                          } else {
                            context
                                .read<GetExerciseCubit>()
                                .getExerciseByBodyPart(
                                    bodyPart:
                                        bodyPartController.text.toLowerCase());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Find Exercises",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ))
                  ],
                ),
                ExpansionTile(
                  title: Text('Search Using Target Muscle',
                      style: Theme.of(context).textTheme.titleMedium),
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0.w),
                          child: Text(
                            "Select a Muscle To Find Exercises For",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      child: TargetDropDown(controller: targetController),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (targetController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                content: Text(
                                  "Please Select a Muscle",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )));
                          } else {
                            context
                                .read<GetExerciseCubit>()
                                .getExerciseByMuscle(
                                    targetMuscle:
                                        targetController.text.toLowerCase());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Find Exercises",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
