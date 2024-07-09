import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/constants.dart';

class BodyPartDropDown extends StatelessWidget {
  final TextEditingController controller;

  const BodyPartDropDown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> exercises = [
      const DropdownMenuEntry(value: "back", label: "Back"),
      const DropdownMenuEntry(value: "cardio", label: "Cardio"),
      const DropdownMenuEntry(value: "chest", label: "Chest"),
      const DropdownMenuEntry(value: "lower arms", label: "Lower Arms"),
      const DropdownMenuEntry(value: "lower legs", label: "Lower Legs"),
      const DropdownMenuEntry(value: "neck", label: "Neck"),
      const DropdownMenuEntry(value: "shoulders", label: "Shoulders"),
      const DropdownMenuEntry(value: "upper arms", label: "Upper Arms"),
      const DropdownMenuEntry(value: "upper legs", label: "Upper Legs"),
      const DropdownMenuEntry(value: "waist", label: "Waist"),
    ];
    return DropdownMenu<String>(
      menuStyle: MenuStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kExerciseLibaryDark
                      : kExerciseLibaryLight),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)))),
          maximumSize: WidgetStatePropertyAll(Size(250.w, 200.h))),
      width: 250.w,
      inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints(maxHeight: 60.h),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kExerciseLibaryDark
                      : kExerciseLibaryLight)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? kExerciseLibaryDark
                      : kExerciseLibaryLight))),
      trailingIcon: Icon(
        Icons.arrow_drop_down_sharp,
        color: Theme.of(context).brightness == Brightness.dark
            ? kExerciseLibaryDark
            : kExerciseLibaryLight,
      ),
      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up,
        color: Theme.of(context).brightness == Brightness.dark
            ? kExerciseLibaryDark
            : kExerciseLibaryLight,
      ),
      controller: controller,
      textStyle: Theme.of(context).textTheme.bodySmall,
      dropdownMenuEntries: exercises,
    );
  }
}
