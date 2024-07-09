import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/constants.dart';

class TargetDropDown extends StatelessWidget {
  final TextEditingController controller;

  const TargetDropDown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> targets = [
      const DropdownMenuEntry(value: "abductors", label: "Abductors"),
      const DropdownMenuEntry(value: "abs", label: "Abs"),
      const DropdownMenuEntry(value: "adductors", label: "Adductors"),
      const DropdownMenuEntry(value: "biceps", label: "Biceps"),
      const DropdownMenuEntry(value: "calves", label: "Calves"),
      const DropdownMenuEntry(
          value: "cardiovascular system", label: "Cardiovascular System"),
      const DropdownMenuEntry(value: "delts", label: "Delts"),
      const DropdownMenuEntry(value: "forearms", label: "Forearms"),
      const DropdownMenuEntry(value: "glutes", label: "Glutes"),
      const DropdownMenuEntry(value: "hamstrings", label: "Hamstrings"),
      const DropdownMenuEntry(value: "lats", label: "Lats"),
      const DropdownMenuEntry(
          value: "levator scapulae", label: "Levator Scapulae"),
      const DropdownMenuEntry(value: "pectorals", label: "Pectorals"),
      const DropdownMenuEntry(value: "quads", label: "Quads"),
      const DropdownMenuEntry(
          value: "serratus anterior", label: "Serratus Anterior"),
      const DropdownMenuEntry(value: "spine", label: "Spine"),
      const DropdownMenuEntry(value: "traps", label: "Traps"),
      const DropdownMenuEntry(value: "triceps", label: "Triceps"),
      const DropdownMenuEntry(value: "upper back", label: "Upper Back"),
      const DropdownMenuEntry(value: "hamstrings", label: "Hamstrings"),
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
      dropdownMenuEntries: targets,
    );
  }
}
