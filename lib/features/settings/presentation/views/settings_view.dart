import 'package:flutter/material.dart';
import 'package:track_me_updated/features/settings/presentation/views/widgets/custom_segment_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Theme: ",
                        style: Theme.of(context).textTheme.titleSmall),
                    const CustomSegmentButton()
                  ],
                )
              ],
            ),
          )),
    );
  }
}
