import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';

class CustomSegmentButton extends StatefulWidget {
  const CustomSegmentButton({super.key});

  @override
  State<CustomSegmentButton> createState() => _CustomSegmentButtonState();
}

class _CustomSegmentButtonState extends State<CustomSegmentButton> {
  @override
  Widget build(BuildContext context) {
    var cubit = ThemeCubit.get(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeMode currentThemeMode = state.themeMode;
        return SegmentedButton(
          emptySelectionAllowed: false,
          showSelectedIcon: false,
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyles.body16Dark),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).colorScheme.primary;
              } else {
                return Theme.of(context).colorScheme.surface;
              }
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).colorScheme.onPrimary;
              } else {
                return Theme.of(context).colorScheme.onSurface;
              }
            }),
            side: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return BorderSide(color: Theme.of(context).colorScheme.primary);
              } else {
                return BorderSide(color: Theme.of(context).colorScheme.outline);
              }
            }),
          ),
          segments: const <ButtonSegment>[
            ButtonSegment(value: ThemeMode.light, label: Text('Light')),
            ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
            ButtonSegment(value: ThemeMode.system, label: Text('System')),
          ],
          selected: <ThemeMode>{currentThemeMode},
          onSelectionChanged: (newSelection) async {
            cubit.changeTheme(themeMode: newSelection.first);
            setState(() {});
          },
        );
      },
    );
  }
}
