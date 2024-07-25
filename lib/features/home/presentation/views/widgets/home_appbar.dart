import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text("Welcome to your health journey!",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        IconButton.outlined(
            onPressed: () {
              context.push('/settings');
            },
            icon: const Icon(Icons.settings))
      ],
    );
  }
}
